class UFO extends GameObject {
  int x;
  int shotTimer;
  final int threshold;
  UFO() {
    lives=3;
    x = (int)random(4);
    if (x==0) {
      location = new PVector(random(width), 0);
      velocity = new PVector(0, 2);
    } else if (x==1) {
      location = new PVector(random(width), height);
      velocity = new PVector(0, -2);
    } else if (x==2) {
      location = new PVector(0, random(height));
      velocity = new PVector(2, 0);
    } else if (x==3) {
      location = new PVector(width, random(height));
      velocity = new PVector(-2, 0);
    }
    shotTimer = threshold = 600;
    //location = new PVector(
  }
  void show() {
    fill(69);
    stroke(255);
    strokeWeight(3);
    ellipse(location.x, location.y, 70, 70);
  }

  void act() {
    super.act();
    int i = 0;
    while (i < fartObjects.size()) {
      GameObject fartObj = fartObjects.get(i);
      if (fartObj instanceof Bullet && !fartObj.bulletUFO) {
        if (dist(location.x, location.y, fartObj.location.x, fartObj.location.y) <= size + fartObj.size) {
          fartObj.lives = 0;
          lives=0;          
          for (int j=0; j<random(10, 20); j++) fartObjects.add(new Particles(location.x, location.y));
        }
      }
      i++;
    }
    shotTimer++;
    if (location.x < 0 || location.x > width || location.y <0 || location.y > height) {
      lives = 0;
    }
    if (shotTimer>threshold) {
      shotTimer = 0;
      fartObjects.add(new Bullet(location.x, location.y, fartShip.location.x-location.x, fartShip.location.y-location.y));
    }
  }
}
