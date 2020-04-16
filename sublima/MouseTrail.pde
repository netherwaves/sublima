// Mouse trail
class MouseTrail {
    // props
    int phase;
    PVector pos, displace;
    float vel;
    int wpThreshold;

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

        println(particles.size());
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
    void createIceParticle() {}

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
    // TODO: tween
    void setPhase(int newPhase) {
        phase = newPhase;
    }
}


// global particle abstraction
abstract class Particle {
    PVector pos;
    float startTime, lifespan;
    float deathStart, deathLength;
    boolean alive, deathQueued;

    // constructor
    // set lifespan to 0 for an infinite particle
    Particle(PVector _pos, float _lifespan) {
        pos = _pos.copy();
        startTime = frameCount;
        lifespan = _lifespan;

        deathQueued = false;

        alive = true; // sorry for the semantic mixup, this is easier for me to manage
    }

    // draw to screen
    void update(PVector mousePos) {
        if (lifespan > 0) alive = frameCount < startTime + lifespan;
        if (deathQueued) alive = frameCount < deathStart + deathLength;
    }
    void display(PGraphics pg) {}

    // -- event hooks --
    // not every particle subclass uses all these methods at once;
    // eg. the queueDeath() and isDying() methods are currently only used by VaporParticle
    // due to its special typology in the context of the application
    boolean isDying() { return deathQueued && alive; }
    boolean isDead() { return !alive; }

    void queueDeath() {
        deathQueued = true;
        deathStart = frameCount;
        deathLength = 60 * 2;
    }
    void kill() { alive = false; }
    void resurrect() {
        deathQueued = false;
        alive = true;
        deathStart = deathLength = 0;
    }
}

// water particles
class WaterParticle extends Particle {
    // props
    PVector dir;
    float vel, opacity;
    color fillColor;

    WaterParticle(PVector _pos, PVector _dir, float _vel) {
        super(_pos, random(frameRate, frameRate * 2));
        dir = _dir.copy().normalize();
        vel = _vel;

        // rotate direction vector by random theta
        float theta = random(-QUARTER_PI, QUARTER_PI);
        dir.rotate(theta);

        // create random color (tint of cyan / blue)
        colorMode(HSB, 360, 100, 100);
        fillColor = color(random(150, 230), random(60, 80), random(50, 80));
        colorMode(RGB, 255, 255, 255);

        // send OSC message
        String[] oscParams = {
            String.format("%.5f", pos.x),
            String.format("%.5f", pos.y),
            String.format("%.5f", dir.x),
            String.format("%.5f", dir.y)
        };
        sendOSC("/mousetrail/water/particle", String.join(" ", oscParams));
    }

    // update position, velocity and opacity
    void update(PVector mousePos) {
        // vel -= initVel/(60*lifespan);
        vel *= 0.95;
        vel = max(0, vel);
        pos.add(PVector.mult(dir, vel));

        opacity = constrain(map(frameCount - startTime, 0, lifespan, 2.3, 0), 0, 1) * 255;

        super.update(mousePos);
    }

    void display(PGraphics pg) {
        pg.fill(fillColor, opacity);
        pg.ellipse(pos.x, pos.y, 4, 4);
    }
}

// vapor particles
class VaporParticle extends Particle {
    float noiseIndex, opacity, particleSize, orbitRadius;
    PVector displace;

    VaporParticle(PVector _pos) {
        super(_pos, 0);

        // random noise offset for each particle
        noiseIndex = random(10);
        orbitRadius = 0;
        particleSize = 5;
        displace = new PVector(0, 0);
    }

    void update(PVector mousePos) {
        // general position follows mouse by easing factor
        pos.add(PVector.sub(mousePos, pos).mult(0.025));

        // update drawing props
        opacity = map((float)SimplexNoise.noise(noiseIndex, frameCount / 30.0, 0), -1, 1, 0.3, 0.8);
        particleSize = map((float)SimplexNoise.noise(noiseIndex, frameCount / 60.0, 1), -1, 1, 3, 7);

        // update position offset
        orbitRadius = map((float)SimplexNoise.noise(noiseIndex, frameCount / 90.0, 2), -1, 1, 25, 50);
        displace.set(
            (float)SimplexNoise.noise(noiseIndex, frameCount / 80.0, 3) * orbitRadius,
            (float)SimplexNoise.noise(noiseIndex, frameCount / 80.0, 4) * orbitRadius
        );

        super.update(mousePos);
    }

    void display(PGraphics pg) {
        // add offset to mouse tracker
        PVector displacedPos = PVector.add(pos, displace);

        // draw to render layer
        pg.fill(255, opacity * 255 * (deathQueued ? map(frameCount - deathStart, 0, 60 * 2, 1, 0) : 1));
        pg.ellipse(displacedPos.x, displacedPos.y, particleSize, particleSize);
    }
}

// ice particles
class IceParticle extends Particle {
    IceParticle(PVector _pos) {
        super(_pos, random(frameRate, frameRate * 2));
    }

    void update(PVector mousePos) {}
    void display(PGraphics pg) {}
}