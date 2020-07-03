import controlP5.*;

ControlP5 gui; 

float x1;
float x2;
float y1;
float y2;
int nSegments = 1000;
float xoff = 0;
int nLines = 50;

void setup() {
  size(1000, 1000);
  
  x1 = 0;
  y1 = height/2;
  x2 = width;
  y2 = height/2;
  
  noiseSeed(66666);
  
  gui = new ControlP5(this);
  
  gui.addSlider("nLines")
  .setPosition(100, 100)
  .setRange(1, 75)
  .setSize(200, 100);
  
  drawPoints();
}

void draw() {

}

void drawPoints() {
  background(0);
  noFill();
  stroke(255);
  strokeWeight(3);
  
  float segmentLength = width / nSegments;
  pushMatrix();
  translate(x1, y1);
  for(int l = 0; l < nLines; l++) {
    xoff = 0;
    if(l == 0) {
      strokeWeight(2);
      stroke(255, 200);
    }
    else {
      strokeWeight(random(0.5, 1.5));
      stroke(255, random(50, 100));
    }
    for(int n = 0; n <= nSegments; n++) {
      float dx = random(-10, 10) + segmentLength*n;
      float amp = random(100, 250);
      float dy = map(noise(xoff), 0, 1, -amp, amp);
      point(dx, dy);
      xoff += 0.001;
    }
    noFill();

  }
  popMatrix();
}

public void controlEvent(ControlEvent theEvent) {
  drawPoints();
}
