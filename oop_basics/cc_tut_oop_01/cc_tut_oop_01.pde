float x;
float y;
float diameter;
int segments = 5;

void setup() {
  size(1000, 1000);
  
  x = width/2;
  y = height/2;
  diameter = width/2;
}

void draw() {
  background(0);
  
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
