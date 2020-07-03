class Agent {
  float mRadius = 32;
  PVector mPos;
  NoiseLoop mNoiseX;
  NoiseLoop mNoiseY;
  
  Agent(int x, int y) {
    mNoiseX = new NoiseLoop(150, 0.001, 0, x);
    mNoiseY = new NoiseLoop(259, 0.0005, 0, y);
    mPos = new PVector(x/2, y/2);
  }
  
  void update(float percent) {
    mPos.x = mNoiseX.value(percent);
    mPos.y = mNoiseY.value(percent);
  }
  
  void show() {
    fill(255);
    noStroke();
    circle(mPos.x, mPos.y, mRadius*2);
  }
}
