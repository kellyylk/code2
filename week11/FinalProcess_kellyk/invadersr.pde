class InvadersR {
float moveone;
int invaderRxpos;
float invaderRypos;

InvadersR(int xpos, float ypos, float moveone) {
  invaderRxpos = xpos;
  invaderRypos = ypos;
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
translate(invaderRxpos, invaderRypos, 100+ moveone++);
sphere(5);
popMatrix();
if (key == CODED) {
  if (keyCode == RIGHT) {
    invaderRypos = -400;
  }
  if (invaderRypos == -400 && moveone > 500) {
    invaderRypos = 400;
}
}
}
}
