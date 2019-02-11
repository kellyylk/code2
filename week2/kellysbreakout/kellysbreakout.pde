int radius = 12;
float xpos = width/2;
float ypos = width/2;

float xspeed = 2.5;
float yspeed = 2;

int xdirection = 1;
int ydirection = 1;

int COLS = 10;
int ROWS = 6;
int w = 70;
int h = 20;
float xgap = 1.15;
float ygap = 1.8;
PVector[][] pos = new PVector[COLS][ROWS];

void setup() {
  size(800, 600);
  
  xpos = 0 + radius;
  ypos = 0 + radius;
  
}

void draw() {
  background(0);
  
  for(int i = 0; i < COLS; i++) {
    for(int j = 1; j < ROWS; j++) {
      fill(0);
      stroke(255);
      pos[i][j] = new PVector (i * w, j * h);
      rect(pos[i][j].x*xgap, pos[i][j].y*ygap, w, h);
    }
  }
  //ball movement
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  if (xpos > width - radius || xpos < radius) {
    xdirection = xdirection * -1;
  }
  if (ypos > height - radius || ypos < radius) {
    ydirection = ydirection * -1;
  }
  
  //ball
  fill(255);
  rect(xpos, ypos, radius*2, radius*2);
  
  //paddle
  rect(mouseX, 500, 80, 15);
  if(ypos > 480 && xpos - radius > mouseX && xpos < mouseX + 100) {
  ydirection *= -1;
  }
  
}
  
  
