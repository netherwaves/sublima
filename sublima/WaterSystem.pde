class WaterSystem extends System {
    // constants
    private final int NUM_SPINS = 10;
    // props
    private String[][] oscOut;
    // objects
    private ArrayList<WaterSpin> spins;

    // constructor
    WaterSystem() {
        super("/watersys", 0.95);

        spins = new ArrayList<WaterSpin>();
        for (int i = 0; i < NUM_SPINS; i++) {
            spins.add(new WaterSpin(i));
        }
        oscOut = new String[3][spins.size()];
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
    private PVector pos, displace;
    private float speed, orbSize, radius, theta;
    private int index;
    private boolean activated, isMouseOver;

    // constructor
    WaterSpin(int _index) {
        index = _index;

        orbSize = random(4, 12);
        radius = random(20, 40);
        pos = new PVector(random(radius*2, width - (radius*2)), random(radius*2, height - (radius*2)));
        displace = new PVector(0, 0);
        speed = random(0.5, 2);

        activated = false;
        isMouseOver = false;
    }

    // draw to screen
    void display(PGraphics pg) {
        colorMode(HSB, 360, 100, 100);
        color c = color(frameCount%360.0, 75, 70);
        colorMode(RGB, 255, 255, 255);

        pg.pushMatrix();
        pg.translate(pos.x + displace.x, pos.y + displace.y);

        pg.fill(activated ? c : 255, isMouseOver ? 255 : map(sin(frameCount/30.0 + index), -1, 1, 5, 25));
        pg.ellipse(0, 0, radius, radius);

        pg.fill(activated ? c : 255, map(sin(theta), -1, 1, 10, 255));
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
        theta = map(frameCount, 0, 60, 0, PI * speed) % TWO_PI;
    }

    // mod point getters
    float getTheta() { return theta; }
    float getPan() { return map(pos.x + displace.x, 0, width, -1, 1); }
    float getVerticalMod() { return map(pos.y + displace.y, 0, height, 1, 0); }

    // check collision with mouse
    boolean updateMouseOver() {
        PVector mousePos = mouseTrail.getPos();
        return PVector.dist(mousePos, PVector.add(pos, displace)) < radius;
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