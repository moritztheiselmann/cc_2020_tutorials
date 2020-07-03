Agent myAgent;

void setup() {
  size(1000, 1000);
  myAgent = new Agent();
  background(0);
}

void draw() {
  myAgent.update();
  myAgent.show();
}
