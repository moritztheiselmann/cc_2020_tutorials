float res = 2000;
float radius = 1.0;

int frameCounter;
int totalFrames = 150;
boolean recording = false;

void setup() {
  size(1000, 1000);

  background(20);
}

void draw() {
  background(20);

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

float getNoise(float angle) {
  float xoff = radius*cos(TWO_PI*angle);
  float yoff = radius*sin(TWO_PI*angle);
  return noise(xoff, yoff);
}

void render(float percent) {
  noFill();
  stroke(255);
  strokeWeight(3.0);

  beginShape();
  for (int i = 0; i < res; i++) {
    float p = map(i, 0, res, 0, 1);
    float x = map(p, 0, 1, 0, width);
    float y = map(getNoise(p-percent), -1, 1, 0, height);

    vertex(x, y);
  }
  endShape();
}
