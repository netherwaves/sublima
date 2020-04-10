// global variables
boolean isReady, allowAnimate;
PVector cursorFollow;

// objects
WaterSystem watersys;
IceSystem icesys;
VaporSystem vaporsys;

void setup() {
    size(1280, 720);

    cursorFollow = new PVector(mouseX, mouseY);

    // initialize graphics
    isReady = false;
    allowAnimate = true;
    loadingScreen();

    // initialize OSC bridge
    initOSC();

    // initialize systems
    watersys = new WaterSystem();
    icesys = new IceSystem();
    vaporsys = new VaporSystem();

    // plugg
    oscP5.plug(this, "appReady", "/evt/max_ready");

    // send ready signal
    println("waiting for response from max/msp...");
    sendOSC("/evt/p5_ready", 0);
}

void draw() {
    if (!isReady) {
        loadingScreen();
        return;
    }

    // feedback background fill
    noStroke();
    fill(0, 30);
    rect(0,0,width,height);

    // draw objects

    // mouse update
    PVector currMouse = new PVector(mouseX, mouseY);
    PVector displacement = PVector.sub(currMouse, cursorFollow).mult(0.05);
    cursorFollow.add(displacement);
    sendOSC("/mousetrail/vel", displacement.mag());

    fill(255, 0, 0);
    ellipse(cursorFollow.x, cursorFollow.y, 10, 10);
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
    // trigger transitions from here
}