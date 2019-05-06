class InvadersL {
float moveone;
int invaderLxpos;
float invaderLypos;

InvadersL(int xpos, float ypos, float moveone) {
  moveone += moveone * 0.0001;
  invaderLxpos = xpos;
  invaderLypos = ypos;
}
void display() {
  if(moveone > 500) {
    moveone = 0;
  }
    if(moveone > 500) {
    moveone = 0;
  }
noStroke();
lights();
pushMatrix();
translate(invaderLxpos, invaderLypos, moveone++);
sphere(5);
popMatrix();
if (key == CODED) {
  if (keyCode == LEFT) {
    invaderLypos = -400;
  }
    if (invaderLypos == -400 && moveone > 500) {
    invaderLypos = 400;
}
}
}
}
