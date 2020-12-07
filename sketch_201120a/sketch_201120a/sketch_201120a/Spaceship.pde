class Spaceship extends GameObject {
  //1. Instance variables or Fields

  PVector direction;
  float x, y;
  float vx, vy;
  float size;
  
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
    lives=3;
    shotTimer = threshold = 10;
  }
  //3. Behaviour functions
  void show() {
    if(invincible==true){
     fill(255,0,0); 
    }else{
      fill(0);
    }
    pushMatrix();
    strokeWeight(3);
    stroke(255);
    
    translate(location.x, location.y);

    rotate(direction.heading());
    rect(0, 0, size, size);
    line(0, 0, size, 0);
    popMatrix();
  }
  void act() {
    super.act();
    if (invincible==true) {
      invincibletimer++;
    }
    if (invincibletimer>300) {
      invincible=false;
      invincibletimer=0;
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
          if (invincible==false) {
            lives--;
          }
          if(obj.invincible==false){
          obj.lives=0;
          }
          invincible=true;
          if (obj.size > 60 && obj instanceof Asteroid) {
            fartObjects.add(new Asteroid((int)obj.size/2, location.x, location.y));
            fartObjects.add(new Asteroid((int)obj.size/2, location.x, location.y));
          }
          if (obj.bulletUFO==false && obj.invincible==false) {
            score++;
          }
        }
      }
      i++;
    }


    if (fartShip.lives<=0) mode = GAMEOVER;
  }
}
