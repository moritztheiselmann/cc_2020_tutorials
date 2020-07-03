PVector pos;

void setup() {
  size(1000, 1000);
  pos = new PVector(width/2, height/2);
}

void draw() {
    
  pos.x = mouseX;
  pos.y = mouseY;
  translate(width/2, height/2);
  background(0);
  noFill();
  stroke(255);
  strokeWeight(5);

  
  line(0, 0, pos.x, pos.y);
  println(degrees(pos.heading()));
}
