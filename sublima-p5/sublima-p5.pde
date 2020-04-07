import oscP5.*;
import netP5.*;

// OSC variables
final int PORTNUM = 10000;
OscP5 oscP5;
NetAddress remoteLoc;

// global variables
boolean isReady;

int[] tableau = new int[50];

void setup() {
    size(1280, 720);

    // initialize graphics
    isReady = false;
    initGraphics();

    // initialize OSC bridge
    oscP5 = new OscP5(this, 11000);
    remoteLoc = new NetAddress("localhost", 13000);

    // plugg
    oscP5.plug(this, "appReady", "/evt/max_ready");

    // send ready signal
    println("waiting for response from max/msp...");
    sendOSC("/evt/p5_ready", 0);
}

void draw() {
    if (!isReady) {
        return loadingScreen();
    }

    noStroke();
    fill(0, 30);
    rect(0,0,width,height);
    fill(255);
    ellipse(width/2 + cos(map(frameCount, 0, 60, 0, PI))*30, height/2 + sin(map(frameCount, 0, 60, 0, PI))*30, 10, 10);
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