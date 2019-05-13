PFont myFont;
int state = 0;
float starttime;
float timeelapsed;

void setup() {
  size(700, 700);
  background(0);
  starttime = millis();
  myFont = createFont("CourierNewPSMT", 20);
}

void draw() {
  switch (state) {
  case 0:
  textAlign(CENTER);
  textFont(myFont);
  fill(255);
  text("HELLO… You’ve entered the catastrophic tunnel", 350, 250);
  text("Your job is to get out here.", 380, 280);
  text("instructions will guide you through every level.", 350, 310);
  text("(You only have 3 lives)", 350, 340);
  fill(155, 193, 255);
  rect(250, 400, 200, 50);
  fill(0);
  text("START GAME!", 350, 430);
  break;
  
  //goes into a function
  case 1:
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
  text("pt 2 test", 350, 400);
  timeelapsed = (millis() - starttime)/1000;
  println(timeelapsed);
  if (timeelapsed > 10) {
  advance();
  starttime = millis();
  }
  break;
  

  case 3:
  background(0);
  text("pt 3 test", 350, 400);
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
    }
    }
