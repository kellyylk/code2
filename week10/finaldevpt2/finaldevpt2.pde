float move;
float x;
float y;
void setup() {
  size(700, 700, P3D);
}

void draw() {
  background(0);
  stroke(255);
  directionalLight(255, 150, 400, 400, 400, -1);
  pointLight(255, 255, 190, 100, 100, 100);
  //if box is a certain Z position, update Z position
  //class
  move -= move * 0.0001;
  if (move > 300) {
    move = -1000;
  }
  
  if (key == CODED) {
    if (keyCode == LEFT) {
      x -= 2;
      x--;
    }
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      x += 2;
      x++;
    }
  }
      
  pushMatrix();
  translate(x + 500, y + 600, move++);
  rotateY(radians(frameCount *0.5));
  box(100);
  popMatrix();
  
  pushMatrix();
  translate(x+ 100, y + 540, -100 + move++);
  rotateX(radians(frameCount *0.5));
  box(50);
  popMatrix();
  
  pushMatrix();
  translate(x + 100, y + 200, -100 + move++);
  rotateX(radians(frameCount *0.5));
  box(75);
  popMatrix();
  
    
  pushMatrix();
  translate(x + 500, y + 150, -100 + move++);
  println(move);
  //300
  rotateY(radians(frameCount *0.5));
  box(80);
  popMatrix();
  
    
  pushMatrix();
  translate(x + 300, y + 200, move);
  rotateZ(radians(frameCount *0.5));
  box(10);
  popMatrix();
  
  pushMatrix();
  translate(x + 300, y + 500, move++);
  rotateZ(radians(frameCount *0.5));
  box(82);
  popMatrix();
}

void update() {
  
}
