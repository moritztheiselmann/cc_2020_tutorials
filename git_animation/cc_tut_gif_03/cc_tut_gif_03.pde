float res = 2500;
float radius = 1.0;

int frameCounter;
int totalFrames = 450;
boolean recording = true;

void setup() {
  size(600, 600);
  
  background(20);
}

void draw() {
  background(20);
  
  float percent = 0;
  if (recording) {
    percent = float(frameCounter) / totalFrames;
  }
  else {
    percent = float(frameCounter % totalFrames) / totalFrames;
  }

  render(percent);
  
  if(recording) {
    saveFrame("output/gif-"+nf(frameCounter, 3)+".png");
    if (frameCounter == totalFrames-1) {
      exit();
    }
  }
  frameCounter++;
}

float getNoise(float angle, float angle2) {
   float xoff = 2*radius*cos(TWO_PI*angle);
   float yoff = 2*radius*sin(TWO_PI*angle);
   
   return noise(xoff, yoff, angle2);
}

float offset(float angle) {
  return 2.0*pow(angle, 3.0);
}

void render(float percent) {
  noFill();
  stroke(255, 75);
  strokeWeight(2.0);
  
  //beginShape();
  for(int i=0;i<res;i++){
    float p = 1.0*i/res;
    
    float x = p*width;
    float y = map(getNoise(offset(p)-percent, p),0,1,0,height);
    
    point(x,y);
  }
  //endShape();
}
