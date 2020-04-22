// water phases constants
final int PHASE_IDLE = 0,
          PHASE_VAPOR = 1,
          PHASE_WATER = 2,
          PHASE_ICE = 3;

// system visibility constants (not sure if i'm using these tbh)
final int STATE_HIDDEN = 0;
final int STATE_VISIBLE = 1;

// formats a floating-point number to an nth-decimal string
String formatFloat(float f, int decimal) {
    return String.format("%." + decimal + "f", f);
}