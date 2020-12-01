class Asteroid extends GameObject {


  Asteroid() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(1), random(1));
    lives =1;
    size = 100;
  }

  void show() {
    
    stroke(255);
    ellipse(location.x, location.y, size, size);
  }
  void act() {
    super.act();
    int i = 0;
    while (i < fartObjects.size()) {
      GameObject fartObj = fartObjects.get(i);
      if (fartObj instanceof Bullet) {
        if (dist(location.x, location.y, fartObj.location.x, fartObj.location.y) <= size/2 + fartObj.size) {
          fartObj.lives = 0;
          fartBullet.lives = 0;
        }
      }
    }
    if (location.x < 0 || location.x > width || location.y <0 || location.y > height) {
      lives = 0;
    }
  }
}
