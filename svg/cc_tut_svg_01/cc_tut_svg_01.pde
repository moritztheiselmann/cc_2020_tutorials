PShape svg;
PShape character;

void setup() {
  size(1000, 1000);
  svg = loadShape("data/typo.svg");
  character = svg.getChild("character");
  println(character.getVertexCount());
}

void draw() {
  background(0);
  float lX = map(cos(radians(frameCount)), -1, 1, 0, width);
  float lY = map(sin(radians(frameCount)), -1, 1, 0, width);
  for(int i =0; i < character.getVertexCount(); i++) {
    float x = character.getVertex(i).x;
    float y = character.getVertex(i).y;
    //circle(x, y, 15);
    //vertex(x, y);
    stroke(255);
    line(lX, lY, x, y);
  }
}
