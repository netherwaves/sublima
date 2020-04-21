class SystemManager {
    // props
    int phase;
    // systems
    WaterSystem watersys;
    VaporSystem vaporsys;
    IceSystem icesys;
    // assets
    PImage[] phaseIcons;

    // constructor
    SystemManager() {
        watersys = new WaterSystem();
        vaporsys = new VaporSystem();
        icesys = new IceSystem();

        phase = PHASE_IDLE;

        // load assets
        phaseIcons = new PImage[3];
        phaseIcons[0] = loadImage("water_icon.png");
        phaseIcons[1] = loadImage("vapor_icon.png");
        phaseIcons[2] = loadImage("ice_icon.png");
    }

    // draw to screen
    void display() {
        switch(phase) {
            case PHASE_IDLE:
                // add main menu here, i guess?
                break;
            case PHASE_WATER:
                displaySystem(watersys);
                break;
            case PHASE_VAPOR:
                displaySystem(vaporsys);
                break;
            case PHASE_ICE:
                displaySystem(icesys);
                break;
        }
    }

    // display a specific system
    // TODO: transitionable
    void displaySystem(System sys) {
        sys.animate();
        sys.display();
    }

    // phase getter/setter
    void setPhase(int newPhase) {
        phase = newPhase;
        // TODO: trigger icon display
    }
    int getPhase() { return phase; }

    // TODO: this function
    boolean isTransitioning() { return false; }

    // EVENTS
    void click() {
        watersys.click();
        vaporsys.click();
        icesys.click();
    }
}