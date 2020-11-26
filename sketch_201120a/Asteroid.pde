class Asteroid extends GameObject {


  Asteroid() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(10), random(10));
    lives =1;
  }

  void act() {
    super.act();
    if (location.x < 0 || location.x > width || location.y <0 || location.y > height) {
      lives = 0;
    }
  }
}
