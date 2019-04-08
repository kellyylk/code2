//class approach
//change the logic to make it a global state
//move values to external data
//ABOVE ALL REQUIRED
//-open to do whatever, (make child button, have the button states actually
//doing something interesting
Button b[] = new Button[2];
Table data;

int buttonSize = 125;

color button1BG = color(230, 255, 200);
color button2BG = color(255, 200, 230);

color bgColor = color(230);

int state = 0;


void setup() {
  size(600, 600);
  data = loadTable("data.csv", "header");
  for(int i = 0; i < data.getRowCount(); i++) {
    TableRow row = data.getRow(i);
    float x = row.getInt("x");
    float y = row.getInt("y");
     b[i] = new Button(x, y);
  }
}

void draw() {
  for(int i = 0; i < data.getRowCount(); i++) {
  b[i].display();
  b[i].update();
  }
  
}

void changeState() {
   state++;
 }
 

class Button {
int buttonSize;
int state;
PVector pos;

  Button(float x, float y) {
    pos = new PVector(x, y);
    buttonSize = 125;
    state = 0;
  }
  
  

  
  void display() {
     background(bgColor);
    switch (state) {
     case 0:
     fill(255);
     ellipse(b[0].pos.x, b[0].pos.y, buttonSize, buttonSize);
     ellipse(b[1].pos.x, b[1].pos.y, buttonSize, buttonSize);
     fill(0);
     break;
  
  case 1:
    fill(0);
    textAlign(CENTER);
    textSize(28);
    text("button 1 pressed!", width/2, 500);
    bgColor = button1BG;
    fill(0);
     ellipse(b[0].pos.x, b[0].pos.y, buttonSize, buttonSize);
     ellipse(b[1].pos.x, b[1].pos.y, buttonSize, buttonSize);
    break;
    
    case 2:
     textAlign(CENTER);
     textSize(28);
     fill(0);
    text("button 2 pressed!", width/2, 500);
    bgColor = button2BG;
    fill(0);
     ellipse(b[0].pos.x, b[0].pos.y, buttonSize, buttonSize);
     ellipse(b[1].pos.x, b[1].pos.y, buttonSize, buttonSize);
    break;
   
   
    default:
     fill(255);
     ellipse(b[0].pos.x, b[0].pos.y, buttonSize, buttonSize);
     ellipse(b[1].pos.x, b[1].pos.y, buttonSize, buttonSize);

  break;
  }
  }
  
  void update() {
    switch (state) {
      case 0:
       if (dist(mouseX, mouseY,b[0].pos.x, b[0].pos.y) < buttonSize/2 && mousePressed) {
         state = 1;
 
       }
       case 1:
        if (dist(mouseX, mouseY, b[1].pos.x, b[1].pos.y) < buttonSize/2 && mousePressed) {
          state = 2;
        }
   
        break;
        default:
        break;
}

  }
}
