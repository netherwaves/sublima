class VaporSystem extends System {
    VaporSystem() {
        super("/vaporsys", 0.93);
    }

    void display() {
        rl.beginDraw();
        PGraphics pg = rl.getGraphics();

        // draw interactible stuff
        // pg.fill(#8b4f55);
        // pg.rect(40, 40, 40, 40);

        rl.endDraw();
        super.display();
    }
}