class Rectangle {

    float x, y, width, height;
    color fillColor;

    Rectangle(float _x, float _y, float _width, float _height) {
        x = _x;
        y = _y;
        width = _width;
        height = _height;

        fillColor = color(random(30, 250), 100, random(90, 200));
    }

    void display() {
        fill(fillColor);
        noStroke();
        rect(x, y, width, height);
    }
}