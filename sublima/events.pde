void initMaxEvents() {
    // event hooks
    oscP5.plug(this, "appReady", "/evt/max_ready");

    // send ready signal
    println("waiting for response from max/msp...");
    sendOSC("/evt/p5_ready", 0);
}

void appReady() {
    println("app is drawing");
    isReady = true;
}