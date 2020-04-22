abstract class System {
    // props
    protected String oscAddr;
    protected int state;
    protected RenderLayer rl;

    protected float startTime;
    protected String tooltip;

    // constructor
    System(String _addr, float _fbCoeff, String _tooltip) {
        oscAddr = _addr;
        state = STATE_HIDDEN;
        rl = new RenderLayer(_fbCoeff);

        startTime = 0;
        tooltip = _tooltip;
    }

    // display/animate
    void animate() {
        // empty by default
    }
    void display() {
        rl.render();

        // display tooltip
        if (startTime > 0) {
            textFont(normsLight);
            textSize(11);
            textAlign(CENTER);
            fill(255, ahdsSlope((frameCount-startTime)/60.0 - 1.5, 2, 3.5) * 255);
            text(tooltip, width/2, height - 50);
        }
    }

    // manage transitions
    // TODO: tween channel and send OSC message accordingly
    void transitionIn() {
        state = STATE_VISIBLE;
        startTime = frameCount;
    }
    void transitionOut() {
        state = STATE_HIDDEN;
    }

    // EVENTS
    void click() {}
}