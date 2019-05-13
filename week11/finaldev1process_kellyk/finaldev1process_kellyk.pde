//P3D Scenes
int cols, rows;
int scl = 20;
int w = 800;
int h = 800;
float moveone;
float movetwo;

int invaderLone = 400;
int invaderLtwo = 400;
int invaderRone = 400;
int invaderRtwo = 400;
float speed = 0;
float[][] terrain;

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

     translate(0, 300);
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


noStroke();
lights();

//catch the invaders
//make a class
pushMatrix();
moveone += moveone * 0.00001;
translate(300, invaderLone, moveone++);
rotateY(radians(frameCount * 0.5));
sphere(5);
popMatrix();

pushMatrix();
movetwo += movetwo * 0.0001;
translate(300, invaderLtwo, movetwo++);
rotateY(radians(frameCount * 0.5));
sphere(5);
popMatrix();

pushMatrix();
translate(400, invaderRone, -100 + moveone++);
rotateY(radians(frameCount *0.5));
sphere(5);
popMatrix();

pushMatrix();
translate(400, invaderRtwo, -100 + moveone++);
rotateY(radians(frameCount *0.5));
sphere(5);
popMatrix();


beginShape();
vertex(220, 420, 360);
vertex(480, 420, 360);
vertex(480, 450, 380);
vertex(220, 450, 380);
endShape();
//Make a long line for the the killzone for the invaders

if (key == CODED) {
  if (keyCode == LEFT) {
    if (moveone > 400 && moveone < 470) {
    invaderLone = -400;
  }
}
}
if (key == CODED) {
  if (keyCode == LEFT) {
    if (movetwo > 400 && movetwo < 470) {
    invaderLtwo = -400;
  }
}
}

if (key == CODED) {
  if (keyCode == RIGHT) {
    invaderRone = -400;
}
}

if (key == CODED) {
  if (keyCode == RIGHT) {
    invaderRtwo = -400;
}
}
}
