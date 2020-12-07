class Asteroid extends GameObject {


  Asteroid() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(1), random(1));
    lives =1;
    size = 100;
    invincible = false;
  }
  Asteroid(int s, float x, float y) {  //for mini asteroids
    velocity = new PVector(2, 0);
    velocity.rotate(random(360));
    lives = 1;
    location = new PVector(x, y);
    size = s;
    invincibletimer=0;
    invincible = true;
  }

  void show() {
    fill(0);
    stroke(255);
    ellipse(location.x, location.y, size, size);
  }
  void act() {
    super.act();
    int i = 0;
    while (i < fartObjects.size()) {
      GameObject fartObj = fartObjects.get(i);
      if (fartObj instanceof Bullet && !fartObj.bulletUFO) {
        if (dist(location.x, location.y, fartObj.location.x, fartObj.location.y) <= size/2 + fartObj.size) {
          fartObj.lives = 0;
          if (invincible==false) {
            lives=0;
            score++;
          }
          if (size > 60) {
            fartObjects.add(new Asteroid((int)size/2, location.x, location.y));
            fartObjects.add(new Asteroid((int)size/2, location.x, location.y));
          }
          for (int j=0; j<random(10, 20); j++) fartObjects.add(new Particles(location.x, location.y));
        }
      }
      i++;
    }
    if (invincible==true) {
      invincibletimer++;
    }
    if (invincibletimer>30) {
      invincible=false;
      invincibletimer=0;
    }
    if (location.x>width || location.x<50)  velocity.x*=-1;  //BOUNCE
    if (location.y>height || location.y<50)  velocity.y*=-1;
  }
}
