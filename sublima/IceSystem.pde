class IceSystem extends System {
    // constants
    private final int NUM_TRACKS = 9;
    // objects
    IceTrack[] tracks;
    // props
    private String[][] oscOut;

    IceSystem() {
        super("/icesys", 1, "the water's freezing");

        tracks = new IceTrack[NUM_TRACKS];
        for (int i = 0; i < tracks.length; i++) {
            tracks[i] = new IceTrack();
        }

        // -- OUTGOING ICETRACK PARAMS --
        // [0] X position
        // [1] Y position
        // [2] bounces left
        // [3] speed
        oscOut = new String[4][tracks.length];
    }

    void animate() {
        IceTrack it;
        for (int i = 0; i < tracks.length; i++) {
            it = tracks[i];
            tracks[i].animate();

            // parse OSC messages
            oscOut[0][i] = formatFloat(it.getPos().x / width, 5);
            oscOut[1][i] = formatFloat(it.getPos().y / height, 5);
            oscOut[2][i] = String.format("%d", it.getBouncesLeft());
            oscOut[3][i] = formatFloat(map(it.getFullSpeed(), 0.63, 3, 0, 1), 5);
        }
    }

    void display() {
        rl.beginDraw();
        PGraphics pg = rl.getGraphics();

        // draw tracks
        for (int i = 0; i < tracks.length; i++) {
            tracks[i].display(pg);
        }

        // send OSC messages
        if (allowMSP) {
            sendOSC(oscAddr + "/track/x", String.join(" ", oscOut[0]));
            sendOSC(oscAddr + "/track/y", String.join(" ", oscOut[1]));
            sendOSC(oscAddr + "/track/bounces_left", String.join(" ", oscOut[2]));
            sendOSC(oscAddr + "/track/speed", String.join(" ", oscOut[3]));
        }

        rl.endDraw();
        super.display();
    }
}


class IceTrack {
    private int startBorder, bouncesLeft;
    private PVector pos, dir;
    private float theta, speed, velFactor;

    IceTrack() {
        // 0 = top, 1 = right, 2 = bottom, 3 = left
        startBorder = floor(random(4));
        bouncesLeft = 3;

        // determine starting position
        pos = new PVector(0, 0);
        if (startBorder % 2 == 0) {
            pos.x = random(width);
            pos.y = startBorder/2 > 0 ? 0 : height;
        } else {
            pos.x = startBorder/2 > 0 ? width : 0;
            pos.y = random(height);
        }

        // determine direction depending on starting border
        dir = PVector.fromAngle(random(0.2, PI - 0.2) + ((startBorder+2)*HALF_PI));

        // drunk trajectory angle
        // (currently null but we'll get to that later. just don't forget i guess lmao)
        theta = 0;
        // speed
        speed = random(0.7, 1.2);
    }

    void animate() {
        // autoblock
        if (bouncesLeft < 0) return;

        // update position
        velFactor = map(mouseTrail.getVelocity(), 0, 60, 0.9, 2.8);
        pos.add(PVector.mult(dir, speed * velFactor));

        // calculate border bounce [NEXT]
        if ((pos.x > width && dir.x > 0) || (pos.x < 0 && dir.x < 0)) {
            dir.x *= -1;
            bouncesLeft--;
        }
        if ((pos.y > height && dir.y > 0) || (pos.y < 0 && dir.y < 0)) {
            dir.y *= -1;
            bouncesLeft--;
        }

        // check if bounces are done and execute set of actions ONCE
        if (bouncesLeft < 0) {
            // do stuff here, soon :)
        }
    }

    void display(PGraphics pg) {
        pg.stroke(#66948B, 70);
        pg.strokeWeight(3);
        pg.point(pos.x, pos.y);
        pg.stroke(#66948B);
        pg.strokeWeight(2);
        pg.point(pos.x, pos.y);
    }

    // getters
    PVector getPos() { return pos; }
    int getBouncesLeft() { return bouncesLeft; }
    float getSpeed() { return speed; }
    float getFullSpeed() { return speed * velFactor; }
    float getVelFactor() { return velFactor; }
}
