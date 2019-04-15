//hits your computer - malware - perlin noise fix

class Malware {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  int state;
  
  PVector rectpos;
  PVector rectvel;
  PVector rectgrav;
  
  Malware() {
    pos = new PVector(0, 20);
    vel = new PVector(10,5);
    mass = 3.5;
    state = 0;
    rectpos = new PVector(200, 200);
    rectvel = new PVector (1, 1);
    rectgrav = new PVector (0, 0.1);
  }

  void update() {
    PVector area = new PVector(random(400, 600),random(250,550));
    PVector acc = PVector.sub(area, pos);
    acc.setMag(0.9);
    vel.add(acc);
    vel.limit(mass);
    pos.add(vel);

    switch (state) {
      case 0:
         if (pos.x > 520) {
         state = 1;
    }   
    case 1:
        if(mousePressed) {
      state = 2;
        }
    case 2:
    if (key == CODED) {
    if (keyCode == RIGHT) {
    state = 3;
    }
    }
    case 3:
    rectpos.add(rectvel);
    rectvel.add(rectgrav);
      if ((rectpos.x + 400 > width) || (rectpos.x + 400 < 1)) {
    rectvel.x = rectvel.x * -0.01;
  }
    if (rectpos.y > height) {
    rectvel.y = rectvel.y * -0.95; 
    rectpos.y = height;
    }
    }
  }
 
  void display() {
    switch (state) {
    case 0:
    fill(200);
    ellipse(pos.x, pos.y, 10 * mass, 10 * mass);
    break;
    case 1:
 textSize(30);
    text("MALWARE!", 415, 300);
    text("viruses have destroyed your computer", 230, 500);
    textSize(22);
    text("press to spend 20$ to get it fixed", 500, 700);
    break;
    case 2:
    float f1 = noise(fix);
    float x = map(f1, 0, 1, 0,width);
    noStroke();
    fill(255,10);
    rect(x, 200, 16, 16);
    rect(x, 300, 16, 16);
    rect(x, 400, 16, 16);
    fix += 0.9;
    textSize(30);
    text("...fixing your computer...", 320, 600);
    textSize(18);
    text("(press right key to check system)", 365, 750);
 break;
    case 3:
    textSize(50);
  fill(245);
  text("Malware gone :)", rectpos.x, rectpos.y);


    break;

    
    }
        
     }

}
