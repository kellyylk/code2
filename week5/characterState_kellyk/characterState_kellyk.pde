Particle p;
int state = 0;

void setup() {
  size(800, 800);
  p = new Particle();
}


void draw() {
  background(255);
  p.display();
  p.update();
}

 void changeState() {
    state++;
  }


class Particle {
int state;
int xpos;
int ypos;

Particle() {
  state = 0;
  xpos = 400;
  ypos = 500;
}
  void display() {
      switch (state) {
      case 0:
      fill(0);
      text("Press to begin", 400, 200);
      break;
      case 1:
      //character
      stroke(0);
      fill(255);
      ellipse(xpos, ypos, 100, 100);
      arc(xpos, 510, 50, 40, 0, 3.14, CHORD);
      fill(0);
      text("Go left to eat apple", 400, 200);
      ellipse (380, 490, 10, 10);
      ellipse (420, 490, 10, 10);
      //apple
      fill(244, 63, 66);
      noStroke();
      ellipse(100, ypos, 65, 70);
      fill(102, 244, 63);
      rect(100, 460, 10, 10);
      break;
      
      case 2:
      //character
      stroke(0);
      fill(255);
      ellipse(xpos - 300, ypos, 100, 100);
      arc(xpos - 300, 510, 50, 40, 0, 3.14, CHORD);
      fill(0);
      text("Go right to water your plant", 200, 200);
      ellipse (380 - 300, 490, 10, 10);
      ellipse (420 - 300, 490, 10, 10);
      break;
 
      case 3:
       //character
      stroke(0);
      fill(255);
      ellipse(xpos + 100, ypos, 100, 100);
      arc(xpos + 100, 510, 50, 40, 0, 3.14, CHORD);
      fill(0);
      ellipse (380 + 100, 490, 10, 10);
      ellipse (420 + 100, 490, 10, 10);
      //plant
      fill(102, 244, 63);
      line(xpos + 200, ypos + 50, xpos + 200, ypos - 50);
      noStroke();
      ellipse(600, ypos - 50, 65, 70);
      break;
      
      default:
      break;
}
      
      }
      void update() {
 
        switch (state) {
          case 0:
          //click to start moving
          if (mousePressed) {
            state = 1;
          }
          case 1:
          //go left to receive food
          if (key == CODED) {
            if (keyCode == LEFT) {
            state = 2;
          }
          }
          case 2: 
          //go right, plant grows
          if (key == CODED) {
            if (keyCode == RIGHT) {
              state = 3;
            }
            break;        
      }

      }
}
}
