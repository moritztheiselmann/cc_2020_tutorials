float x;
float y;
float xoff;

int frameCounter;
int totalFrames = 150;
boolean recording = true;

void setup() {
  size(1000, 1000); 
  x = width/2;
  y = height/2;
}

void draw() {
  //background(20);
  float percent = 0;
  if (recording) {
    percent = float(frameCounter) / totalFrames;
  } else {
    percent = float(frameCounter % totalFrames) / totalFrames;
  }

  render(percent);

  if (recording) {
    saveFrame("output/gif-"+nf(frameCounter, 3)+".png");
    if (frameCounter == totalFrames-1) {
      exit();
    }
  }
  frameCounter++;
}

void render(float percent) {
  background(20);
  //fill(20, 50);
  //rect(0, 0, width, height);

  x = noise(xoff) * width;

  noStroke();
  fill(255);
  circle(x, y, 100);
  xoff += 0.01;
}
