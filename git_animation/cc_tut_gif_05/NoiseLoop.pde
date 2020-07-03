class NoiseLoop {
  PVector mPos;
  float mRadius;
  float mScale;
  float mMin;
  float mMax;
  
  NoiseLoop(float radius, float scale, float min, float max) {
    this.mPos = new PVector(random(1000), random(1000));
    
    this.mRadius = radius;
    this.mScale = scale;
    this.mMin = min;
    this.mMax = max;
  }
  
  float value(float a) {

    float xOff = map(cos(a), 0, 1, this.mPos.x, this.mPos.x + this.mRadius*2);
    float yOff = map(sin(a), 0, 1, this.mPos.y, this.mPos.y + this.mRadius*2);
    float noiseVal = noise(xOff * this.mScale, yOff * this.mScale);
        
    return map(noiseVal, 0, 1, this.mMin, this.mMax);
  }
}
