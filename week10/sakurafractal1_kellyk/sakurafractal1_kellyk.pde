//developing code from class into sakura tree
float theta = 0;
void setup() {
  size(700, 700);
  noLoop();
}

void draw() {
  background(244, 251, 255);
  strokeWeight(1);
  translate(width/2, height-20);
  branch(300);
}


void branch(float len) {
  noStroke();
  fill(255, 229, 246, 100);
  ellipse(10, 10, 20, 20);
  fill(255, 232, 175, 210);
  ellipse(10, 10, 5, 5);
    stroke(1.5);
    line(0, 0, 0, -len);
    theta = random(5, 100);
     translate(0, -len);
     len *= random(0.3, 0.8);
     
     if (len > 3) {
      int r = int(random(2));
      pushMatrix();
      rotate(radians(theta));
      branch(len);
      popMatrix();
      
      pushMatrix();
      rotate(radians(-theta));
      branch(len);
      popMatrix();
}
}
