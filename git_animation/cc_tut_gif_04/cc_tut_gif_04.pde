float res = 75;
float radius = 0.3;
float noiseScale = 0.002;

int lines = 75;

int frameCounter;
int totalFrames = 300;
boolean recording = true;

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

void render(float percent) {
  stroke(255, 175);
  strokeWeight(3);

  for ( int j = 0; j < lines; j++) {
    float y = map(j, 0, lines-1, 0, height);
    fill(20);

    beginShape();
    for (int i = 0; i < res; i++) {     
      float x = map(i, 0, res-1, -1, width);

      // cut off the intensity towars the edges
      float intensity = -1.15*constrain(map(dist(x, y, width/2, height/2), 0, 0.5*width, 1, 0), 0, 1);

      float dy = y + intensity*250*noise(10+radius*cos(TWO_PI*percent + 0.05*i), 10+radius*sin(TWO_PI*percent + 0.05*i), 100*y+noiseScale*x);
      vertex(x, dy);
    }
    endShape();
  }
}
