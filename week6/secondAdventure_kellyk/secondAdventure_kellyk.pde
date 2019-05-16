int state = 0;
JSONObject json;
Scene[] scenes;

void setup() {
  size(800, 800);
  json = loadJSONObject("data.json");
  JSONArray intro = json.getJSONArray("intro");
  
  scenes = new Scene[intro.size()];
  
  for (int i = 0; i < scenes.length; i++) {
    scenes[i] = new Scene(intro.getString(i));
}
println(intro);
}


void draw() {

  background(255);
  switch (state) {
  case 0:
    fill(0);
    textSize(42);
    text(scenes[state].displaytxt, 250, 300);
    break;

  case 1: // two tunnels
    fill(0);
    textSize(15);
    text(scenes[state].displaytxt, 110, 200);
    ellipse(200, 400, 100, 100);
    ellipse(600, 400, 100, 100);
    break;

  case 2:
    background(0);
    fill(255);
    text(scenes[state].displaytxt, 300, 200);
    text("press down key to eat it", 200, 300);
    text("press up key to keep walking", 400, 300);
    fill(80, 20, random(255));
    rect( 300, 400, 200, 200);
    break;

  case 3:
    background(0);
    fill(255);
    textSize(24);
    text(scenes[state].displaytxt, 300, 200);
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
    text(scenes[state].displaytxt, 100, 400);
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

class Scene {
  String displaytxt;
  
  Scene(String text) {
    displaytxt = text;
  }
}
