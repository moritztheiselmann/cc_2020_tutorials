float x;
float y;

boolean recording = true;
int totalFrames = 150;

void setup() {
  size(1000, 1000); 
  x = width/2;
  y = height/2;
}

void draw() {
  float percent = 0;
  
  if (recording) {
    //percent = float(frameCount) / totalFrames;
    percent = map(frameCount, 0, totalFrames, 0, TWO_PI);
  } else {
    //percent = float(frameCount % totalFrames) / totalFrames;
    percent = map(frameCount, 0, totalFrames, 0, TWO_PI);
  }

  render(percent);

  if (recording) {
    saveFrame("output/gif-"+nf(frameCount, 3)+".png");
    if (frameCount == totalFrames-1) {
      exit();
    }
  }
}


void render(float percent) {
  background(20);
  
  x = random(0, width);
  
  noStroke();
  fill(255);
  circle(x, y, 100);
}
