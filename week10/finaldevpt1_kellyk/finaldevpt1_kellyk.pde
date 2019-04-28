//P3D Scenes
int cols, rows;
int scl = 20;
int w = 300;
int h = 800;

float speed = 0;
float[][] terrain;
float lmovement = 0;
float rmovement = 0;
void setup() {
  size(700, 700, P3D);
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
}

void draw() {
  background(0);
  stroke(255);
  directionalLight(255, 150, 400, 400, 400, -1);
  pointLight(255, 255, 190, 100, 100, 100);
  
  speed -= 0.01;
  //offset to increment separately
  float yoff = speed;
  for (int y = 0; y < rows; y++) {
    float xoff = 1;
    for (int x = 0; x < cols; x++) {
      //use perlin noise to make it smooth
    terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
    xoff +=0.2;
  }
  yoff += 0.2;
  }
  
  pushMatrix();
  //trying to move both terrains for the user to "walk" on
  //but not sure how to make it work smoothly w/ translate since it translates the previous translate
  //should I use the camera()? not sure how that works with left and right keys
  //only found an example for mouseX
  if (key == CODED) {
    if (keyCode == LEFT) {
      lmovement += 1;
      lmovement ++;
     translate(lmovement, 300);
     if (lmovement < -10);
     translate(-10, 100);
    }
  }
  
  if (key == CODED) {
    if (keyCode == RIGHT) {
      rmovement += -1;
      rmovement --;
      translate(rmovement, 300);
      if (rmovement > 700);
    }
    
  }
     rotateX(PI/3);
  for (int y = 0; y < rows -1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y * scl, terrain[x][y]); 
      vertex(x*scl, (y+1) * scl, terrain[x][y+1]);
     //need to pull vertices up after grids are made
     //The Z value needs to chane
    }
    endShape();
}
popMatrix();

  pushMatrix();
     translate(400, 300);
     rotateX(PI/3);
  for (int y = 0; y < rows -1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y * scl, terrain[x][y]); 
      vertex(x*scl, (y+1) * scl, terrain[x][y+1]);
     //need to pull vertices up after grids are made
     //The Z value needs to chane
    }
    endShape();
}
popMatrix();



}
