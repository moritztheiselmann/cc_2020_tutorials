class Cell {
  Cell(float _x, float _y, float _size) {
    x = _x;
    y = _y;
    size = _size;
    c = color(map(x, 0, width, 0, 255));
    probability = random(0.1, 05);
  }
  
  float x;
  float y;
  float size;
  color c;
  float probability;
  float angle;
  
  void show() {
    noFill();
    stroke(c);
    if(random(1) < probability) {
      line(x, y, x+size, y+size);
    }
    else {
      line(x+size, y, x, y+size);
    }
  }
}
