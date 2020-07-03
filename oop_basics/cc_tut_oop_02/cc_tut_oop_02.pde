Shape s1;
Shape s2;
Shape s3;
Shape s4;

void setup() {
  size(1000, 1000);
  s1 = new Shape(width*1/4, height*1/4, width/4, 3);
  s2 = new Shape(width*3/4, height*1/4, width/4, 4);
  s3 = new Shape(width*1/4, height*3/4, width/4, 5);
  s4 = new Shape(width*3/4, height*3/4, width/4, 6);
}

void draw() {
  background(0);
  
  s1.show();
  s2.show();
  s3.show();
  s4.show();
}
