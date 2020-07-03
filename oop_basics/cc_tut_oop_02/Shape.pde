class Shape {
  float x;
  float y;
  float diameter;
  int segments;
  
  Shape(float x, float y, float diameter, int segments) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
    this.segments = segments;
  }
  
  void show() {
    pushMatrix();
    translate(x, y);
    stroke(255);
    noFill();
    beginShape();
    for (int n = 0; n < segments; n++) {
      float angle = TWO_PI / segments * n;
      float dx = cos(angle) * diameter/2;
      float dy = sin(angle) * diameter/2;
      vertex(dx, dy);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
