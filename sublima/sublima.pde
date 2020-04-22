// global variables
boolean isReady, allowAnimate;

// objects
SystemManager manager;
MouseTrail mouseTrail;

// global assets
PFont ttnorms;

void setup() {
    size(1280, 720, P2D);
    noCursor();

    // initialize graphics
    isReady = false;
    allowAnimate = true;
    loadingScreen();

    // initialize global assets
    ttnorms = createFont("TTNorms-Thin.otf", 72);
    textFont(ttnorms);

    // initialize OSC bridge
    initOSC();

    // initialize systems
    manager = new SystemManager();
    mouseTrail = new MouseTrail();

    // DON'T FORGET TO DECOMMENT THIS!
    initMaxEvents();
}

void draw() {
    background(0);
    noStroke();

    // loading screen
    if (!isReady) {
        loadingScreen();
        return;
    }

    // TODO: intro screen ???
    // will probably be a System subclass

    // display main
    manager.display();

    // update mouse trail
    mouseTrail.animate();
    mouseTrail.display();

    // draw GUI (debugging purposes)
    // drawGUI();
}

void loadingScreen() {
    background(0);
}

void keyPressed() {
    if (manager.isTransitioning()) return;

    // trigger transitions from here
    if (key == 'c') changePhaseAll(PHASE_VAPOR);
    if (key == 'v') changePhaseAll(PHASE_WATER);
    if (key == 'b') changePhaseAll(PHASE_ICE);
}

void drawGUI() {
    String[] phases = { "PHASE_IDLE", "PHASE_VAPOR", "PHASE_WATER", "PHASE_ICE" };

    fill(255);
    textSize(12);
    textAlign(LEFT);
    text("fps: " + (int)frameRate, 10, 20);
    text("phase: " + phases[manager.getPhase()], 10, 35);
    text("mousevel: " + mouseTrail.getVelocity(), 10, 50);
}