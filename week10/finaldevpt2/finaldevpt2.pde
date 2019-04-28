void setup() {
  size(700, 700, P3D);
}

void draw() {
  background(0);
  stroke(255);
  directionalLight(255, 150, 400, 400, 400, -1);
  pointLight(255, 255, 190, 100, 100, 100);
  
  pushMatrix();
  translate(500, 600);
  rotateY(radians(frameCount *0.5));
  box(100);
  popMatrix();
  
  pushMatrix();
  translate(100, 540);
  rotateX(radians(frameCount *0.5));
  box(50);
  popMatrix();
  
    
  pushMatrix();
  translate(100, 200);
  rotateX(radians(frameCount *0.5));
  box(75);
  popMatrix();
  
    
  pushMatrix();
  translate(500, 150);
  rotateY(radians(frameCount *0.5));
  box(80);
  popMatrix();
  
    
  pushMatrix();
  translate(300, 200);
  rotateZ(radians(frameCount *0.5));
  box(10);
  popMatrix();
  
  pushMatrix();
  translate(300, 500);
  rotateZ(radians(frameCount *0.5));
  box(82);
  popMatrix();
  
}
