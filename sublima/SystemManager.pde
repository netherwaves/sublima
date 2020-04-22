class SystemManager {
    // props
    private int phase;
    private float iconOpacity;
    // systems
    private VaporSystem vaporsys;
    private WaterSystem watersys;
    private IceSystem icesys;
    // assets
    private PImage[] phaseIcons;

    // constructor
    SystemManager() {
        // init systems
        vaporsys = new VaporSystem();
        watersys = new WaterSystem();
        icesys = new IceSystem();

        // init props
        phase = PHASE_IDLE;
        iconOpacity = 0;

        // load images
        phaseIcons = new PImage[3];
        phaseIcons[0] = loadImage("vapor_icon.png");
        phaseIcons[1] = loadImage("water_icon.png");
        phaseIcons[2] = loadImage("ice_icon.png");
    }

    // draw to screen
    void display() {
        // draw icon in the background
        if (phase > PHASE_IDLE && iconOpacity > 0) {
            tint(255, iconOpacity*130);
            imageMode(CENTER);
            image(phaseIcons[phase-1], width/2, height/2, phaseIcons[phase-1].width*0.6, phaseIcons[phase-1].height*0.6);
            imageMode(CORNER);
            tint(255, 255);

            // fades out within 3 seconds
            iconOpacity -= 1.0/(60 * 3);
            if (iconOpacity < 0) iconOpacity = 0;
        }

        // display currently active system
        // TODO: make it work with transitions
        switch(phase) {
            case PHASE_VAPOR:
                displaySystem(vaporsys);
                break;
            case PHASE_WATER:
                displaySystem(watersys);
                break;
            case PHASE_ICE:
                displaySystem(icesys);
                break;
        }

        // fct calculates a 2s up slope, 3s max hold, 2s down slope
        // and applies to text fill opacity
        int slopeTime = 2, holdTime = 3;
        float h = slopeTime+(holdTime/2), a = 1/(float)slopeTime, k = h/2;
        fill(255, constrain(-a * abs((frameCount/60.0)-h)+k, 0, 1) * 255);

        // init phase after 5 seconds
        if (frameCount/60.0 > 5 && phase == PHASE_IDLE) {
            changePhaseAll(PHASE_VAPOR);
        }

        // draw text
        textSize(40);
        textAlign(LEFT);

        String label = "SUBLIMA";
        float currWidth = 0, totalWidth = textWidth(label) + (40 * (label.length() - 1));
        for (int i = 0; i < label.length(); i++) {
            char c = label.charAt(i);
            float w = textWidth(c);
            text(c, width/2 + currWidth - (totalWidth/2), height/2 + 20);
            currWidth += w + 40;
        }
    }

    // display a specific system
    // TODO: transitionable(?)
    void displaySystem(System sys) {
        sys.animate();
        sys.display();
    }

    // set phase
    void setPhase(int newPhase) {
        phase = newPhase;
        iconOpacity = 1;
    }
    // get phase
    int getPhase() { return phase; }

    // TODO: this function(?)
    boolean isTransitioning() { return false; }

    // EVENTS
    void click() {
        vaporsys.click();
        watersys.click();
        icesys.click();
    }
}