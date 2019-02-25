//code 2 Bryan - visual elements pt2, in class, kelly k

int xpa = 10;
int ypa = 10;

Shape[][] shapes = new Shape[xpa][ypa];

void setup() {
  size(600, 600);
  background(0);
    for (int i = 0; i < xpa; i++) {
    for (int j = 0; j < ypa; j++) {
      shapes[i][j] = new Shape(i, j);
}
    }
}
void draw() {
    for (int i = 0; i < xpa; i++) {
    for (int j = 0; j < ypa; j++) {
      shapes[i][j].display();
    }
    }
}
