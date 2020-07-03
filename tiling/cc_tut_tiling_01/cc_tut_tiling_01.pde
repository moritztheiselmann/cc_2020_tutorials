import processing.pdf.*;

// global variable for cell size
int size = 20;

// global variable for probability
float probability = 0.5; // change this value to increase or decrease the probability of rotating clock or counter-clock wise

void setup() {
  // define canvas size in pixel
  size(1000, 1000);
  
  // call function once on startup
  generatePattern();
}

// event that gets fired whenever the mouse button is released
void mouseReleased() {
  // generate new pattern
  generatePattern();
  // save current frame to project folder
  saveFrame("data/line-######.png");
}

void draw() {
  
}

void generatePattern() {
  // clear background with black color
  background(0);
  
  // generate new cell size with a random value between 15 - 100
  size = floor(random(15, 100));
  // nested for-loop for each X and Y value for evey cell
  for(int x = 0; x < width; x+=size) {
    for(int y = 0; y < height; y+=size) {
      pushMatrix();
      // move the canvas to a new origin
      // -> new origin is the center of each cell
      translate(x+size/2, y+size/2);
      
      // draw each cell (white transparent with opactiy)
      noFill();
      stroke(255, 50);
      rect(-size/2, -size/2, size, size);
      
      // decide on the rotation by random value
      // rotate the canvas by either PI/4 or -PI/4
      if(random(1) < probability) {
        rotate(PI/4);
      }
      else {
        rotate(-PI/4);
      }
      // draw horizontal line 
      stroke(255);
      line(-size/2, 0, size/2, 0);
      popMatrix();
    }
  }
}
