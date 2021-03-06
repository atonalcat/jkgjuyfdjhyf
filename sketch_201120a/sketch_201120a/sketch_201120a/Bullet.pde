class Bullet extends GameObject {
  //1. Instance variables
  //2. Constructor
  Bullet() {
    location = new PVector(fartShip.location.x, fartShip.location.y);
    velocity = new PVector(fartShip.direction.x, fartShip.direction.y);
    velocity.setMag(15);
    lives = 1;
    bulletUFO = false;
  }
  Bullet(float locx, float locy, float velx, float vely) {
    location = new PVector(locx, locy);
    velocity = new PVector(velx, vely);
    velocity.setMag(15);
    lives = 1;
    bulletUFO = true;
  }
  //Behaviour functions

  void act() {
    super.act();
    if (location.x < 0 || location.x > width || location.y <0 || location.y > height) {
      lives = 0;
    }
  }
}
