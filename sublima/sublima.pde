// global variables
boolean isReady, allowAnimate;

// objects
SystemManager manager;
MouseTrail mouseTrail;

void setup() {
    size(1280, 720, P2D);
    noCursor();

    // initialize graphics
    isReady = true;
    allowAnimate = true;
    loadingScreen();

    // initialize OSC bridge
    initOSC();

    // initialize systems
    manager = new SystemManager();
    mouseTrail = new MouseTrail();

    // DON'T FORGET TO DECOMMENT THIS!
    // initMaxEvents();
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
    drawGUI();
}

void loadingScreen() {
    background(0);
    fill(255);
    textAlign(CENTER);

    text("getting ready...", width/2, height/2);
}

void keyPressed() {
    if (manager.isTransitioning()) return;

    // trigger transitions from here
    if (key == 'c') changePhase(PHASE_WATER);
    if (key == 'v') changePhase(PHASE_VAPOR);
    if (key == 'b') changePhase(PHASE_ICE);
    // if (key == 'n') changePhase(PHASE_PLASMA);
}

void drawGUI() {
    String[] phases = { "PHASE_IDLE", "PHASE_WATER", "PHASE_VAPOR", "PHASE_ICE" };

    fill(255);
    textAlign(LEFT);
    text("fps: " + (int)frameRate, 10, 20);
    text("phase: " + phases[manager.getPhase()], 10, 35);
    text("mousevel: " + mouseTrail.getVelocity(), 10, 50);
}