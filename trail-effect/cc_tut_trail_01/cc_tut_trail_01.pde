ArrayList<PVector> positions;
float xoff;
int trialLength = 10;

void setup() {
  size(1000, 1000);
  background(0);
  positions = new ArrayList<PVector>();
  positions.add(new PVector(width/2, height/2));
}

void draw() {
  background(0);
  float dx = map(noise(xoff), 0, 1, 0, width);
  float dy = map(noise(50 + xoff), 0, 1, 0, height);
  if(positions.size() < trialLength) {
    PVector p = new PVector(dx, dy);
    positions.add(p);
  }
  else {
    positions.remove(0);
    PVector p = new PVector(dx, dy);
    positions.add(p);
  }
  
  int index = 0;
  for(PVector p : positions) {
    index++;
    noStroke();
    float opacity = map((float)index / positions.size(), 0, 1, 0, 255);
    println(opacity);
    fill(255, opacity);
    circle(p.x, p.y, 100);
  }
  
  xoff += 0.01;
}
