import processing.video.*;

Movie myMovie;
PGraphics pg;
ArrayList<Cell> cells;
int cNum = 10;

void setup() {
  size(1280, 720, P2D);
  
  myMovie = new Movie(this, "output.mov");
  myMovie.loop();
  myMovie.play();
  pg = createGraphics(width/2, height/2, P2D);
  
  cells = new ArrayList<Cell>();
  
  int cellSize = width / cNum;
  for(int y = 0; y < cNum; y++) {
    int yoff = cellSize * y;
    for(int x = 0; x < cNum; x++) {
      int xoff = cellSize * x;
      Cell c = new Cell(xoff, yoff, cellSize, cellSize);
      c.updateTexture(pg);
      cells.add(c);
    }
  }

}

void draw() {
  myMovie.read();
  pg.beginDraw();
  pg.image(myMovie, 0, 0);
  pg.endDraw();
  background(255);
  
  for(Cell c : cells) {
    c.updateTexture(pg);
    //c.update();
    c.show();
  }
  
  println(frameRate);
}
