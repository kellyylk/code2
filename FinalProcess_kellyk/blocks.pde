class Blocks {
  float move;
  float xposition;
  float yposition;
  
  Blocks(float xpos, float ypos, float move) {
    this.move = move;  
    xposition = xpos;
    yposition = ypos;
  }

  void display() {
    //2d rect for collision
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
    move += 3;
    move++;
    stroke(0.5);
    translate(xposition, yposition, -200 + move);
    rotateY(radians(frameCount *0.5));
    rotateX(radians(frameCount *0.5));
    rotateZ(radians(frameCount *0.5));
    box(100);
    popMatrix();
    //if they get to a point on your screen
    if (move > 500 && xposition > 250 && xposition < 450 && yposition > 250 && yposition < 450) {
      state = 11;
    }
    fill(255);
   stroke(126);
    //x, y, x, y left and bottom
    line(175, 175, 525, 175);
    stroke(125);
    line(525, 175, 525, 525);
    line(175, 525, 525, 525);
    line(175, 175, 175, 525);
    println(move);
  }
}
