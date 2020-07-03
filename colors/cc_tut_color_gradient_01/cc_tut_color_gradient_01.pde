// 252, 247, 127
// 60, 151, 163
// 142, 203, 190
// 228, 228, 228

color colors[];

void setup() {
  size(1000, 1000);
  
  colors = new color[4];
  colors[0] = color(252, 247, 127);
  colors[1] = color(60, 151, 163);
  colors[2] = color(142, 203, 190);
  colors[3] = color(228);
}

void draw() {
  background(0);
  // define width of the area 
  int w = width/4;
  // iterate through every pixel (x-axis) after mouseX
  for(int i = 0; i < w; i++) {
    // calculate fraction for every pixel
    float fraction = (float)(mouseX + i) / width;
    
    // interpolate between 2 colors based on the index (i)
    color cInter = lerpColor(colors[0], colors[1], fraction);
    stroke(cInter);
    line(mouseX + i, 0, mouseX + i, height);
  }
}
