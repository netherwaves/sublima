class VaporSystem extends System {
    VaporSystem() {
        super("/vaporsys");
    }

    void display() {
        rl.beginDraw();
        PGraphics pg = rl.getGraphics();

        // just draw a rectangle bro :/
        pg.fill(#8b4f55);
        pg.rect(40, 40, 40, 40);

        rl.endDraw();
        super.display();
    }
}
