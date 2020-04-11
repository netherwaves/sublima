class VaporSystem extends System {
    VaporSystem() {
        super("/vaporsys");
    }

    void display() {
        rl.beginDraw();
        rl.clear();
        rl.noStroke();

        // just draw a rectangle bro :/
        rl.fill(#8b4f55);
        rl.rect(40, 40, 40, 40);

        rl.endDraw();
        super.display();
    }
}