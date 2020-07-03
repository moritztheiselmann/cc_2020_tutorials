class Shape {
  float x;
  float y;
  float diameter;
  int segments;
  color col;
  float rotation;
  float rotSteps = 0;
  boolean shouldRotate;
  
  Shape(float x, float y, float diameter, int segments) {
    this.x = x;
    this.y = y;
    this.diameter = diameter;
    this.segments = segments;
    col = color(255);
    rotation = 0;
    rotSteps = random(0.005, 0.025);
    shouldRotate = true;
  }
  
  void show() {
    pushMatrix();
    translate(x, y);
    rotate(rotation);
    stroke(255);
    fill(col);
    beginShape();
    for (int n = 0; n < segments; n++) {
      float angle = TWO_PI / segments * n;
      float dx = cos(angle) * diameter/2;
      float dy = sin(angle) * diameter/2;
      vertex(dx, dy);
    }
    endShape(CLOSE);
    popMatrix();
    
    if(shouldRotate) {
      rotation += rotSteps;
    }
  }
  
  void checkPosition(int mousex, int mousey) {
    float d = dist(x, y, mousex, mousey);
    
    if ( d < diameter/2) {
      col = color(255);
      shouldRotate = false;
    }
    else {
      col = color(0);
      shouldRotate = true;
    }
  }
}
