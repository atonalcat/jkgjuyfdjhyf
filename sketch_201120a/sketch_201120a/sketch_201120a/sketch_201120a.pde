Spaceship fartShip;
ArrayList<GameObject> fartObjects;
int p=0;
int score;

boolean wKey, aKey, sKey, dKey, spaceKey, offScreen;
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int WIN = 4;
void setup() {
  timer=800;
  size(1920, 1080); 
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  fartShip = new Spaceship();
  wKey=sKey=aKey=dKey=spaceKey=false;
  fartObjects = new ArrayList<GameObject>();

  for (int i=0; i<random(4, 9); i++) {
    fartObjects.add(new Asteroid()); 
    p=(i+1)*3;
  }
}

void draw() {

  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == WIN) {
    win();
  } else {
    println("error mode" + mode);
  }
}
