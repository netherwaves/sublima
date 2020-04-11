abstract class System {
    // props
    String oscAddr;
    int state;
    PGraphics rl; // short for "render layer"

    // constructor
    System(String addr) {
        oscAddr = addr;
        state = STATE_HIDDEN;

        rl = createGraphics(width, height);
    }

    // display/animate
    void animate() {
        // empty by default
    }
    void display() {
        image(rl, 0, 0);
    }

    // manage transitions
    // TODO: tween channel and send OSC message accordingly
    void transitionIn() {
        state = STATE_VISIBLE;
    }
    void transitionOut() {
        state = STATE_HIDDEN;
    }
}