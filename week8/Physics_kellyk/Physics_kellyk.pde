Malware[] blob = new Malware[500];
int state = 0;
float fix = 900;

void setup() {
  size(1000, 800);
  for (int i = 0; i < 500; i++) {
    blob[i] = new Malware();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < 500; i++) {
    
    blob[i].update();
    blob[i].display();
  }
}
 void changeState() {
    state++;
  }
 
 
