class Shape {
  float xPos = random(0, 600);
  float yPos = random(0, 600);
  color c;
  color c2;
  
  Shape(int i, int j) {
    c = color(map(i, 0, 10, 0, 20));
    c2 = color(random(255), random(255), random(255));
}
  void display() {
    noStroke();
    fill(c, 0, 100);
    rect(yPos, xPos, 5, 50);
    fill(c2);
    ellipse(xPos, yPos, 2, 2);
   
  }
}
