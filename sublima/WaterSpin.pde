class WaterSpin {
    // properties
    private PVector pos;
    private float speed;
    private float orbSize, orbTrajRadius;
    private float theta;
    private int index;

    // constructor
    WaterSpin(int _index) {
        index = _index;

        orbSize = random(4, 12);
        orbTrajRadius = random(20, 40);
        pos = new PVector(random(orbTrajRadius, width - orbTrajRadius), random(orbTrajRadius, height - orbTrajRadius));
        speed = random(0.5, 2);
    }

    // draw to screen
    void display() {
        fill(255, max(map(sin(theta), 0, 1, 0, 255), 0));
        ellipse(
            pos.x + cos(theta) * orbTrajRadius,
            pos.y + sin(theta) * orbTrajRadius,
            orbSize, orbSize);
    }

    // update animation values
    void animate() {
        theta = map(frameCount, 0, 60, 0, PI * speed) % TWO_PI;
    }

    // get theta value
    float getTheta() { return theta; }
    float getPan() { return map(pos.x, 0, width, -1, 1); }
}