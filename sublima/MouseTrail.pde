// Mouse trail
class MouseTrail {
    // props
    int phase;
    PVector pos, displace;
    float vel;
    // phase-exclusive props
    int wpThreshold;
    float ipStart, ipDelay;

    // objects
    RenderLayer rl;
    ArrayList<Particle> particles;

    // constructor
    MouseTrail() {
        phase = PHASE_IDLE;

        pos = new PVector(mouseX, mouseY);
        displace = new PVector(0, 0);
        vel = 0;

        wpThreshold = 20;
        ipStart = frameCount;

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

            p.update(pos);
            if (p.isDead()) {
                particles.remove(i);
                continue;
            }

            // queue vapor particle deletion if outside PHASE_VAPOR state
            if (phase != PHASE_VAPOR && p instanceof VaporParticle) {
                if (!p.isDying()) p.queueDeath();
            }

            p.display(pg);
        }

        rl.endDraw();
        rl.render();

        fill(255, 0, 0);
        ellipse(pos.x, pos.y, 10, 10);
    }

    // manages water particle generation logic
    void createWaterParticle() {
        // instanciate randomly depending on mouse velocity
        float instanciate = random(vel);
        if (instanciate > wpThreshold) {
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
        for (int j = 0; j < 12; j++) {
            particles.add(new VaporParticle(pos));
        }
    }

    // manages ice particle generation logic
    void createIceParticle() {
        // start timer if beyond set delay
        if (frameCount > ipStart + ipDelay) {
            ipStart = frameCount;
            ipDelay = pow(random(0, 1), 2) * map(constrain(vel, 0, 40), 0, 40, frameRate, frameRate/10);
            println(ipDelay);

            // create new particle on timer reinit
            particles.add(new IceParticle(pos, vel));
        }
    }

    // update animation variabless
    void animate() {
        displace = PVector.sub(new PVector(mouseX, mouseY), pos).mult(0.2);
        vel = displace.mag();
        pos.add(displace);

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

    float getVelocity() { return vel; }
}