class IceSystem extends System {
    IceSystem() {
        super("/icesys");
    }

    void display() {
        rlMain.beginDraw();
        rlMain.clear();
        rlMain.noStroke();

        // draw a rectangle but it'S NOT THE SAME ONE AS VAPORSYS!!! NO SIR
        rlMain.fill(0, 255, 127);
        rlMain.rect(500, 500, 100 + ((float)SimplexNoise.noise(frameCount, 0) * 30), 400);

        rlMain.endDraw();
        super.display();
    }
}