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
            p.update();

            if (p.isDead()) {
                particles.remove(i);
                continue;
            } else {
                p.display(pg);
            }
        }

        rl.endDraw();
        rl.render();

        fill(255, 0, 0);
        ellipse(pos.x, pos.y, 10, 10);
    }

    // manages water particle generation logic
    void createWaterParticle() {
        // instanciate randomly depending on intensity of mouse velocity
        float instanciate = random(vel);
        if (instanciate > wpThreshold) {
            particles.add(new WaterParticle(pos, displace, vel*0.1));
        }
    }

    // manages vapor particle generation logic
    void createVaporParticle() {

    }

    // manages ice particle generation logic
    void createIceParticle() {

    }

    // update animation variabless
    void animate() {
        displace = PVector.sub(new PVector(mouseX, mouseY), pos).mult(0.2);
        vel = displace.mag();
        pos.add(displace);
    }

    // self-explanatory
    void sendOSCMessages() {
        sendOSC("/mousetrail/x", pos.x);
        sendOSC("/mousetrail/y", pos.y);
        sendOSC("/mousetrail/vel", vel);
    }

    // alter mouse trail state
    // TODO: tween
    void setPhase(int newPhase) {
        phase = newPhase;
    }
}


abstract class Particle {
    PVector pos;
    float startTime, lifespan;

    Particle(PVector _pos, float _lifespan) {
        pos = _pos.copy();
        startTime = frameCount;
        lifespan = _lifespan;
    }

    // draw to screen
    void update() {}
    void display(PGraphics pg) {}

    boolean isDead() {
        return frameCount > startTime + lifespan;
    }
}

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
    }

    // update position, velocity and opacity
    void update() {
        // vel -= initVel/(60*lifespan);
        vel *= 0.95;
        vel = max(0, vel);
        pos.add(PVector.mult(dir, vel));

        opacity = constrain(map(frameCount - startTime, 0, lifespan, 2.3, 0), 0, 1) * 255;
    }

    void display(PGraphics pg) {
        pg.fill(fillColor, opacity);
        pg.ellipse(pos.x, pos.y, 4, 4);
    }
}

class IceParticle extends Particle {
    IceParticle(PVector _pos) {
        super(_pos, random(frameRate, frameRate * 2));
    }

    void update() {}
    void display(PGraphics pg) {}
}

class VaporParticle extends Particle {
    VaporParticle(PVector _pos) {
        super(_pos, random(frameRate, frameRate * 2));
    }

    void update() {}
    void display(PGraphics pg) {}
}
