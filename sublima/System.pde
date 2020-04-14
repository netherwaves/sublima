abstract class System {
    // props
    String oscAddr;
    int state;
    PGraphics rlMain, rlSub; // rl is short for "render layer"

    // constructor
    System(String addr) {
        oscAddr = addr;
        state = STATE_HIDDEN;

        rlMain = createGraphics(width, height);
        rlSub = createGraphics(width, height);

        // IMPORTANT:
        // this is so that rlSub already has pixel data when transferred to from rlMain
        rlSub.beginDraw();
        rlSub.endDraw();
    }

    // display/animate
    void animate() {
        // empty by default
    }
    void display() {
        image(rlMain, 0, 0);
        rlSub = copyGraphics(rlMain, rlSub);
    }

    // render feedback layer to main layer
    void displaySub(float feedback) {
        rlMain.tint(255, 255 * feedback);
        rlMain.image(rlSub, 0, 0);
        rlMain.tint(255, 255);
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