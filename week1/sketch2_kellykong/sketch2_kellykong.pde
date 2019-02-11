float angle = 0;
float offset = 250;
float scalar = 200;
float speed = 0.02;

int radius = 50;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  
  float y1 = offset + sin(angle) * scalar;
  println(y1);
  
  ellipse(width/2, y1, radius*2, radius*2);
  stroke(0);
  
  angle += speed;
  
  float a = dist(mouseX, mouseY, 250, 450);
  if (a < radius && mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
}
