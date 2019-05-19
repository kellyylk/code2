class InvadersL {
  float moveone;
  int invaderLxpos;
  float invaderLypos;
  InvadersL(int xpos, float ypos, float moveone) {
    this.moveone = moveone;
    invaderLxpos = xpos;
    invaderLypos = ypos;
  }
  void display() {
    //to make them come back
    if (moveone > 500 && invaderLypos == -400) {
      invaderLypos = 400;
      moveone = 0;
    }
    if (moveone > 500 && invaderLypos == -400) {
      invaderLypos = 400;
      moveone = 0;
    }
    text("DAMAGE LVL", 220, 50);
    text(score, 340, 100);
    noStroke();
    lights();
    pushMatrix();
    moveone += 12;
    translate(invaderLxpos, invaderLypos, -400+moveone);
    pointLight(51, 102, 126, 35, 40, 36);
    sphere(10);
    popMatrix();
    if (moveone > 1000) {
      state = 11;
    }

      if (key == CODED) {
        if (keyCode == LEFT) {
          invaderLypos = -400;
          score++;
        }
      }
    }
}
  //  if (key == CODED) {
  //    if (keyCode == LEFT) {
  //      invaderLypos = -400;
  //    }
  //  }
  //  if (keyPressed) {
  //    score++;
  //    //void keypressed
  //  }
  //  println(moveone);
  //}
