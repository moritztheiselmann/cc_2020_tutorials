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
  
  noiseSeed(66666);
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
  
  drawDisplacedLine(xStart, yStart, xEnd, yEnd, 150, 50);
  
  noLoop();
}

void drawDisplacedLine(float x1, float y1, float x2, float y2, float amplitude, int segments) {
  noFill();
  stroke(255);
  strokeWeight(5);
  beginShape();
  float segmentLength = (x2 - x1) / segments;
  float yoff = 0;
  for(int i = 0; i <= segments; i++) {    
    float dx = x1 + i*segmentLength;
    float dy = y1;
    yoff += 0.1;
    if( i != 0 && i != segments) {
      dy = dy + map(noise(yoff), 0, 1, -150, 150);
    }
    
    circle(dx, dy, radius/2);
    vertex(dx, dy);
  }
  endShape();
}


void keyPressed() {
  if (key == 's') {
    saveFrame("output/"+frameCount+".png");
  }
}
