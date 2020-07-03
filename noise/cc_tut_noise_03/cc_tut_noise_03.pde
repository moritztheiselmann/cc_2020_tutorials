float x;
float y;
float radius = 100;
float xoff = 0;
float yoff = 100;
color c;

void setup() {
  size(1000, 1000);
  y = height/2;
  x = width/2;
  c = color(255, 255, 255);
  
  noiseSeed(66666);
}

void draw() {
  background(0);
  
  x = map(noise(xoff), 0, 1, 0, width);
  y = map(noise(yoff), 0, 1, 0, height);
  radius = map(noise(xoff), 0, 1, 10, 250);
  c = color(map(noise(xoff), 0, 1, 0, 255));
  
  xoff = xoff + 0.01;
  yoff = yoff + 0.01;
  
  fill(c);
  noStroke();
  circle(x, y, radius);
}
