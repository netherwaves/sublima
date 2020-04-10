// format floating-point number to nth decimals string
String formatFloat(float f, int decimal) {
    return String.format("%." + decimal + "f", f);
}