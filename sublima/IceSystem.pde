class IceSystem extends System {
    IceSystem() {
        super("/icesys");
    }

    void display() {
        rl.beginDraw();
        PGraphics pg = rl.getGraphics();

        // draw interactible stuff eventually
        // pg.fill(0, 255, 127);
        // pg.rect(500, 500, 100 + ((float)SimplexNoise.noise(frameCount, 0) * 30), 400);

        rl.endDraw();
        super.display();
    }
}