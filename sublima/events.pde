int currentPhase = 0;

// setup Max/MSP hooks and ping receiving UDP server
void initMaxEvents() {
    // event hooks
    oscP5.plug(this, "appReady", "/evt/max_ready");

    // send ready signal
    println("waiting for response from max/msp...");
    sendOSC("/evt/p5_ready", 0);
}

// allow main app rendering
void appReady() {
    println("app is drawing");
    isReady = true;
}

// force phase change to argument
void changePhaseAll(int newPhase) {
    manager.setPhase(newPhase);
    mouseTrail.setPhase(newPhase);

    sendOSC("/evt/change_phase", newPhase);
}
// goto next phase
void triggerNextPhase() {
    currentPhase++;
    changePhaseAll(currentPhase);
}

// mouse events
void mouseClicked() {
    manager.click();
}