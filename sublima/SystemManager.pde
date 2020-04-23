class SystemManager {
    // props
    private int phase;
    private float iconOpacity;
    // systems
    private System[] systems;
    // assets
    private PImage[] phaseIcons;

    // constructor
    SystemManager() {
        // init systems
        systems = new System[3];
        systems[0] = new VaporSystem();
        systems[1] = new WaterSystem();
        systems[2] = new IceSystem();

        // init props
        phase = PHASE_IDLE;
        iconOpacity = 0;

        // load images
        phaseIcons = new PImage[3];
        phaseIcons[0] = loadImage("img/vapor_icon.png");
        phaseIcons[1] = loadImage("img/water_icon.png");
        phaseIcons[2] = loadImage("img/ice_icon.png");
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
        if (phase > PHASE_IDLE) displaySystem(systems[phase-1]);

        // fct calculates a 2s up slope, 3s hold, 2s down slope
        // and applies to text fill opacity
        fill(255, ahdsSlope(frameCount/60.0, 2, 3) * 255);

        // init phase after 5 seconds
        if (frameCount/60.0 > 5 && phase == PHASE_IDLE) {
            changePhaseAll(PHASE_VAPOR);
        }

        // draw text with wide letter spacing
        // (thank you Processing for forcing me to do this with a for loop 🙂)
        textFont(normsThin);
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
        // fade out previous system (currently does nothing)
        if (phase > PHASE_IDLE) systems[phase-1].transitionOut();
        // change phase & show icon
        phase = newPhase;
        iconOpacity = 1;
        // fade in next system
        if (phase > PHASE_IDLE) systems[phase-1].transitionIn();
    }
    // get phase
    int getPhase() { return phase; }

    // TODO: this function(?)
    boolean isTransitioning() { return false; }

    // EVENTS
    void click() {
        for (int i = 0; i < systems.length; i++) {
            systems[i].click();
        }
    }
}