void mouseReleased() {

  if (mode == INTRO) {
    if (touchingMouse(400, 600, 200, 100)) {
      mode = GAME;
    }
    
  }
  if (mode == GAME) {
      if (touchingMouse(200, 100, 200, 100)) {
        mode = GAMEOVER;
      }
    }
}
