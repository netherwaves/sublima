class WaterSystem extends System {
    // constants
    final int NUM_SPINS = 10;
    // props
    String[][] oscOut;
    float feedbackCoeff;
    // objects
    ArrayList<WaterSpin> spins;

    // constructor
    WaterSystem() {
        super("/watersys");

        spins = new ArrayList<WaterSpin>();
        for (int i = 0; i < NUM_SPINS; i++) {
            spins.add(new WaterSpin(i));
        }
        oscOut = new String[3][spins.size()];

        feedbackCoeff = 0.95;
    }

    // draw to screen
    void display() {
        rl.beginDraw();

        // update and draw all spins
        for (int i = 0; i < spins.size(); i++) {
            spins.get(i).animate();
            oscOut[0][i] = formatFloat(spins.get(i).getTheta(), 5);
            oscOut[1][i] = formatFloat(spins.get(i).getPan(), 5);
            oscOut[2][i] = formatFloat(spins.get(i).getVerticalMod(), 5);

            spins.get(i).display(rl.getGraphics());
        }

        // send OSC messages
        if (allowAnimate) {
            sendOSC(oscAddr + "/spin/angles", String.join(" ", oscOut[0]));
            sendOSC(oscAddr + "/spin/pans", String.join(" ", oscOut[1]));
            sendOSC(oscAddr + "/spin/mods", String.join(" ", oscOut[2]));
        }

        rl.endDraw();
        super.display();
    }
}


class WaterSpin {
    // properties
    private PVector pos;
    private float speed;
    private float orbSize, orbTrajRadius;
    private float theta;
    private int index;

    private boolean activated;

    // constructor
    WaterSpin(int _index) {
        index = _index;

        orbSize = random(4, 12);
        orbTrajRadius = random(20, 40);
        pos = new PVector(random(orbTrajRadius, width - orbTrajRadius), random(orbTrajRadius, height - orbTrajRadius));
        speed = random(0.5, 2);

        activated = false;
    }

    // draw to screen
    void display(PGraphics pg) {
        pg.fill(255, max(map(sin(theta), 0, 1, 0, 255), 0));
        pg.ellipse(
            pos.x + cos(theta) * orbTrajRadius,
            pos.y + sin(theta) * orbTrajRadius,
            orbSize, orbSize);
    }

    // update animation values
    void animate() {
        theta = map(frameCount, 0, 60, 0, PI * speed) % TWO_PI;
    }

    // mod point getters
    float getTheta() { return theta; }
    float getPan() { return map(pos.x, 0, width, -1, 1); }
    float getVerticalMod() { return map(pos.y, 0, height, 1, 0); }
}
