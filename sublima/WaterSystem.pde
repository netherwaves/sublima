class WaterSystem extends System {
    // constants
    private final int NUM_SPINS = 10;
    // props
    private String[][] oscOut;
    private float feedbackCoeff;
    // objects
    private ArrayList<WaterSpin> spins;

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

    void click() {
        for (int i = 0; i < spins.size(); i++) {
            spins.get(i).click();
        }
    }
}


class WaterSpin {
    // properties
    private PVector pos;
    private float speed, orbSize, radius, theta, valueToActivated;
    private int index, secondsToActivation;
    private boolean activated, isMouseOver;

    // constructor
    WaterSpin(int _index) {
        index = _index;

        orbSize = random(4, 12);
        radius = random(20, 40);
        pos = new PVector(random(radius, width - radius), random(radius, height - radius));
        speed = random(0.5, 2);

        activated = false;
        isMouseOver = false;
        valueToActivated = 0;
        secondsToActivation = 3;
    }

    // draw to screen
    void display(PGraphics pg) {
        colorMode(HSB, 360, 100, 100);
        color c = color(frameCount%360.0, 75, 70);
        colorMode(RGB, 255, 255, 255);

        pg.fill(activated ? c : 255, isMouseOver ? 255 : 0);
        pg.ellipse(pos.x, pos.y, radius, radius);

        pg.fill(activated ? c : 255, max(map(sin(theta), 0, 1, 0, 255), 0));
        pg.ellipse(
            pos.x + cos(theta) * radius,
            pos.y + sin(theta) * radius,
            orbSize, orbSize);
    }

    // update animation values
    void animate() {
        isMouseOver = updateMouseOver();

        theta = map(frameCount, 0, 60, 0, PI * speed) % TWO_PI;
    }

    // mod point getters
    float getTheta() { return theta; }
    float getPan() { return map(pos.x, 0, width, -1, 1); }
    float getVerticalMod() { return map(pos.y, 0, height, 1, 0); }

    // check collision with mouse
    boolean updateMouseOver() {
        PVector mousePos = mouseTrail.getPos();
        return PVector.dist(mousePos, pos) < radius;
    }

    // get click event and activate consequently
    void click() {
        if (isMouseOver) {
            if (!activated) {
                // SEND ACTIVATION EVENTS TO MAX/MSP
            }
            activated = true;
        }
    }
}