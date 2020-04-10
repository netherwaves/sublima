// TODO: combine with water states in MouseTrail.pde
static class State {
    public final int CLOSED = 0;
    public final int OPEN = 1;
}

abstract class System {
    // props
    String oscAddr;
    int state;

    // constructor
    System(String addr) {
        oscAddr = addr;
        state = State.CLOSED;
    }

    // manage transitions
    // TODO: tween channel and send OSC message accordingly
    void transitionIn() {}
    void transitionOut() {}
}