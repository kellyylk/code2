class InvadersR {
  float moveone;
  int invaderRxpos;
  float invaderRypos;

  InvadersR(int xpos, float ypos, float moveone) {
    this.moveone = moveone;
    invaderRxpos = xpos;
    invaderRypos = ypos;
  }
  void display() {
    if (moveone > 500 && invaderRypos == -400) {
      invaderRypos = 400;
      moveone = 0;
    }
    if (moveone > 500 && invaderRypos == -400) {
      invaderRypos = 400;
      moveone = 0;
    }
    noStroke();
    lights();
    pushMatrix();
    moveone += 12;
    translate(invaderRxpos, invaderRypos, -400+ moveone);
    pointLight(51, 102, 126, 35, 40, 36);
    sphere(10);
    popMatrix();
    if (moveone > 1000) {
      state = 11;
    }
    if (key == CODED) {
      if (keyCode == RIGHT) {
        invaderRypos = -400;
      }
    }
  }
}
