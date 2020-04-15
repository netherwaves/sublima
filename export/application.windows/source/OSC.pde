import oscP5.*;
import netP5.*;

// OSC variables
final int PORT_IN = 11000, PORT_OUT = 13000;
OscP5 oscP5;
NetAddress remoteLoc;

// initialize OSC variables
void initOSC() {
    oscP5 = new OscP5(this, PORT_IN);
    remoteLoc = new NetAddress("localhost", PORT_OUT);
}

// sends an OSC message
// TODO: make this prettier
void sendOSC(String addr, float content) {
    OscMessage msg = new OscMessage(addr);
    msg.add(content);
    oscP5.send(msg, remoteLoc);
}
void sendOSC(String addr, int content) {
    OscMessage msg = new OscMessage(addr);
    msg.add(content);
    oscP5.send(msg, remoteLoc);
}
void sendOSC(String addr, String content) {
    OscMessage msg = new OscMessage(addr);
    msg.add(content);
    oscP5.send(msg, remoteLoc);
}
