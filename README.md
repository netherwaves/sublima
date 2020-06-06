# SUBLIMA

### **Sublima is an interactive landscape on the water state change cycle.**
> Split into three phases (gaseous, liquid and solid), this project combines user interaction through mouse and keyboard with retroactive and generative visuals & sound design.

[Here is a live demonstration of an early beta version of the application.](https://youtu.be/yWsP7_3X1Z8)

## Running the application locally
1. Open the Max/MSP project located in the subfolder `sublima-maxmsp/`;
2. Execute the Processing script located in the subfolder `sublima-p5/`.

If you want to test the Processing sketch without Max/MSP, change the instruction at line 15 of `sublima.pde` to:
```
   allowMSP = false
```

## Phases
- To complete the **gaseous phase**, move the mouse around the screen. A halo should appear in the background.
- To complete the **liquid phase**, click on all orbs floating around the screen.
- In the current state of the application, there is no follow-up to the **solid phase**.
