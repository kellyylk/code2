//code 2 Bryan - visual elements pt1, kelly k
//position, color, length

float [] xpos = {30, 470, 230, 595, 3, 110, 400, 350, 250, 120};
float [] ypos = {120, 470, 3, 30, 595, 120, 400, 230, 6, 250};


void setup() {
  size(600, 600);
  background(0);
  
    for(int i = 0; i < 10; i++) {
    for(int j= 0; j < 10; j++) {
  ellipse(xpos[i], ypos[j], random(6), random(6));
}
    }
  
  for(int i = 0; i < 10; i++) {
    for(int j= 0; j < 10; j++) {
      stroke(random(120), random(50), random(255));
      line(xpos[i], ypos[i], xpos[j], ypos[j]);
  }
}
}
