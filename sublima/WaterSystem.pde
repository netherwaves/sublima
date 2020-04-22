class WaterSystem extends System {
    // constants
    private final int NUM_SPINS = 10;
    // props
    private String[][] oscOut;
    private boolean isPhaseDone;
    // objects
    private ArrayList<WaterSpin> spins;

    // constructor
    WaterSystem() {
        super("/watersys", 0.95, "activate the streams");

        spins = new ArrayList<WaterSpin>();
        for (int i = 0; i < NUM_SPINS; i++) {
            spins.add(new WaterSpin(i));
        }
        isPhaseDone = false;
        // -- OUTGOING WATERSPIN PARAMETERS --
        // [0] circle orbit angle (in radians)
        // [1] X position (in px)
        // [2] Y position (in px)
        // [3] 1 if mouse over center sphere; 0 otherwise
        // [4] 1 if spin is activated; 0 otherwise
        oscOut = new String[5][spins.size()];
    }

    void animate() {
        // update animation variables & OSC messages
        isPhaseDone = true;
        WaterSpin ws;
        for (int i = 0; i < spins.size(); i++) {
            // update
            ws = spins.get(i);
            ws.animate();

            // if there are still non-activated spins, prevent next phase trigger
            if (ws.getActivated() == 0) isPhaseDone = false;

            // parse OSC messages
            oscOut[0][i] = formatFloat(ws.getTheta(), 5);
            oscOut[1][i] = formatFloat(ws.getPan(), 5);
            oscOut[2][i] = formatFloat(ws.getVerticalMod(), 5);
            oscOut[3][i] = String.format("%d", ws.getMouseOver());
            oscOut[4][i] = String.format("%d", ws.getActivated());
        }

        // next phase event listener
        if (isPhaseDone) triggerNextPhase();
    }

    // draw to screen
    void display() {
        rl.beginDraw();

        // draw all spins
        WaterSpin ws;
        for (int i = 0; i < spins.size(); i++) {
            spins.get(i).display(rl.getGraphics());
        }

        // send OSC messages
        if (allowAnimate) {
            sendOSC(oscAddr + "/spin/angles", String.join(" ", oscOut[0]));
            sendOSC(oscAddr + "/spin/pans", String.join(" ", oscOut[1]));
            sendOSC(oscAddr + "/spin/mods", String.join(" ", oscOut[2]));
            sendOSC(oscAddr + "/spin/hovered", String.join(" ", oscOut[3]));
            sendOSC(oscAddr + "/spin/activated", String.join(" ", oscOut[4]));
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
    private PVector pos, displace;
    private float speed, orbSize, radius, theta;
    private int index;
    private boolean isActivated, isMouseOver;

    // constructor
    WaterSpin(int _index) {
        index = _index;

        orbSize = random(4, 12);
        radius = random(20, 40);
        pos = new PVector(random(radius*2, width - (radius*2)), random(radius*2, height - (radius*2)));
        displace = new PVector(0, 0);
        speed = random(1, 3);

        isActivated = false;
        isMouseOver = false;
    }

    // draw to screen
    void display(PGraphics pg) {
        colorMode(HSB, 360, 100, 100);
        color c = color(frameCount%360.0, 75, 70);
        colorMode(RGB, 255, 255, 255);

        pg.pushMatrix();
        pg.translate(pos.x + displace.x, pos.y + displace.y);

        // activation beacon
        pg.fill(isActivated ? c : 255, isMouseOver ? 255 : map(sin(frameCount/30.0 + index), -1, 1, 5, 25));
        pg.ellipse(0, 0, radius, radius);
        // orbiting circle
        pg.fill(isActivated ? c : 255, map(sin(theta), -1, 1, 10, 255));
        pg.ellipse(
            cos(theta) * radius,
            sin(theta) * radius,
            orbSize, orbSize);

        pg.popMatrix();
    }

    // update animation values
    void animate() {
        isMouseOver = updateMouseOver();
        displace.set(
            (float)SimplexNoise.noise(index, frameCount/(60.0*10), 2) * radius*2,
            (float)SimplexNoise.noise(index, frameCount/(60.0*10), 5) * radius*2
        );
        theta += PI * speed * (isActivated ? 1.0 : 0.4) / 60.0;
        // theta = map(frameCount, 0, 60, 0, PI * speed) % TWO_PI;
    }

    // mod point getters
    float getTheta() { return theta; }
    float getPan() { return map(pos.x + displace.x, 0, width, -1, 1); }
    float getVerticalMod() { return map(pos.y + displace.y, 0, height, 1, 0); }
    int getMouseOver() { return isMouseOver ? 1 : 0; }
    int getActivated() { return isActivated ? 1 : 0; }

    // check collision with mouse
    boolean updateMouseOver() {
        PVector mousePos = mouseTrail.getPos();
        return PVector.dist(mousePos, PVector.add(pos, displace)) < radius;
    }

    // get click event and activate consequently
    void click() {
        if (isMouseOver) isActivated = true;
    }
}