//code2 Bryan - sketch1
//store positions, colors, active
//final before int does not make the number change (used in java)

final int COLS = 20;
final int ROWS = 20;
int w = 800;
int h = 800;
final int CELLSIZE = w/COLS;

PVector[][] pos = new PVector[COLS][ROWS];
color [][] colors = new color[COLS][ROWS];
boolean[][] isActive = new boolean[COLS][ROWS];


void setup() {
  size(800, 800);
  for(int i = 0 ; i < COLS; i++) {
    for(int j = 0; j < ROWS; j++) {
      pos[i][j] = new PVector(i * CELLSIZE, j * CELLSIZE);
      colors[i][j] = color(random(255), random(255), random(255));
      isActive[i][j] = false;
    }      
  }
  noStroke();
}
void draw() {
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      if (mouseX > pos[i][j].x && mouseX < pos[i][j].x + CELLSIZE && 
      mouseY > pos[i][j].y && mouseY < pos[i][j].y + CELLSIZE) {
      isActive[i][j] = true;
    }
      if (isActive[i][j]) {
      fill(colors[i][j]);
      rect(pos[i][j].x, pos[i][j].y, CELLSIZE, CELLSIZE);
    }
  }
  }
}
