class Cell {
  int x;
  int y;
  float radius;
  float rotation;
  int resolution;
  boolean shouldAnimate = true;
  int animationInFrames;
  int frame;
  
  Cell(int x, int y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    resolution = 64;
    animationInFrames = 60;
    frame = frameCount;
  }
  
  void show() {
    noFill();
    pushMatrix();
    translate(x+radius, y+radius);
    rotate(rotation);
    beginShape();
    for(int i = 0; i < resolution; i++) {
        float angle = (TWO_PI*3/4) / resolution * i;
        float cx = cos(angle) * radius*4/5;
        float cy = sin(angle) * radius*4/5;
        vertex(cx, cy);
        if(i==0 || i==resolution-1) {
          noStroke();
          fill(255);
          ellipse(cx, cy, radius/5, radius/5);
        }
      }
      stroke(255);
      noFill();
      endShape();
    popMatrix();
  }
  
  void update() {
    if(shouldAnimate) {
      int diff = frameCount-frame;
      if (diff < animationInFrames) {
        rotation = map(sin(radians(diff)), -1, 1, -PI, PI);
      }
      else {
        frame = frameCount;
        shouldAnimate = false;
      }
    }
  }
  
  void animate() {
    shouldAnimate = true;
    frame = frameCount;
  }
}
