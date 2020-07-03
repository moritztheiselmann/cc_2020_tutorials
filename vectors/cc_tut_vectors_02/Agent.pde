class Agent {
  PVector position;
  PVector velocity;
  
  Agent() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
  }
  
  void update() {
    velocity = PVector.random2D();
    velocity.mult(5);
    position.add(velocity);
  }
  
  void show() {
    noStroke();
    fill(255);
    circle(position.x, position.y, 5);
  }
}
