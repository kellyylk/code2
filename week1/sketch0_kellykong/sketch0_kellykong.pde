int radiusa = 50;
void setup() {
  size(725, 400);

}

void draw() {
  background(255);
  float a = dist(mouseX, mouseY, 100, 100);
  
  if (a < radiusa && mousePressed) {
    fill(0);
    text("great", width/2, height/2);
    fill(0);
  } else {
    fill(255);
    
  }
  ellipse(100, 100, radiusa*2, radiusa*2);
  
  float b = dist(mouseX, mouseY, 275, 100);
  if (b < radiusa && mousePressed) {
    fill(0);
    text("humanity", width/2, 230);
  } else {
    fill(255);
  } 
  ellipse(275, 100, radiusa*2, radiusa*2);
  
  float c = dist(mouseX, mouseY, 450, 100);
  if(c < radiusa && mousePressed) {
    fill(0);
    text("is not", width/2, 260);
  } else {
    fill(255);
  }
  ellipse(450, 100, radiusa*2, radiusa*2);

  float d = dist(mouseX, mouseY, 625, 100);
  if(d < radiusa && mousePressed) {
    fill(0);
    text("humane", width/2, 300);
  } else {
    fill(255);
  }
  ellipse(625, 100, radiusa*2, radiusa*2);
  

}
