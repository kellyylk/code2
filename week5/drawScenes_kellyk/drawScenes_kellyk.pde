// bryan ma for code 2 sp 19

int scene = 0;

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  fill(0);
  switch (scene) {
    case 0:
      ellipse(200, 200, 100, 100);
      fill(255);
      ellipse(180, 190, 10, 10);
      ellipse(220, 190, 10, 10);
      fill(0);
      rect(570, 155, 20, 100);
      text("walk to the door, press an arrow to move", 300, 400);
      break;
    case 1:
      fill(random(255), random(255), random(255));
      rect(300, 300, 100, 100);
      text("you've entered the void!", 200, 500);
      fill(0);
      text("press the mouse to get out of here...", 350, 580);
      break;
    case 2:
      triangle(0, 0, width, 0, width/2, height);
      fill(255);
      text("hello :)", 300, 200);
      break;
    case 3:
      text("goodbye", 100, 100);
      break;
    default:
      break;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
  switch (scene) {
    case 0:
    case 2:
      advance();
   break;
  case 3: break;
    default:
      break;
  }
  }
  }
}

void mousePressed() {
    switch (scene) {
    case 1: advance();
    
  }
  
}
void advance() {
  scene++;
}
