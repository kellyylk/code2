class AngryBrick extends Brick {
 
  AngryBrick(float x, float y, float w, float h) {
    super(x, y, w, h);
    active = true;
  }
  void display() {
    rectMode(CORNER);
    noStroke();
    fill(168, 18, 18);

    rect(x, y, w, h);
    

  }
}
