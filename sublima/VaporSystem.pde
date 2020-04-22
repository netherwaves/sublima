class VaporSystem extends System {
    // props
    private PShader haloShader;
    private PVector haloDisplace;
    private float haloIntensity, maxIntensity, haloRadius;

    VaporSystem() {
        super("/vaporsys", 0, "look around");

        haloShader = loadShader("vapor_halo.glsl");
        haloDisplace = new PVector(0, 0);
        haloIntensity = 0;
        maxIntensity = 60;
        haloRadius = width*0.1;

        // do this only once
        haloShader.set("radius", haloRadius);           // float
        haloShader.set("center", 0.5, 0.5);             // vec2
        haloShader.set("ratio", (float)width / height); // float
        haloShader.set("maxintensity", maxIntensity);   // float

        // -- for reference (they're hardcoded in the shader) --
        // might be better to set them as uniforms though hmm
        // palette[0][0] = #E4B231;
        // palette[0][1] = #E47C31;
        // palette[1][0] = #C9214A;
        // palette[1][1] = #4599A5;
    }

    void display() {
        rl.beginDraw();
        PGraphics pg = rl.getGraphics();

        // draw background halo (NEW & IMPROVED)
        // fits in a single line wow thanks
        pg.filter(haloShader);

        rl.endDraw();
        super.display();
    }

    void animate() {
        // update intensity
        float velocity = mouseTrail.getVelocity();
        haloIntensity += velocity/500.0;
        // update displacement
        haloDisplace.set(
            (float)SimplexNoise.noise(frameCount/1000.0, 4, 3),
            (float)SimplexNoise.noise(frameCount/1000.0, 9, 0)
        );

        // update shader uniforms
        haloShader.set("displace", haloDisplace.x, haloDisplace.y);
        haloShader.set("intensity", haloIntensity);

        // switch to next if intensity has reached its peak
        if (haloIntensity > maxIntensity) {
            // TODO: instead of changing phase statically,
            // ask to go to the next one in a predetermined sequence
            changePhaseAll(PHASE_WATER);
        }
    }
}