//trying to use external data
Button b;
String[] data;

color bgColor = color(230);
int button1x = 180;
int button1y = 200;
int button2x = 420;
int button2y = 200;
int buttonSize = 125;
String textToShow = "";

void setup() {
  data = loadStrings("buttondata.txt");
  size(600, 600);
  b = new Button(data);
}

void draw() {

  background(bgColor);
  if (dist(mouseX, mouseY, button1x, button1y) < buttonSize/2 && mousePressed) {
    b.display();
  } else {
    fill(255);
    b.defa();
  }

  
  if (dist(mouseX, mouseY, button2x, button2y) < buttonSize/2 && mousePressed) {
    b.update();
  } else {
    b.defa();
  }
  fill(0);
  textAlign(CENTER);
  textSize(28);
  text(textToShow, width/2, 400);
  }
 

class Button {
String[] data;
color button1BG;
String button1Text;
color button2BG;
String button2Text ;
int buttonSize;
String textToShow;

  Button(String[] i) {
    button1BG = color(230, 255, 200);
    button1Text = "button 1 pressed!";
    button2BG = color(255, 200, 230);
    button2Text = "button 2 pressed!";
    buttonSize = 125;
    textToShow = "";
  }
  
  void display() {
    String[] splitData = data[0].split(",");
    String[] splitDatatwo = data[1].split(",");
    for (int i = 0; i < splitData.length; i++) {
    textToShow = button1Text;
    bgColor = button1BG;
    fill(0);
    ellipse(splitData, splitDatatwo, buttonSize, buttonSize);
  }
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
