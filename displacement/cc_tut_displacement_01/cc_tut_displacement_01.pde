float xStart;
float yStart;
float xEnd;
float yEnd;
float radius;

void setup() {
  size(1000, 1000);
  
  radius = 20;
  xStart = radius/2;
  yStart = height/2;
  xEnd = width - radius/2;
  yEnd = height/2;

}

void draw() {
  background(20);
  stroke(255);
  strokeWeight(5);
  line(xStart, yStart, xEnd, yEnd);
  fill(255);
  noStroke();
  circle(xStart, yStart, radius);
  circle(xEnd, yEnd, radius);
}

void keyPressed() {
  if (key == 's') {
    saveFrame("output/"+frameCount+".png");
  }
}
