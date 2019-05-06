Minim minim;
AudioPlayer NextLevel;
AudioPlayer DGintro;
AudioPlayer Gameover;
AudioPlayer StartClick;

PFont myFont;
int state = 0;
float starttime;
float timeelapsed;
PImage finalstage;
Blocks[]block = new Blocks[10];

InvadersL[]invaderl = new InvadersL[10];
InvadersR[]invaderr = new InvadersR[10];

int cols, rows;
int scl = 20;
int w = 800;
int h = 800;
float speed = 0;
float[][] terrain;
float volume;
AudioPlayer player;
void setup() {
  background(0);
  size(700, 700, P3D);
  finalstage = loadImage("exit.jpg");
  finalstage.loadPixels();
  minim = new Minim(this);
NextLevel = minim.loadFile("NextLevel.mov");
DGintro = minim.loadFile("DGintro.mov");
Gameover = minim.loadFile("GameOver.mov");
StartClick = minim.loadFile("StartClick.mov");
  starttime = millis();
  myFont = createFont("CourierNewPSMT", 20);
    for (int i = 0; i < block.length; i++) {
    block[i] = new Blocks(random(width), random(height), random(-600, 400));
  }
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
  
      for (int i = 0; i < invaderl.length; i++) {
    invaderl[i] = new InvadersL(300, 400, random(-600, 400));
  }
     for (int i = 0; i < invaderl.length; i++) {
    invaderr[i] = new InvadersR(400, 400, random(-700, 400));
  }
}

void draw() {
  switch (state) {
  case 0:
  DGintro.play();
  textSize(20);
  textAlign(CENTER);
  textFont(myFont);
  fill(255);
  text("HELLO… You’ve entered the catastrophic tunnel", 350, 250);
  text("Your job is to get out here.", 380, 280);
  text("Instructions will guide you through every level.", 350, 310);
  text("(You mess up once, you're done. Goodluck!)", 350, 340);
  fill(155, 193, 255);
  rect(250, 400, 200, 50);
  fill(0);
  text("START GAME!", 350, 430);
  break;
  
  //goes into a function
  case 1:
  DGintro.pause();
  timeelapsed = (millis() - starttime)/1000;
  println(timeelapsed);
  if (timeelapsed > 3) {
  advance();
  starttime = millis();
  } 
  background(0);
  textSize(30);
  fill(255);
  text("Here you go...", 350, 280);
  text("Avoid the harzardous blocks ahead!", 350, 340);
  break;


  case 2:
  background(0);
  timeelapsed = (millis() - starttime)/1000;
  println(timeelapsed);
  if (timeelapsed > 10) {
  advance();
  starttime = millis();
  }
  directionalLight(255, 150, 400, 400, 400, -1);
  pointLight(255, 255, 190, 100, 100, 100);
     for (int i = 0; i < block.length; i++) {
    block[i].display();
}
break;
  
  
  case 3:
  background(0);
  timeelapsed = (millis() - starttime)/1000;
  println(timeelapsed);
  if (timeelapsed > 4) {
  advance();
  starttime = millis();
  }
  textSize(30);
  fill(255);
  text("Now..you're entering a territory", 350, 340);
  text("that does not belong to you", 350, 380);
  break;
  
  case 4:
  background(0);
  timeelapsed = (millis() - starttime)/1000;
  println(timeelapsed);
  if (timeelapsed > 3) {
  advance();
  starttime = millis();
  }
    textSize(30);
  fill(255);
  text("use left and right keys to kill", 350, 340);
  text("invaders on the left or right side", 350, 380);
  break;
  
  
  case 5:
  background(0);
  timeelapsed = (millis() - starttime)/1000;
  println(timeelapsed);
  if (timeelapsed > 15) {
  advance();
  starttime = millis();
  }
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
    }
    endShape();
}
popMatrix();
    for (int i = 0; i < invaderl.length; i++) {
  invaderl[i].display();
}
  for (int i = 0; i < invaderl.length; i++) {
    invaderr[i].display();
}
break;
  
  case 6: 
  //not done with this part yet but the exits are going to be clickable
  //5-10s to figure out which one it is
  background(0);
  //used your example code for the flashlight part
  loadPixels();
  finalstage.loadPixels();
  for (int x = 0; x < finalstage.width; x++) {
    for (int y = 0; y < finalstage.height; y++) {
      int loc = x + y* finalstage.width;
      float r,g,b;
      r = red(finalstage.pixels[loc]);
      g = green(finalstage.pixels[loc]);
      b = blue(finalstage.pixels[loc]);
     float maxdist = 80;
     float d = dist(x, y, mouseX, mouseY);
     float adjustbrightness = 255*(maxdist-d)/maxdist;
     r += adjustbrightness;
     g += adjustbrightness;
     b += adjustbrightness;
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
      color c = color(r, g, b);
      pixels [y * width + x] = c;
    }
  }
  updatePixels();
  break;
}
}
void advance() {
  state++;
}

void mousePressed() {
  if (mouseX > 200 && mouseX < 400 && mouseY > 400 && mouseY < 450) {
    switch (state) {
      case 0:
      advance();
      //restarts timer
      starttime = millis();
      StartClick.play();
      break;
}
  }
}

void update() {
    switch (state) {
      case 1:
      advance();
      break;
      case 2: 
      advance();
      break;
      case 3:
    }
}

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
