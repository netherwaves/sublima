// global variables
boolean isReady, allowAnimate;

// objects
SystemManager manager;
MouseTrail mouseTrail;

void setup() {
    size(1280, 720, P2D);

    // initialize graphics
    isReady = true;
    allowAnimate = true;
    loadingScreen();

    // initialize OSC bridge
    initOSC();

    // initialize systems
    manager = new SystemManager();
    manager.setPhase(PHASE_WATER);
    mouseTrail = new MouseTrail();

    // plugg
    // oscP5.plug(this, "appReady", "/evt/max_ready");

    // send ready signal
    // println("waiting for response from max/msp...");
    // sendOSC("/evt/p5_ready", 0);
}

void draw() {
    if (!isReady) {
        loadingScreen();
        return;
    }

    // feedback background fill
    // TODO: remove :/
    noStroke();
    fill(0, 30);
    rect(0, 0, width, height);

    // display main
    manager.display();

    // update mouse trail
    mouseTrail.animate();
    mouseTrail.display();
}

void loadingScreen() {
    background(0);
    fill(255);
    textAlign(CENTER);

    text("getting ready...", width/2, height/2);
}

void appReady() {
    println("app is drawing");
    isReady = true;
}

void keyPressed() {
    if (manager.isTransitioning()) return;

    // trigger transitions from here
    if (key == 'c') manager.setPhase(PHASE_WATER);
    if (key == 'v') manager.setPhase(PHASE_VAPOR);
    if (key == 'b') manager.setPhase(PHASE_ICE);
    // if (key == 'n') manager.setPhase(PHASE_PLASMA);
}