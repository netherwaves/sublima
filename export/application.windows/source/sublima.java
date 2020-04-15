import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import oscP5.*; 
import netP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sublima extends PApplet {

// global variables
boolean isReady, allowAnimate;

// objects
SystemManager manager;
MouseTrail mouseTrail;

public void setup() {
    

    // initialize graphics
    isReady = true;
    allowAnimate = true;
    loadingScreen();

    // initialize OSC bridge
    initOSC();

    // initialize systems
    manager = new SystemManager();
    mouseTrail = new MouseTrail();

    // DON'T FORGET TO DECOMMENT THIS!
    // initMaxEvents();
}

public void draw() {
    background(0);
    noStroke();

    // loading screen
    if (!isReady) {
        loadingScreen();
        return;
    }

    // TODO: intro screen ???
    // will probably be a System subclass

    // display main
    manager.display();

    // update mouse trail
    mouseTrail.animate();
    mouseTrail.display();

    // draw GUI (debugging purposes)
    drawGUI();
}

public void loadingScreen() {
    background(0);
    fill(255);
    textAlign(CENTER);

    text("getting ready...", width/2, height/2);
}

public void keyPressed() {
    if (manager.isTransitioning()) return;

    // trigger transitions from here
    if (key == 'c') changePhase(PHASE_WATER);
    if (key == 'v') changePhase(PHASE_VAPOR);
    if (key == 'b') changePhase(PHASE_ICE);
    // if (key == 'n') changePhase(PHASE_PLASMA);
}

public void drawGUI() {
    String[] phases = { "PHASE_IDLE", "PHASE_WATER", "PHASE_VAPOR", "PHASE_ICE" };

    fill(255);
    textAlign(LEFT);
    text("fps: " + (int)frameRate, 10, 20);
    text("phase: " + phases[manager.getPhase()], 10, 35);
}
class IceSystem extends System {
    IceSystem() {
        super("/icesys");
    }

    public void display() {
        rl.beginDraw();
        PGraphics pg = rl.getGraphics();

        // draw a rectangle but it'S NOT THE SAME ONE AS VAPORSYS!!! NO SIR
        pg.fill(0, 255, 127);
        pg.rect(500, 500, 100 + ((float)SimplexNoise.noise(frameCount, 0) * 30), 400);

        rl.endDraw();
        super.display();
    }
}
// Mouse trail
class MouseTrail {
    // props
    int phase;
    PVector pos, displace;
    float vel;
    int wpThreshold;

    // objects
    RenderLayer rl;
    ArrayList<Particle> particles;

    // constructor
    MouseTrail() {
        phase = PHASE_IDLE;

        pos = new PVector(mouseX, mouseY);
        displace = new PVector(0, 0);
        vel = 0;

        wpThreshold = 20;

        rl = new RenderLayer(0.93f);
        particles = new ArrayList<Particle>();
    }

    // draw to screen
    public void display() {
        rl.beginDraw();
        PGraphics pg = rl.getGraphics();

        // generate corresponding particle type
        switch (phase) {
            case PHASE_WATER: createWaterParticle(); break;
            case PHASE_VAPOR: createVaporParticle(); break;
            case PHASE_ICE:   createIceParticle();   break;
        }

        // update particles
        for (int i = 0; i < particles.size(); i++) {
            Particle p = particles.get(i);
            p.update();

            if (p.isDead()) {
                particles.remove(i);
                continue;
            } else {
                p.display(pg);
            }
        }

        rl.endDraw();
        rl.render();

        fill(255, 0, 0);
        ellipse(pos.x, pos.y, 10, 10);
    }

    // manages water particle generation logic
    public void createWaterParticle() {
        // instanciate randomly depending on intensity of mouse velocity
        float instanciate = random(vel);
        if (instanciate > wpThreshold) {
            particles.add(new WaterParticle(pos, displace, vel*0.1f));
        }
    }

    // manages vapor particle generation logic
    public void createVaporParticle() {

    }

    // manages ice particle generation logic
    public void createIceParticle() {

    }

    // update animation variabless
    public void animate() {
        displace = PVector.sub(new PVector(mouseX, mouseY), pos).mult(0.2f);
        vel = displace.mag();
        pos.add(displace);
    }

    // self-explanatory
    public void sendOSCMessages() {
        sendOSC("/mousetrail/x", pos.x);
        sendOSC("/mousetrail/y", pos.y);
        sendOSC("/mousetrail/vel", vel);
    }

    // alter mouse trail state
    // TODO: tween
    public void setPhase(int newPhase) {
        phase = newPhase;
    }
}


abstract class Particle {
    PVector pos;
    float startTime, lifespan;

    Particle(PVector _pos, float _lifespan) {
        pos = _pos.copy();
        startTime = frameCount;
        lifespan = _lifespan;
    }

    // draw to screen
    public void update() {}
    public void display(PGraphics pg) {}

    public boolean isDead() {
        return frameCount > startTime + lifespan;
    }
}

class WaterParticle extends Particle {
    // props
    PVector dir;
    float vel, opacity;
    int fillColor;

    WaterParticle(PVector _pos, PVector _dir, float _vel) {
        super(_pos, random(frameRate, frameRate * 2));
        dir = _dir.copy().normalize();
        vel = _vel;

        // rotate direction vector by random theta
        float theta = random(-QUARTER_PI, QUARTER_PI);
        dir.rotate(theta);

        // create random color (tint of cyan / blue)
        colorMode(HSB, 360, 100, 100);
        fillColor = color(random(150, 230), random(60, 80), random(50, 80));
        colorMode(RGB, 255, 255, 255);
    }

    // update position, velocity and opacity
    public void update() {
        // vel -= initVel/(60*lifespan);
        vel *= 0.95f;
        vel = max(0, vel);
        pos.add(PVector.mult(dir, vel));

        opacity = constrain(map(frameCount - startTime, 0, lifespan, 2.3f, 0), 0, 1) * 255;
    }

    public void display(PGraphics pg) {
        pg.fill(fillColor, opacity);
        pg.ellipse(pos.x, pos.y, 4, 4);
    }
}

class IceParticle extends Particle {
    IceParticle(PVector _pos) {
        super(_pos, random(frameRate, frameRate * 2));
    }

    public void update() {}
    public void display(PGraphics pg) {}
}

class VaporParticle extends Particle {
    VaporParticle(PVector _pos) {
        super(_pos, random(frameRate, frameRate * 2));
    }

    public void update() {}
    public void display(PGraphics pg) {}
}



// OSC variables
final int PORT_IN = 11000, PORT_OUT = 13000;
OscP5 oscP5;
NetAddress remoteLoc;

// initialize OSC variables
public void initOSC() {
    oscP5 = new OscP5(this, PORT_IN);
    remoteLoc = new NetAddress("localhost", PORT_OUT);
}

// sends an OSC message
// TODO: make this prettier
public void sendOSC(String addr, float content) {
    OscMessage msg = new OscMessage(addr);
    msg.add(content);
    oscP5.send(msg, remoteLoc);
}
public void sendOSC(String addr, int content) {
    OscMessage msg = new OscMessage(addr);
    msg.add(content);
    oscP5.send(msg, remoteLoc);
}
public void sendOSC(String addr, String content) {
    OscMessage msg = new OscMessage(addr);
    msg.add(content);
    oscP5.send(msg, remoteLoc);
}
class RenderLayer {
    PGraphics main, sub;
    float fbCoeff;

    // constructor
    RenderLayer(float _fbCoeff) {
        main = createGraphics(width, height);
        sub = createGraphics(width, height);
        fbCoeff = _fbCoeff;

        // IMPORTANT:
        // this is so that the sub layer already has pixel data when transferred to from main layer
        sub.beginDraw();
        sub.endDraw();
    }

    // PGraphics begin/endDraw overrides
    public void beginDraw() {
        main.beginDraw();
        main.clear();
        main.noStroke();

        // draw sub layer immediately
        main.tint(255, 255 * fbCoeff);
        main.image(sub, 0, 0);
        main.tint(255, 255);
    }
    public void endDraw() {
        main.endDraw();
    }

    // render to screen
    public void render() {
        image(main, 0, 0);
        // buffer current main to previous sub
        sub = copyGraphics();
    }

    // copy PGraphics object by value from main to sub
    public PGraphics copyGraphics() {
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
    public PGraphics getGraphics() { return main; }
}
abstract class System {
    // props
    String oscAddr;
    int state;
    RenderLayer rl;

    // constructor
    System(String addr) {
        oscAddr = addr;
        state = STATE_HIDDEN;

        rl = new RenderLayer(0.93f);
    }

    // display/animate
    public void animate() {
        // empty by default
    }
    public void display() {
        rl.render();
    }

    // manage transitions
    // TODO: tween channel and send OSC message accordingly
    public void transitionIn() {
        state = STATE_VISIBLE;
    }
    public void transitionOut() {
        state = STATE_HIDDEN;
    }
}
class SystemManager {
    // props
    int phase;
    // systems
    WaterSystem watersys;
    VaporSystem vaporsys;
    IceSystem icesys;

    // constructor
    SystemManager() {
        watersys = new WaterSystem();
        vaporsys = new VaporSystem();
        icesys = new IceSystem();

        phase = PHASE_IDLE;
    }

    // draw to screen
    public void display() {
        switch(phase) {
            case PHASE_IDLE:
                // add main menu here, i guess?
                break;
            case PHASE_WATER:
                displaySystem(watersys);
                break;
            case PHASE_VAPOR:
                displaySystem(vaporsys);
                break;
            case PHASE_ICE:
                displaySystem(icesys);
                break;
        }
    }

    // display a specific system
    // TODO: transitionable
    public void displaySystem(System sys) {
        sys.animate();
        sys.display();
    }

    // phase getter/setter
    public void setPhase(int newPhase) { phase = newPhase; }
    public int getPhase() { return phase; }

    // TODO: this function
    public boolean isTransitioning() { return false; }
}
class VaporSystem extends System {
    VaporSystem() {
        super("/vaporsys");
    }

    public void display() {
        rl.beginDraw();
        PGraphics pg = rl.getGraphics();

        // just draw a rectangle bro :/
        pg.fill(0xff8b4f55);
        pg.rect(40, 40, 40, 40);

        rl.endDraw();
        super.display();
    }
}
class WaterSystem extends System {
    // constants
    final int NUM_SPINS = 10;
    // props
    String[][] oscOut;
    float feedbackCoeff;
    // objects
    ArrayList<WaterSpin> spins;

    // constructor
    WaterSystem() {
        super("/watersys");

        spins = new ArrayList<WaterSpin>();
        for (int i = 0; i < NUM_SPINS; i++) {
            spins.add(new WaterSpin(i));
        }
        oscOut = new String[3][spins.size()];

        feedbackCoeff = 0.95f;
    }

    // draw to screen
    public void display() {
        rl.beginDraw();

        // update and draw all spins
        for (int i = 0; i < spins.size(); i++) {
            spins.get(i).animate();
            oscOut[0][i] = formatFloat(spins.get(i).getTheta(), 5);
            oscOut[1][i] = formatFloat(spins.get(i).getPan(), 5);
            oscOut[2][i] = formatFloat(spins.get(i).getVerticalMod(), 5);

            spins.get(i).display(rl.getGraphics());
        }

        // send OSC messages
        if (allowAnimate) {
            sendOSC(oscAddr + "/spin/angles", String.join(" ", oscOut[0]));
            sendOSC(oscAddr + "/spin/pans", String.join(" ", oscOut[1]));
            sendOSC(oscAddr + "/spin/mods", String.join(" ", oscOut[2]));
        }

        rl.endDraw();
        super.display();
    }
}


class WaterSpin {
    // properties
    private PVector pos;
    private float speed;
    private float orbSize, orbTrajRadius;
    private float theta;
    private int index;

    private boolean activated;

    // constructor
    WaterSpin(int _index) {
        index = _index;

        orbSize = random(4, 12);
        orbTrajRadius = random(20, 40);
        pos = new PVector(random(orbTrajRadius, width - orbTrajRadius), random(orbTrajRadius, height - orbTrajRadius));
        speed = random(0.5f, 2);

        activated = false;
    }

    // draw to screen
    public void display(PGraphics pg) {
        pg.fill(255, max(map(sin(theta), 0, 1, 0, 255), 0));
        pg.ellipse(
            pos.x + cos(theta) * orbTrajRadius,
            pos.y + sin(theta) * orbTrajRadius,
            orbSize, orbSize);
    }

    // update animation values
    public void animate() {
        theta = map(frameCount, 0, 60, 0, PI * speed) % TWO_PI;
    }

    // mod point getters
    public float getTheta() { return theta; }
    public float getPan() { return map(pos.x, 0, width, -1, 1); }
    public float getVerticalMod() { return map(pos.y, 0, height, 1, 0); }
}
// setup Max/MSP hooks and ping receiving UDP server
public void initMaxEvents() {
    // event hooks
    oscP5.plug(this, "appReady", "/evt/max_ready");

    // send ready signal
    println("waiting for response from max/msp...");
    sendOSC("/evt/p5_ready", 0);
}

// allow main app rendering
public void appReady() {
    println("app is drawing");
    isReady = true;
}

// change phase of application
public void changePhase(int newPhase) {
    manager.setPhase(newPhase);
    mouseTrail.setPhase(newPhase);

    sendOSC("/evt/change_phase", newPhase);
}
// water phases constants
final int PHASE_IDLE = 0,
          PHASE_WATER = 1,
          PHASE_VAPOR = 2,
          PHASE_ICE = 3,
          PHASE_PLASMA = 4;

// system visibility constants
final int STATE_HIDDEN = 0;
final int STATE_VISIBLE = 1;

// formats a floating-point number to an nth-decimal string
public String formatFloat(float f, int decimal) {
    return String.format("%." + decimal + "f", f);
}

// copies a PGraphics object by value
// https://forum.processing.org/two/discussion/20716/copy-pgraphics-by-value
public PGraphics copyGraphics(PGraphics src, PGraphics dest) {
  if (dest == null || dest.width != src.width || dest.height != src.height) {
    dest = createGraphics(src.width, src.height);
    dest.beginDraw();
    dest.endDraw();
  }
  src.loadPixels();
  dest.loadPixels();
  arrayCopy(src.pixels, 0, dest.pixels, 0, src.pixels.length);
  dest.updatePixels();
  return dest;
}
  public void settings() {  size(1280, 720, P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sublima" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
