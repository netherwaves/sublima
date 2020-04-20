// global particle abstraction
abstract class Particle {
    protected PVector pos;
    protected float startTime, lifespan;
    protected float deathStart, deathLength;
    protected boolean alive, deathQueued;

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
    private PVector dir;
    private float vel, opacity;
    private color fillColor;

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
            String.format("%.5f", map(pos.x, 0, width, -1, 1)),
            String.format("%.5f", map(pos.y, 0, height, -1, 1)),
            String.format("%.5f", PVector.angleBetween(dir, new PVector(1, 0)))
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
    private float noiseIndex, opacity, particleSize, orbitRadius;
    private PVector displace;

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

        // send OSC message
        sendOSC("/mousetrail/vapor/hovers/posx", String.format("%.5f", pos.x/width));
        sendOSC("/mousetrail/vapor/hovers/posy", String.format("%.5f", pos.y/height));
        sendOSC("/mousetrail/vapor/hovers/noisex", String.format("%.5f", displace.x/orbitRadius));
        sendOSC("/mousetrail/vapor/hovers/noisey", String.format("%.5f", displace.y/orbitRadius));

        super.update(mousePos);
    }

    void display(PGraphics pg) {
        // add offset to mouse tracker
        PVector displacedPos = PVector.add(pos, displace);

        // draw to render layer
        pg.fill(255, opacity * 255 * (deathQueued ? map(frameCount - deathStart, 0, 60 * 2, 1, 0) : 1));
        pg.ellipse(displacedPos.x, displacedPos.y, particleSize, particleSize);
    }

    PVector getPos() { return pos; }
    PVector getDisplace() { return displace; }
}

// ice particles
class IceParticle extends Particle {
    private color fillColor;
    private float size, cornerBevel, theta, noiseIndex, vel;
    private PVector flicker;

    IceParticle(PVector _pos, float _vel) {
        super(_pos, random(frameRate * 0.5, frameRate));
        vel = _vel;

        // random color (very faded blue)
        colorMode(HSB, 360, 100, 100);
        fillColor = color(random(150, 230), random(10, map(vel, 0, 40, 30, 60)), random(40, 75));
        colorMode(RGB, 255, 255, 255);

        size = random(5, map(vel, 0, 40, 15, 50));
        cornerBevel = random(0.5, 1);
        theta = random(0, TWO_PI);
        noiseIndex = random(30);
        flicker = new PVector(0, 0);

        // send OSC message
    }

    void update(PVector mousePos) {
        float intensity = map(frameCount, startTime, startTime + lifespan, map(vel, 0, 40, 10, 20), 0);
        flicker.set(
            (float)SimplexNoise.noise(noiseIndex, frameCount/2.0, 0) * intensity,
            (float)SimplexNoise.noise(noiseIndex, frameCount/2.0, 1) * intensity
        );
    }
    void display(PGraphics pg) {
        pg.fill(fillColor, map(frameCount, startTime, startTime + lifespan, 150, 0));
        pg.pushMatrix();
        pg.translate(pos.x - (size/2) + flicker.x, pos.y - (size/2) + flicker.y);
        pg.rotate(theta);
        pg.rect(0, 0, size, size, size/2*cornerBevel);
        pg.popMatrix();
    }
}