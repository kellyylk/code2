//code 2 Bryan - visual elements pt1, kelly k
//position, color, length

int xpa = 10;
int ypa = 10;


int[][] shape = new int[xpa][ypa];
float[][] colors = new float[xpa][ypa];

void setup() {
  size(600, 600);
  background(0);
  for (int i = 0; i < xpa; i++) {
    for (int j = 0; j < ypa; j++) {
      shape[i][j] = (int)map(i, 0, xpa, 0, 50); // rounding the decimal, makin it into a whole number
      colors[i][j] = map(i, 0, 10, j, 20);
    }
  }
  
}

void draw() {
   for (int i = 0; i < xpa; i++) {
    for (int j = 0; j < ypa; j++) {
      float xPos = random(0, 600);
      float yPos = random(0, 600);
      noStroke();
      fill(colors[i][j], 0, 100);
      rect(yPos, xPos, 5, shape[i][j]);
      fill(random(255), random(255), random(255));
      ellipse(xPos, yPos, 2, 2);
      
}
   }
}
