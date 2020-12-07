void mouseReleased() {

  if (mode == INTRO && touchingMouse(width/2, height/2, 200, 100)) {

    mode = GAME;
  }
  if (mode == GAME && touchingMouse(200, 100, 200, 100)) {

    mode = PAUSE;
  }
  if (mode == PAUSE && touchingMouse(400, 100, 200, 100)) {

   mode = GAME;
  }
  if(mode == GAMEOVER){
   mode = INTRO; 
  }
  if(mode == WIN){
   mode = INTRO; 
  }
}
