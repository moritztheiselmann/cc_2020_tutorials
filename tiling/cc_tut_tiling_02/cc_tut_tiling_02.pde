int num = 10;
//int maskDiameter = 0;
//int stepSize = 5;
float t = 0;

ArrayList<Cell> cells;

void setup() {
  size(1000, 1000);
  
  cells = new ArrayList<Cell>();
  float size = (float)width / num;
  for (int y = 0; y < height; y += size) {
    for (int x = 0; x < width; x += size) {
      Cell c = new Cell(x, y, size/2);
      cells.add(c);
    }
  }
}

void mouseReleased() {
  for(Cell c : cells) {
    c.animate();
  }
}

void draw() {
  background(0); 
  
  for(Cell c : cells) {
    c.update();
    c.show();
  }
  
}
