class Cell {
  int x;
  int y;
  int w;
  int h;
  PGraphics tex;
  float xoff = 0;
  boolean shouldRotate = false;
  float rot;
  float probability;
  int maxRot;
  float rotSpeed;
  
  Cell(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.xoff = random(0, 90);
    this.rot = 0;
    this.probability = random(0, 0.025);
    this.rotSpeed = random(0.02, 0.1);
    this.maxRot = 360;
    
    this.tex = createGraphics(this.w, this.h, P2D);
  }
  
  void updateTexture(PGraphics texture) {
    this.tex.beginDraw();
    this.tex.copy(texture, this.x, this.y, this.w, this.h, 0, 0, this.w, this.h);
    this.tex.noFill();
    this.tex.stroke(255);
    this.tex.strokeWeight(2);
    this.tex.rect(0, 0, this.w, this.h);
    this.tex.endDraw();
  }
  
  void update() {
    if(this.shouldRotate) {
      if(this.rot < this.maxRot-1) {  
        this.rot = lerp(this.rot, this.maxRot, this.rotSpeed);
      }
      else {
        this.shouldRotate = false;
        this.rot = 0;
      }
    }
    else {
      if(random(1) < this.probability) {
        this.shouldRotate = true;
        this.rot = 0;
      }
    }
  }
  
  void show() {
    pushMatrix();
    translate(this.x+this.w/2, this.y+this.h/2);
    rotate(radians(this.rot));  
    image(this.tex, -this.w/2, -this.h/2);
    popMatrix();
  }
}
