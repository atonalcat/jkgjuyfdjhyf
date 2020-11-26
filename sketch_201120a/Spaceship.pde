class Spaceship {
  //1. Instance variables or Fields
  PVector location;
  PVector direction;
  float x, y;
  float vx, vy;
  float size;
  PVector velocity;
  int lives;
  //2. Constructor: make sure name matches class name
  Spaceship() {
   location = new PVector (width/2, height/2);
   direction = new PVector(0.1,0.1);
   velocity = new PVector (0,0);
    x = width/2;
    y = height/2;
    vx=0;
    vy=0;
    size=50;
    lives=3;
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
    line(0,0,size,0);
    popMatrix();
    println(location.x, location.y);
  }
  void act() {
    if(aKey) direction.rotate(radians(-5));
    if(dKey) direction.rotate(radians(5));
    if(wKey){
      velocity.add(direction);
      fartObjects.add(new Fire());
    }
    if(sKey) velocity.sub(direction);
    if(spaceKey) fartObjects.add(new Bullet());
   location.add(velocity);
  }
}
