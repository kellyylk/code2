int state = 0;

JSONObject json;
void setup() {
  size(800, 800);
}


void draw() {
  json = new JSONObject();
  json = loadJSONObject("data.json");
  
  JSONArray narrative = json.getJSONArray("narrative");
  
  background(255);
      switch (state) {
      case 0:
      fill(0);
      textSize(42);
      text("Press to start!", 250, 300);
      break;
      
      case 1: // two tunnels
      fill(0);
      textSize(15);
      text("You wake up having no idea where the hell you are, choose which tunnel to enter"
      , 110, 200);
      ellipse(200, 400, 100, 100);
      ellipse(600, 400, 100, 100);
      break;
      
      case 2:
      background(0);
      fill(255);
      text("You find a magic stone", 300, 200);
      text("press down key to eat it", 200, 300);
      text("press up key to keep walking", 400, 300);
      fill(80, 20, random(255));
      rect( 300, 400, 200, 200);
      break;
      
      case 3:
      background(0);
      fill(255);
      textSize(24);
      text("this weird green creature eats you", 300, 200);
      text("press mouse to start over", 300, 300);
      fill(72, 244, 66);
      ellipse(300, 500, 150, 200);
      fill(0);
      ellipse(280, 480, 10, 10);
      ellipse(320, 480, 10, 10);  
      break;
      
      case 4:
      background( 180, 200, random(255));
      textSize(40);
      text("you get super powers you win!", 100, 400);
      textSize(20);
      text("press to start over", 100, 500);
      break;
      
      default: 
      break;

}
}

 void changeState() {
    state++;
  }
 
  void mousePressed() {
      switch (state) {
          case 0:
          if (mousePressed) {
            state = 1;
          }
          case 3:
          if (mousePressed && state == 3) {
          state = 0;
      }
      case 4:
      if (mousePressed && state == 4) {
        state = 0;
      }
  }
  }
    
  void keyPressed() {
       switch (state) {
          case 1:
          if (key == CODED) {
            if (keyCode == LEFT && state == 1) {
            state = 2;
          }
            if (keyCode == RIGHT) {
              state = 3;
            }
          }
          
          case 2:
            if (key == CODED) {
            if (keyCode == DOWN) {
            state = 4;
          }
          }
          if (key ==CODED) {
            if (keyCode == UP) {
              state = 3;
            }
          }
  }
  }
