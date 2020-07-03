import controlP5.*;

ControlP5 cp5;

boolean shouldRecord = false;
int frameCounter = 0;

int sliderStart = 0;
int sliderStop = 0;
int resolution = 3;
int radius;

PGraphics pg;

void setup() {
  size(1000, 1000, P2D);
  pg = createGraphics(width, height);
  radius = width/3;
  
  cp5 = new ControlP5(this);
    
  cp5.addSlider("sliderStart")
    .setPosition(50, 100)
    .setRange(0, width/2)
    .setSize(150, 50)
    .setValue(303);
   
  cp5.addSlider("sliderStop")
    .setPosition(50, 200)
    .setRange(width/2, width)
    .setSize(150, 50)
    .setValue(633);
    
  cp5.addSlider("resolution")
    .setPosition(50, 300)
    .setRange(2, 32)
    .setSize(150, 50)
    .setValue(3);
   
  cp5.hide();
   
  frameRate(60);
}

void keyReleased() {
  if(key == 'g') {
    cp5.show(); 
  }
  else if (key == 'h') {
    cp5.hide();
  }
  else if(key == 's') {
    shouldRecord = true;
    frameCounter = 0;
  }
}

void draw() { 
  pg.beginDraw();
  pg.background(20);
  pg.pushMatrix();
  pg.translate(width/2, height/2);
  pg.noFill();
  pg.beginShape();
  for( int i = 0; i < resolution; i++) {
    PVector p = calcShape(i);
    pg.vertex(p.x, p.y);
  }
  pg.stroke(255);
  pg.strokeWeight(10);
  pg.endShape(CLOSE);
  pg.popMatrix();
  //pg.fill(20, 25);
  //pg.rect(-50, -50, width+150, height+150);
  pg.endDraw();
 
  int sx = 0;
  int sy = 0;
  int sw = 1;
  int sh = height;
  int dx = 0;
  int dy = 0;
  int dw = 1;
  int dh = height;
  for(int i = 0; i < width; i++) {
    copy(pg, sx, sy, sw, sh, dx, dy, dw, dh);
    if(i < sliderStart || i > sliderStop) {
      sx = i;
      dx = i;
      sw = 1;
      dw = 1;
    }
    else {
      sx = sx + dw;
      sw = 1; 
      dx = sx;
      dw = dw + 5;
    }
  }
  
  stroke(255);
  noFill();
  strokeWeight(2);
  circle(width/2, height/2, radius*2);
  
  pushMatrix();
  translate(width/2, height/2);
  for( int i = 0; i < resolution; i++) {
    strokeWeight(0.5);
    stroke(255, 0, 0, 150);

    PVector p = calcShape(i);    
    line(-width/2, p.y, width/2, p.y);
    line(p.x, -height/2, p.x, height/2);
    
    //int lx = width/2;
    //int ly = height/2;
    //if (p.x < 0) {
    //  lx *= -1;
    //}
    //if (p.y < 0) {
    //  ly *= -1;
    //}
    //line(p.x, p.y, p.x, ly);
    //line(p.x, p.y, lx, p.y);
  }
  popMatrix();
 
  if (shouldRecord) {
    saveFrame("output/gif-"+nf(frameCounter, 3)+".png");
    if (frameCounter == 360-1) {
      shouldRecord = false;
      println("finished recording");  
    }
    
    frameCounter++;
  }
}

PVector calcShape(int index) {
  float angle = TWO_PI / resolution*index+ radians(frameCount);    
  float x = cos(angle) * radius; 
  float y = sin(angle) * radius;
  return new PVector(x, y);
}
