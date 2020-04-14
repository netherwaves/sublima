// Mouse trail
class MouseTrail {
    int phase;
    PVector pos, displace;
    float vel;
    int particleThreshold;

    ArrayList<WaterParticle> particles;

    // constructor
    MouseTrail() {
        phase = PHASE_IDLE;

        pos = new PVector(mouseX, mouseY);
        displace = new PVector(0, 0);
        vel = 0;
        particleThreshold = 20;

        particles = new ArrayList<WaterParticle>();
    }

    // draw to screen
    void display() {
        fill(255, 0, 0);
        ellipse(pos.x, pos.y, 10, 10);

        // create new water particle
        float instanciate = random(vel);
        if (instanciate > particleThreshold) {
            particles.add(new WaterParticle(pos, displace, vel*0.1));
        }

        // update particles
        for (int i = 0; i < particles.size(); i++) {
            WaterParticle p = particles.get(i);
            p.update();

            if (p.isDead()) {
                particles.remove(i);
                continue;
            } else {
                p.display();
            }
        }
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


class WaterParticle {
    // props
    PVector pos, dir;
    float initVel, vel;
    float opacity;
    color fillColor;
    float lifespan;

    WaterParticle(PVector _pos, PVector _dir, float _vel) {
        pos = _pos.copy();
        dir = _dir.copy().normalize();
        // rotate direction vector by random theta
        float theta = random(-QUARTER_PI, QUARTER_PI);
        dir.rotate(theta);

        // initialize dynamic data
        initVel = _vel;
        vel = initVel;
        opacity = 255;
        lifespan = random(0.6, 1.3);

        // create random color (tint of cyan / blue)
        colorMode(HSB, 360, 100, 100);
        fillColor = color(random(160, 220), random(60, 80), random(50, 80));
        colorMode(RGB, 255, 255, 255);
    }

    // update position, velocity and opacity
    void update() {
        // vel -= initVel/(60*lifespan);
        vel *= 0.95;
        vel = max(0, vel);
        pos.add(PVector.mult(dir, vel));

        if (vel < initVel/3) {
            opacity -= 10;
            opacity = max(0, opacity);
        }
    }

    void display() {
        fill(fillColor, opacity);
        ellipse(pos.x, pos.y, 4, 4);
    }

    boolean isDead() {
        return opacity == 0;
    }
}

class IceParticle {
    IceParticle() {

    }
}

class VaporParticle {
    VaporParticle() {

    }
}