class RenderLayer {
    PGraphics main, sub;
    float fbCoeff, opacity;

    // constructor
    RenderLayer(float _fbCoeff) {
        main = createGraphics(width, height, P2D);
        sub = createGraphics(width, height, P2D);
        fbCoeff = _fbCoeff;
        opacity = 1;

        // IMPORTANT:
        // this is so that both layers already has pixel data when transferred to from main layer
        main.beginDraw();
        main.endDraw();
        sub.beginDraw();
        sub.endDraw();
    }

    // PGraphics begin/endDraw overrides
    void beginDraw() {
        main.beginDraw();
        if (fbCoeff < 1) main.clear();
        main.noStroke();

        // draw sub layer immediately
        if (fbCoeff > 0 && fbCoeff < 1) {
            main.tint(255, 255 * fbCoeff);
            main.image(sub, 0, 0);
            main.tint(255, 255);
        }
    }
    void endDraw() {
        main.endDraw();
    }

    // render to screen
    void render() {
        image(main, 0, 0);
        // buffer current main to previous sub
        if (fbCoeff > 0 && fbCoeff < 1) sub = copyGraphics();
    }

    // copy PGraphics object by value from main to sub
    // https://forum.processing.org/two/discussion/20716/copy-pgraphics-by-value
    PGraphics copyGraphics() {
        if (sub == null || sub.width != main.width || sub.height != main.height) {
            sub = createGraphics(main.width, main.height);
            sub.beginDraw();
            sub.endDraw();
        }
        main.loadPixels();
        sub.loadPixels();
        arrayCopy(main.pixels, 0, sub.pixels, 0, main.pixels.length);
        sub.updatePixels();
        return sub;
    }

    // get main render layer
    // (used to draw stuff to the layer from outside the instance)
    PGraphics getGraphics() { return main; }

    // set feedback coefficient
    void setFbCoeff(float newCoeff) { fbCoeff = newCoeff; }
}