//I tried to make a child inheritance but I think I need more time to put everything together

Button b;

color bgColor = color(230);
int button1x = 180;
int button1y = 200;
int button2x = 420;
int button2y = 200;
int buttonSize = 125;
String textToShow = "";

void setup() {
  size(600, 600);
  b = new Button();
  b = new leftButton();
  b = new rightButton();
}

void draw() {

  background(bgColor);
  if (dist(mouseX, mouseY, button1x, button1y) < buttonSize/2 && mousePressed) {
    b.display();
  } else {
    b.defa();
  }

  
  if (dist(mouseX, mouseY, button2x, button2y) < buttonSize/2 && mousePressed) {
    b.update();
  } else {
    fill(255);
    b.defa();
  }
  fill(0);
  textAlign(CENTER);
  textSize(28);
  text(textToShow, width/2, 400);
  }
 

class Button {
color button1BG;
String button1Text;
color button2BG;
String button2Text ;
int buttonSize;
String textToShow;

  Button() {
    button1BG = color(230, 255, 200);
    button1Text = "button 1 pressed!";
    button2BG = color(255, 200, 230);
    button2Text = "button 2 pressed!";
    buttonSize = 125;
    textToShow = "";
  }
  
  void display() {
    textToShow = button1Text;
    bgColor = button1BG;
    fill(0);
    ellipse(button1x, button1y, buttonSize, buttonSize);
  }
  
  void update() {
    textToShow = button2Text;
    bgColor = button2BG;
    fill(0);
    ellipse(button2x, button2y, buttonSize, buttonSize);
  }
  void defa() {
     fill(255);
     ellipse(button1x, button1y, buttonSize, buttonSize);
     ellipse(button2x, button2y, buttonSize, buttonSize);
     fill(0);
     textAlign(CENTER);
  textSize(28);
  text(textToShow, width/2, 400);
  }

}
class leftButton extends Button {
  void display() {
    fill(0);
    ellipse(button1x, button1y, buttonSize, buttonSize);
  }
}

class rightButton extends Button {
  void display() {
    fill(random(255), 20, 20);
    ellipse(button2x, button2y, buttonSize, buttonSize);
  }
  
}
