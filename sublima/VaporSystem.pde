class VaporSystem extends System {
    VaporSystem() {
        super("/vaporsys");
    }

    void display() {
        rlMain.beginDraw();
        rlMain.clear();
        rlMain.noStroke();

        // just draw a rectangle bro :/
        rlMain.fill(#8b4f55);
        rlMain.rect(40, 40, 40, 40);

        rlMain.endDraw();
        super.display();
    }
}