ArrayList<Shape> shapes;
int num = 4;

void setup() {
  size(1000, 1000);
  
  shapes = new ArrayList<Shape>();
  
  int index = 3;
  for (int y = 0; y < num/2; y++) {
    float dy = height/2 * y + height*1/4;
    for (int x = 0; x < num/2; x++) {
      float dx = width/2 * x + height*1/4;
      Shape s = new Shape(dx, dy, width/4, index);
      
      shapes.add(s);
      index++;
    }
  }
}

void draw() {
  background(0);
  
  for(Shape s : shapes) {
    s.show();
    s.checkPosition(mouseX, mouseY);
  }
}
