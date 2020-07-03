float xStart;
float yStart;
float xEnd;
float yEnd;
float radius;

void setup() {
  size(1000, 1000);
  
  radius = 20;
  xStart = radius/2;
  yStart = height/2;
  xEnd = width - radius/2;
  yEnd = height/2;

}

void draw() {
  background(20);
  stroke(255);
  strokeWeight(5);
  line(xStart, yStart, xEnd, yEnd);
  fill(255);
  noStroke();
  circle(xStart, yStart, radius);
  circle(xEnd, yEnd, radius);
  
  drawDisplacedLine(xStart, yStart, xEnd, yEnd, 150);
}

void drawDisplacedLine(float x1, float y1, float x2, float y2, float amplitude) {
  stroke(255);
  strokeWeight(5);
  
  y2 -= amplitude;
  line(x1, y1, x2, y2);
  
  
  fill(255);
  noStroke();
  circle(x1, y1, radius/2);
  circle(x2, y2, radius/2);
}

void keyPressed() {
  if (key == 's') {
    saveFrame("output/"+frameCount+".png");
  }
}
