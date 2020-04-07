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

public class TP2 extends PApplet {




// OSC variables
final int PORTNUM = 10000;
OscP5 oscP5;
NetAddress remoteLoc;

int[] tableau = new int[50];

public void setup() {
    
    noLoop();

    // initialize graphics
    initGraphics();

    // initialize OSC bridge
    oscP5 = new OscP5(this, 11000);
    remoteLoc = new NetAddress("localhost", 13000);

    // plugg
    oscP5.plug(this, "appReady", "/evt/max_ready");

    // send ready signal
    println("waiting for response from max/msp...");
    sendOSC("/evt/p5_ready", 0);
}

public void draw() {
    noStroke();
    fill(0, 30);
    rect(0,0,width,height);
    fill(255);
    ellipse(width/2 + cos(map(frameCount, 0, 60, 0, PI))*30, height/2 + sin(map(frameCount, 0, 60, 0, PI))*30, 10, 10);
}

public void initGraphics() {
    background(0);
    fill(255);
    textAlign(CENTER);

    text("getting ready...", width/2, height/2);
}

public void appReady() {
    println("app is drawing");
    loop();
}
// sends an OSC message
public void sendOSC(String addr, float content) {
    OscMessage msg = new OscMessage(addr);
    msg.add(content);
    oscP5.send(msg, remoteLoc);
}
class Rectangle {

    float x, y, width, height;
    int fillColor;

    Rectangle(float _x, float _y, float _width, float _height) {
        x = _x;
        y = _y;
        width = _width;
        height = _height;

        fillColor = color(random(30, 250), 100, random(90, 200));
    }

    public void display() {
        fill(fillColor);
        noStroke();
        rect(x, y, width, height);
    }
}
// import oscP5.*;
// import netP5.*;

// final int PORTNUM = 10000;
// OscP5 oscP5;
// NetAddress remoteLoc;

// final String OCTAVEKEYS = "awsedftgyhujkolp";
// int octaveCount = 0;

// PVector initPos, currPos;
// ArrayList<Rectangle> rects;

// void setup() {
//     size(500, 500);

//     oscP5 = new OscP5(this, PORTNUM);
//     remoteLoc = new NetAddress("localhost", PORTNUM);

//     initPos = new PVector();
//     currPos = new PVector();

//     rects = new ArrayList<Rectangle>();
// }

// void draw() {
//     background(0);

//     for (int i = 0; i < rects.size(); i++) {
//         rects.get(i).display();
//     }

//     noFill();
//     stroke(255);
//     rect(initPos.x, initPos.y, currPos.x - initPos.x, currPos.y - initPos.y);
// }

// void mousePressed() {
//     initPos.set(mouseX, mouseY);
//     currPos.set(mouseX, mouseY);
// }

// void mouseDragged() {
//     currPos.set(mouseX, mouseY);
// }

// void mouseMoved() {}

// void mouseReleased() {
//     rects.add(new Rectangle(initPos.x, initPos.y, currPos.x - initPos.x, currPos.y - initPos.y));

//     initPos.set(0, 0);
//     currPos.set(0, 0);
// }

// void keyPressed() {
//     if (OCTAVEKEYS.indexOf(key) >= 0) {
//         // example code for sending a message
//         OscMessage msg = new OscMessage("/kb");
//         msg.add(OCTAVEKEYS.indexOf(key));
//         oscP5.send(msg, remoteLoc);
//     }
// }
  public void settings() {  size(1280, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "TP2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
