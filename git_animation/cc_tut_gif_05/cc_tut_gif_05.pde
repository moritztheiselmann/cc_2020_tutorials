int frameCounter;
int totalFrames = 300;
boolean recording = true;

int resolution = 100;
float delay = 2;
int num = 1;

Agent[] agentsA;
Agent[] agentsB;

void setup() {
  size(1000, 1000);
  
  agentsA = new Agent[num];
  agentsB = new Agent[num];
  
  for(int i = 1; i <= num; i++) {
    int xoff = width / num * i;
    
    int yoff = height / num * i;
    
    println(xoff);
    
    agentsA[i-1] = new Agent(xoff, yoff);
    agentsB[i-1] = new Agent(xoff, yoff);
    
  }
  
  
  background(20);
}

void draw() {
  //background(20);
  noStroke();
  fill(20, 50);
  rect(0, 0, width, height);

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
  float a = percent * TWO_PI;
  for(int i = 0; i < num; i++) {
    agentsA[i].update(a);
    agentsA[i].show();
    
    agentsB[i].update(a);
    agentsB[i].show();
  }
  
  for (Agent agB : agentsA) {
    agB.update(a);
    agB.show();
  }
  
  noFill();
  stroke(255);
  strokeWeight(5);
  beginShape();
    for(int i = 0; i < resolution; i++) {
      float p = 1.0*i/resolution;
      
      float x1 = agentsA[0].mPos.x;
      float y1 = agentsA[0].mPos.y;
      float x2 = agentsB[0].mPos.x;
      float y2 = agentsB[0].mPos.y;   
      
      float x = lerp(agentsA[0].mNoiseX.value(a - delay * p), agentsB[0].mNoiseX.value(a - delay * (1-p)), p);
      float y = lerp(agentsA[0].mNoiseY.value(a - delay * p), agentsB[0].mNoiseY.value(a - delay * (1-p)), p);
      
      vertex(x,y);
    }
    endShape();
}
