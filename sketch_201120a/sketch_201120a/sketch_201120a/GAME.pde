
int timer;
void game() {
 timer++;
  

  background(0, 0, 255);
  fill(255);
  rect(200, 100, 200, 100);
  fill(0, 0, 255);
  text("Lives =" + fartShip.lives, 200, 300);

  background(0);
  fartShip.show();
  fartShip.act();
  
  int i = 0;
  while (i<fartObjects.size()) {
    GameObject obj = fartObjects.get(i); //get obj
    if (obj.lives > 0) {
      obj.show();
      obj.act();

      i++;
    } else fartObjects.remove(i);
  } 
  if (timer==1000) {
    fartObjects.add(new UFO());
    timer=0;
  }
  button(200, 100, 200, 100, 50, "Pause");
  button(1500, 100, 200, 100, 50, "Lives:"+fartShip.lives);
  button(1500, 200, 200, 100, 50, "Score:"+score);

  if (mode == GAME && score == p && fartShip.lives>0) {
    mode = WIN;
  }
}
