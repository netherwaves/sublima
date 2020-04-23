// water phases constants
final int PHASE_IDLE = 0,
          PHASE_VAPOR = 1,
          PHASE_WATER = 2,
          PHASE_ICE = 3;

// system visibility constants (not sure when/if i'm ever using these tbh)
final int STATE_HIDDEN = 0;
final int STATE_VISIBLE = 1;

// formats a floating-point number to an nth-decimal string
String formatFloat(float f, int decimal) {
    return String.format("%." + decimal + "f", f);
}

// generate an AHDS slope
float ahdsSlope(float x, float slopeTime, float holdTime) {
    // x should be a value ranging between 0 and (slopeTime*2) + holdTime
    float h = slopeTime+(holdTime/2), a = 1/(float)slopeTime, k = h/2;
    return constrain(-a * abs(x - h) + k, 0, 1);
}