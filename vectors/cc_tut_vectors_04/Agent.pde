class Agent {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  
  Agent() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    maxSpeed = 10;
  }
  
  void update() {
    position.add(velocity);
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
  }
  
  void show() {
    noStroke();
    fill(255);
    circle(position.x, position.y, 50);
  }
  
  void seek(PVector target) {
    PVector direction = new PVector();
    direction = PVector.sub(target, position);
    direction.normalize();
    acceleration = direction;
    acceleration.mult(0.5);
  }
  
  void edges() {
    if(position.x < 0) {
      position.x = width;
    }
    if(position.x > width) {
      position.x = 0;
    }
    
    if(position.y < 0) {
      position.y = height;
    }
    if(position.y > height) {
      position.y = 0;
    }
  }
}
