class Particles extends GameObject {
  int t;
  Particles(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(random(3, 5), random(3, 5));
    velocity.rotate(random(360));
    velocity.setMag(5);
    t=200;
    size = 5;
    lives = 1;
  }
  void act() {
    super.act();
    t-=5;
    offScreen();
  }
  void show() {
    
    noStroke();
    fill(255, t);
    rect(location.x, location.y, size, size);
  }
}
