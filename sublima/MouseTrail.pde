// Mouse trail
class MouseTrail {
    // props
    private int phase;
    private PVector pos, displace, posSmooth, displaceSmooth;
    private float vel, velSmooth, thetaSmooth;
    // phase props
    private int wpThreshold;
    private float ipStart, ipDelay;
    // mouse halo props
    private float haloTimer;
    private boolean isInteractive;

    // objects
    RenderLayer rl;
    ArrayList<Particle> particles;

    // constructor
    MouseTrail() {
        phase = PHASE_IDLE;

        // initialize coarse-eased position
        pos = new PVector(mouseX, mouseY);
        displace = new PVector(0, 0);
        vel = 0;
        // initialize smooth-eased position
        posSmooth = new PVector(mouseX, mouseY);
        displaceSmooth = new PVector(0, 0);
        velSmooth = 0;
        // initialize phase props
        wpThreshold = 10;
        ipStart = frameCount;
        // initialize mouse halo props
        haloTimer = 0;
        isInteractive = false;
        // initialize objects
        rl = new RenderLayer(0.93);
        particles = new ArrayList<Particle>();
    }

    // draw to screen
    void display() {
        rl.beginDraw();
        PGraphics pg = rl.getGraphics();

        // generate corresponding particle type
        switch (phase) {
            case PHASE_WATER: createWaterParticle(); break;
            case PHASE_VAPOR: createVaporParticle(); break;
            case PHASE_ICE:   createIceParticle();   break;
        }

        // update particles
        for (int i = 0; i < particles.size(); i++) {
            Particle p = particles.get(i);

            // update particle and remove if dead
            p.update(pos);
            if (p.isDead()) {
                particles.remove(i);
                continue;
            }

            // queue vapor particle deletion if outside PHASE_VAPOR state
            if (phase != PHASE_VAPOR && p instanceof VaporParticle) {
                if (!p.isDying()) p.queueDeath();
            }

            // display to PGraphics
            p.display(pg);
        }

        // end and render
        rl.endDraw();
        rl.render();

        // mouse halo
        drawCursor();
    }

    // manages water particle generation logic
    void createWaterParticle() {
        // instanciate randomly depending on mouse velocity
        float instanciate = random(vel/wpThreshold);
        if (instanciate > 1.5) {
            particles.add(new WaterParticle(pos, displace, vel*0.1));
        }
    }

    // manages vapor particle generation logic
    void createVaporParticle() {
        // TODO: check if particles were already existing

        // the inefficient way to check if the function's already been called
        // could be done with a boolean but ehh, we'll see
        for (int i = particles.size(); i > 0; i--) {
            if (particles.get(i - 1) instanceof VaporParticle) return;
        }

        // create 12-15 hovering particles, once
        int numVaporParticles = 12;
        for (int j = 0; j < numVaporParticles; j++) {
            particles.add(new VaporParticle(pos));
        }
        sendOSC("/mousetrail/vapor/hovers/size", numVaporParticles);
    }

    // manages ice particle generation logic
    void createIceParticle() {
        // start timer if beyond set delay
        if (frameCount > ipStart + ipDelay) {
            ipStart = frameCount;
            ipDelay = pow(random(0, 1), 2) * map(constrain(vel, 0, 40), 0, 40, frameRate, frameRate/10);

            // create new particle on timer reinit
            particles.add(new IceParticle(pos, vel));
        }
    }

    // draw mouse halo
    void drawCursor() {
        pushMatrix();
        translate(pos.x, pos.y);
        scale(map(velSmooth, 0, 60, 1, 1.4));

        // fake circle gradient background
        float radius = map(sin(frameCount/40.0), -1, 1, 25, 30);
        float opacity = map(sin(frameCount/41.0 + 10), -1, 1, 15, 40) * map(velSmooth, 0, 60, 1, 1.3);
        for (int i = (int)radius; i >= 1; i--) {
            fill(lerpColor(color(255, opacity), color(0, opacity), pow(i / radius, 2.0)));
            ellipse(0, 0, i*2, i*2);
        }

        // center cursor
        // TODO: change shape depending on phase (circle-triangle-square)
        // TODO: change center cursor color depending on interactive state
        fill(0);
        strokeWeight(1);
        stroke(127);
        ellipse(constrain(displaceSmooth.x, -radius, radius), constrain(displaceSmooth.y, -radius, radius), 12, 12);

        // mouse direction arc
        haloTimer += map(vel, 0, 60, 3, 15);
        noFill();
        strokeWeight(3);
        stroke(10);
        pushMatrix();
        rotate(thetaSmooth);
        arc(0, 0, radius*0.9, radius*0.9, -QUARTER_PI/2, QUARTER_PI/2);
        popMatrix();
        noStroke();

        popMatrix();
    }

    // update animation variables
    void animate() {
        // coarse
        displace = PVector.sub(new PVector(mouseX, mouseY), pos).mult(0.25);
        vel = displace.mag();
        pos.add(displace);
        // smooth
        displaceSmooth = PVector.sub(new PVector(mouseX, mouseY), posSmooth).mult(0.08);
        velSmooth = displaceSmooth.mag();
        posSmooth.add(displaceSmooth);
        float thetaCoarse = (displaceSmooth.y < 0 ? -1 : 1) * PVector.angleBetween(new PVector(1, 0), displaceSmooth);
        thetaSmooth += (thetaCoarse - thetaSmooth) * 0.08;

        // send out global mousetrail variables to Max/MSP
        sendOSCMessages();
    }

    // self-explanatory
    void sendOSCMessages() {
        sendOSC("/mousetrail/x", map(pos.x, 0, width, 0, 1));
        sendOSC("/mousetrail/y", map(pos.y, 0, height, 0, 1));
        sendOSC("/mousetrail/vel", vel);
    }

    // alter mouse trail state
    void setPhase(int newPhase) {
        phase = newPhase;
    }

    // mouse halo interactive state modifiers
    // void trigInteractive() { isInteractive = true; }
    // void detrigInteractive() { isInteractive = false; }

    // getters
    float getVelocity() { return vel; }
    PVector getPos() { return pos; }
}