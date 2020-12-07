class Spaceship extends GameObject {
  //1. Instance variables or Fields

  PVector direction;
  float x, y;
  float vx, vy;
  float size;
  int invincibletimer;

  int shotTimer;
  final int threshold;
  //2. Constructor: make sure name matches class name
  Spaceship() {
    location = new PVector (width/2, height/2);
    direction = new PVector(0.1, 0.1);
    velocity = new PVector (0, 0);
    x = width/2;
    y = height/2;
    vx=0;
    vy=0;
    size=50;
    lives=2;
    shotTimer = threshold = 10;
  }
  //3. Behaviour functions
  void show() {
    pushMatrix();
    strokeWeight(3);
    stroke(255);
    fill(0);
    translate(location.x, location.y);

    rotate(direction.heading());
    rect(0, 0, size, size);
    line(0, 0, size, 0);
    popMatrix();
  }
  void act() {
    super.act();
    invincibletimer++;
    if (invincibletimer<300) {
      if (lives<3) {
        fill(255);
        lives=3;         
      }
    }
    if (invincibletimer>400) {
      invincibletimer=301;
    }
    shotTimer++;
    if (aKey) direction.rotate(radians(-5));
    if (dKey) direction.rotate(radians(5));
    if (wKey) {
      velocity.add(direction);
      fartObjects.add(new Fire());
    }
    if (sKey) velocity.sub(direction);
    if (spaceKey && shotTimer>threshold) {
      shotTimer = 0;
      fartObjects.add(new Bullet());
    }
    location.add(velocity);
    if (location.x>width || location.x<20)  velocity.x*=-1;  //BOUNCE
    if (location.y>height || location.y<20)  velocity.y*=-1; 
    if (velocity.x>3) velocity.x = 3;
    if (velocity.x<-3) velocity.x = -3;
    if (velocity.y>3) velocity.y = 3;
    if (velocity.y<-3) velocity.y = -3;

    int i = 0;  //
    while (i<fartObjects.size()) {
      GameObject obj = fartObjects.get(i);
      if (obj instanceof Asteroid || obj instanceof UFO || obj instanceof Bullet && obj.bulletUFO) {
        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size) {
          lives--;
          obj.lives=0;
          if (obj.bulletUFO==false) {
            score++;
          }
        }
      }
      i++;
    }


    if (fartShip.lives<=0) mode = GAMEOVER;
  }
}
