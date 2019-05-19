Minim minim;
AudioPlayer NextLevel;
AudioPlayer DGintro;
AudioPlayer Gameover;
AudioPlayer StartClick;
AudioPlayer Win;
AudioPlayer Clock;
AudioPlayer Ding;
//render texts
import processing.pdf.*;

PFont oneFont;
int state = 0;
float starttime;
float timeelapsed;
PImage finalstage;
PImage keys;
float fadein;
int score;

Blocks[]block = new Blocks[10];
InvadersL[]invaderl = new InvadersL[10];
InvadersR[]invaderr = new InvadersR[10];
Flashlight f;

int cols, rows;
int scl = 20;
int w = 800;
int h = 800;
float speed = 0;
float[][] terrain;
Table data;

int t = 0;
String text1 = "";
String text2 = "";

void setup() {
  data = loadTable("textdata.csv");
  keys = loadImage("keys.png");
  background(0);
  size(700, 700, P3D, "TypeDemo.pdf");
  textMode(SHAPE);
  finalstage = loadImage("exit.jpg");
  finalstage.loadPixels();
  minim = new Minim(this);
  NextLevel = minim.loadFile("NextLevel.mov");
  DGintro = minim.loadFile("eh.mp3");
  DGintro.setGain(-15); 
  Ding = minim.loadFile("ding.mp3");
  Gameover = minim.loadFile("GameOver.mov");
  Win = minim.loadFile("win.mov");
  Win.setGain(-10); 
  Clock = minim.loadFile("clock.mp3");
  StartClick = minim.loadFile("StartClick.mov");
  starttime = millis();
  oneFont = createFont("PressStart2P-Regular.ttf", 20);
  for (int i = 0; i < block.length; i++) {
    block[i] = new Blocks(random(width), random(height), random(-600, 400));
  }
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];

  for (int i = 0; i < invaderl.length; i++) {
    invaderl[i] = new InvadersL(300, 400, -300);
  }
  for (int i = 0; i < invaderl.length; i++) {
    invaderr[i] = new InvadersR(400, 400, -300);
  }
  f = new Flashlight();
  smooth();
}


void draw() {

  TableRow row = data.getRow(0);  
  String one = row.getString(0);
  String two = row.getString(1);
  String three = row.getString(2);
  String four = row.getString(3);
  String five = row.getString(4);
  String six = row.getString(5);

  switch (state) {
  case 0:
    DGintro.play();
    textFont(oneFont);
    fill(255);
    textSize(20);
    //textMode(CENTER);
    text(text1, 60, 200, 605, 300);
    if (t < one.length()) {
      if (frameCount % 3 == 0) {
        t++;
      }
      text1 = one.substring(0, t);
    }

    fill(201, 78, 66);
    rect(250, 400, 200, 50);
    if (mouseX > 250 && mouseX < 450 && mouseY > 400 && mouseY < 450) {
      fill(255, 150, 140);
      rect(250, 400, 200, 50);
    } else {
      fill(206, 49, 33);
    }
    fill(0);
    textSize(15);
    text("START GAME!", 270, 435);
    break;

    //goes into a function
  case 1:
  //DGintro.close();
    timeelapsed = (millis() - starttime)/1000;
    if (timeelapsed > 1) {
      advance();
      starttime = millis();
    } 
    noStroke();
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j <100; j++) {
       float b = map(noise(j * 0.2, i * 0.2, frameCount *0.1), 0, 2, 0, 255);
      fill(b*1.5, b/2, b/2, 200);
      rect(i * 50, j * 50, 50, 50);
    }
    ellipse(350, 350, 600, 600);
    }
    break;

  case 2:
    timeelapsed = (millis() - starttime)/1000;
    if (timeelapsed > 4) {
      advance();
      starttime = millis();
    } 
    println(timeelapsed);
    background(0);
    image(keys, 180, 400, 380, 110);

    textSize(30);
    fill(255);

     if (timeelapsed > 0) {
       fill(255, 255, 255, fadein);
       text(two, 50, 200, 610, height);
     }
     fadein += fadein * 0.1;
     if (fadein < 255) {
       fadein++;
     }
    break;


  case 3:
    background(0);
    timeelapsed = (millis() - starttime)/1000;
    if (timeelapsed > 20) {
      advance();
      starttime = millis();
    }
    directionalLight(255, 150, 400, 400, 400, -1);
    pointLight(255, 255, 190, 100, 100, 100);
    for (int i = 0; i < block.length; i++) {
      block[i].display();
    }
    break;

  case 4:
    background(0);
    timeelapsed = (millis() - starttime)/1000;
    //println(timeelapsed);
    if (timeelapsed > 4) {
      advance();
      starttime = millis();
    }
    textSize(30);
    fill(255);
    text(three, 70, 250, 600, height);
    break;
    
  case 5:
      timeelapsed = (millis() - starttime)/1000;
      if (timeelapsed > 1) {
      advance();
      starttime = millis();
    }
        noStroke();
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j <100; j++) {
       float b = map(noise(j * 0.2, i * 0.2, frameCount *0.1), 0, 2, 0, 255);
      fill(b*1.5, b/2, b/2, 200);
      rect(i * 50, j * 50, 50, 50);
    }
    ellipse(350, 350, 600, 600);
    }
    fill(0);
    break;

  case 6:
    background(0);
    timeelapsed = (millis() - starttime)/1000;
    if (timeelapsed > 4) {
      advance();
      starttime = millis();
    }
    textSize(28);
    fill(255);
    text(four, 80, 250, 610, height);
     image(keys, 180, 400, 380, 110);
    break;


  case 7:
    background(0);
    NextLevel.play();
    timeelapsed = (millis() - starttime)/1000;
    if (timeelapsed > 20) {
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
      //invaderl[i].keyPressed();
    }
    for (int i = 0; i < invaderl.length; i++) {
      invaderr[i].display();
      //invaderr[i].keyPressed();
    }
    break;

  case 8:
      timeelapsed = (millis() - starttime)/1000;
    if (timeelapsed > 5.5) {
      advance();
      starttime = millis();
    }
  background(0);
  textSize(30);
  text("RIP invaders. Now you need to find the right exit... the clock is ticking!", 50, 280, 620, height);
  break;
  
  case 9: 
    timeelapsed = (millis() - starttime)/1000;
    if (timeelapsed > 5) {
      Clock.pause();
      state = 11;
      starttime = millis();
    }
    Clock.play();
    //not done with this part yet but the exits are going to be clickable
    //5-10s to figure out which one it is
    background(0);
    f.display();
    break;

  case 10:
  DGintro.pause();
    Win.play();
    background(255);
    fill(0);
    textSize(30);
    text(five, 90, 300, 530, height);
    Clock.pause();
    break;

  case 11:
    background(0);
    Gameover.play();
    Clock.pause();
    fill(255);
    textSize(40);
    text(six, 90, 260, 600, height);
     fill(201, 78, 66);
    rect(250, 400, 200, 50);
    if (mouseX > 250 && mouseX < 450 && mouseY > 400 && mouseY < 450) {
      fill(206, 49, 33);
      rect(250, 400, 200, 50);
    } else {
      fill(201, 78, 66);
    }
    fill(0);
    textSize(15);
    text("PLAY AGAIN", 277, 434);
  
    break;
  }
}
void advance() {
  state++;
}

void mousePressed() {
  switch (state) {
  case 0:
    if (mouseX > 250 && mouseX < 450 && mouseY > 400 && mouseY < 450) {
      advance();
      //restarts timer
      starttime = millis();
      StartClick.play();
    }
    break;

  case 11:
    if (mouseX > 250 && mouseX < 450 && mouseY > 400 && mouseY < 450 && mousePressed) {
      background(0);
      state = 1;
      starttime = millis();
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
