float xStart;
float yStart;
float xEnd;
float yEnd;
float radius;
int res;

void setup() {
  size(1000, 1000);

  radius = 20;
  xStart = radius/2;
  yStart = height/2;
  xEnd = width - radius/2;
  yEnd = height/2;
  res = 1000;

  noiseSeed(66666);
}

void draw() {
  background(20);
  stroke(255, 200);
  noFill();
  strokeWeight(3);
  drawDots(xStart, yStart, xEnd, yEnd, 200, res, 0.01);

  fill(255);
  noStroke();

  noFill();

  for (int i = 0; i < 100; i++) {  
     stroke(255, (int)random(100, 175));
    strokeWeight(random(0.35, 1));
    float amp = random(200, 300);
    float scale = 0.01;
    drawDots(xStart, yStart, xEnd, yEnd, amp, res, scale);
  }

  noLoop();
}

void drawDots(float x1, float y1, float x2, float y2, float amplitude, int segments, float noiseScale) {
  float segmentLength = (x2 - x1) / segments;
  float yoff = 0;
  float xoff = 0;
  for (int i = 0; i <= segments; i++) {    
    float dx = x1 + i*segmentLength;
    float dy = y1;
    yoff += random(0.05, 0.15);
    xoff += 0.5;
    dx = random(dx-15, dx+15);
    dy = dy + map(noise(yoff * noiseScale), 0, 1, -amplitude, amplitude);

    point(dx, dy);
  }
}

void drawDisplacedLine(float x1, float y1, float x2, float y2, float amplitude, int segments, float noiseScale) {
  beginShape();
  float segmentLength = (x2 - x1) / segments;
  float yoff = 0;
  for (int i = 0; i <= segments; i++) {    
    float dx = x1 + i*segmentLength;
    float dy = y1;
    yoff += 0.1;
    dy = dy + map(noise(yoff * noiseScale), 0, 1, -amplitude, amplitude);

    vertex(dx, dy);
  }
  endShape();
}


void keyPressed() {
  if (key == 's') {
    saveFrame("output/"+frameCount+".png");
  }
}
