void game() {
  background(0, 0, 255);
  fill(255);
  rect(200, 100, 200, 100);
  fill(0);
  button(200, 100, 200, 100, 50, "DIE");
  background(0);
  fartShip.show();
  fartShip.act();
  fartAsteroid.show();
  fartAsteroid.act();
  int i = 0;
while (i < fartObjects.size()) {
  GameObject obj = fartObjects.get(i);
  if (obj.lives >0) {
    obj.show();
    obj.act();
    i++;
  } else {
    fartObjects.remove(i);
  }
}

}
