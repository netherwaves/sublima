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