// sends an OSC message
void sendOSC(String addr, float content) {
    OscMessage msg = new OscMessage(addr);
    msg.add(content);
    oscP5.send(msg, remoteLoc);
}