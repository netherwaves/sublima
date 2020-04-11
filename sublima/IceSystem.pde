class IceSystem extends System {
    IceSystem() {
        super("/icesys");
    }

    void display() {
        rl.beginDraw();
        rl.clear();
        rl.noStroke();

        // draw a rectangle but it'S NOT THE SAME ONE AS VAPORSYS!!! NO SIR
        rl.fill(0, 255, 127);
        rl.rect(500, 500, 100 + ((float)SimplexNoise.noise(frameCount, 0) * 30), 400);

        rl.endDraw();
        super.display();
    }
}