
class FragileBrick extends Brick {
  
    FragileBrick(float x, float y, float w, float h) {
    super(x, y, w, h);
    active = true;
    
  }
  void display() {
    rectMode(CORNER);
    noStroke();
    fill(155, 172, 255);
    rect(x, y, 30, 5);

    
  }
}
