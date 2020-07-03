Agent myAgent;

void setup() {
  size(1000, 1000);
  myAgent = new Agent();

}

void draw() {
  background(0);
  myAgent.update();
  myAgent.edges();
  myAgent.show();
}
