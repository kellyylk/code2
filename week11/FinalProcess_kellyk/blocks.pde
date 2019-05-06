class Blocks {
  float move = random(-600, 400);
  float xposition;
  float yposition;
  
  Blocks(float xpos, float ypos, float move) {
      move += move * 2;
      xposition = xpos;
      yposition = ypos;
  }
  
 void display() {
   if (move > 500) {
    move = -400;
    xposition = random(width);
    yposition = random(height);
  }
    if (move > 500) {
    xposition = random(width);
    yposition = random(height);
    move = -400;
  }
  
  if (key == CODED) {
    if (keyCode == LEFT) {
      xposition -= 2;
      xposition--;
    }
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      xposition += 2;
      xposition++;
    }
  }
  if (key == CODED) {
    if (keyCode == UP) {
      yposition -= 2;
      yposition++;
  }
  }
    if (key == CODED) {
    if (keyCode == DOWN) {
      yposition += 2;
      yposition--;
  }
    }
 
    //some control
    //make them stay on the screen for the game to be more difficult
    if (xposition > 700) {
      xposition = 700;
    }
    if (xposition < 0) {
      xposition = 0;
    }
    
  pushMatrix();
  translate(xposition, yposition, move++);
  rotateY(radians(frameCount *0.5));
  rotateX(radians(frameCount *0.5));
  rotateZ(radians(frameCount *0.5));
  box(100);
  popMatrix();
//if they get to a point on your screen
if (move > 500 && xposition > 200 && xposition < 400 && yposition > 200 && yposition < 400) {
  textSize(32);
  fill(0);
  text("oh no!", 300, 300);
}
 }
}
