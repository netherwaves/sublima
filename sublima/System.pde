abstract class System {
    // props
    String oscAddr;
    int state;
    RenderLayer rl;

    // constructor
    System(String addr, float fbCoeff) {
        oscAddr = addr;
        state = STATE_HIDDEN;

        rl = new RenderLayer(fbCoeff);
    }

    // display/animate
    void animate() {
        // empty by default
    }
    void display() {
        rl.render();
    }

    // manage transitions
    // TODO: tween channel and send OSC message accordingly
    void transitionIn() {
        state = STATE_VISIBLE;
    }
    void transitionOut() {
        state = STATE_HIDDEN;
    }

    // EVENTS
    void click() {}
}