// Mouse trail
class MouseTrail {
    int phase;
    PVector pos, displace;

    // constructor
    MouseTrail() {
        phase = PHASE_IDLE;

        pos = new PVector(mouseX, mouseY);
        displace = new PVector(0, 0);
    }

    // draw to screen
    void display() {
        fill(255, 0, 0);
        ellipse(pos.x, pos.y, 10, 10);
    }

    // update animation variables
    void animate() {
        displace = PVector.sub(new PVector(mouseX, mouseY), pos).mult(0.05);
        pos.add(displace);
    }

    // self-explanatory
    void sendOSCMessages() {
        sendOSC("/mousetrail/x", pos.x);
        sendOSC("/mousetrail/y", pos.y);
        sendOSC("/mousetrail/vel", displace.mag());
    }

    // alter mouse trail state
    // TODO: tween
    void changePhase(int newPhase) {
        phase = newPhase;
    }
}