class GameObject {
  PVector location;
  PVector velocity;
  int lives;
  int size = 10;
  boolean bulletUFO;
  GameObject() {
  }
  void show() {
    strokeWeight(3);
    stroke(255);
    fill(0);
    rect(location.x, location.y, size, size);
  }
  void act() {
    location.add(velocity);
  }
  void offScreen() {
    if (location.x < 0 || location.x > width || location.y <0 || location.y > height)
      lives = 0;
  }
}
