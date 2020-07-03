import processing.pdf.*;

// global variable for cell size
int size = 20;


ArrayList<Cell> myCells;

void setup() {
  // define canvas size in pixel
  size(1000, 1000);
  
  myCells = new ArrayList<Cell>();
  
  for(int x = 0; x < width; x+=size) {
    for(int y = 0; y < height; y+=size) {
      Cell c = new Cell(x, y, size);
      
      myCells.add(c);
    }
  }
}

// event that gets fired whenever the mouse button is released
void mouseReleased() {
  // save current frame to project folder
  saveFrame("data/line-######.png");
}

void draw() {
  background(0);
  
  // iterate through arraylist
  for(Cell c : myCells) {
    c.show();
  }
  
  // don't loop
  noLoop();
}
