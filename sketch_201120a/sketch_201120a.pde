Spaceship fartShip;
ArrayList<GameObject> fartObjects;
Asteroid fartAsteroid;
boolean wKey, aKey, sKey, dKey, spaceKey, offScreen;
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
void setup() {
  size(1440, 900); 
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  fartShip = new Spaceship();
  fartAsteroid = new Asteroid();
  wKey=sKey=aKey=dKey=spaceKey=false;
  fartObjects = new ArrayList<GameObject>();
  fartObjects.add(new Asteroid());
  fartObjects.add(new Asteroid());
  fartObjects.add(new Asteroid());
  fartObjects.add(new Asteroid());
  fartObjects.add(new Asteroid());
}

void draw() {

if(mode == INTRO){
    intro();
  }else if (mode == GAME){
    game();
  }else if (mode == PAUSE){
    pause();
  }else if (mode == GAMEOVER){
    gameover();
  }else{
    println("error mode" + mode);
  }
}
