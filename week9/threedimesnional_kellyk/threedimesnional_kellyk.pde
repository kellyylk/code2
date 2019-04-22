int scene = 0;
float offset = 0;

void setup() {
  size(800, 800, P3D);
}

void draw() {
  background(255);
  switch (scene) {
    
    case 0:
   fill(50);
   noiseDetail(2, 0.2);
   beginShape();
   noStroke();
   for (int i = 0 ; i <= width; i+=20) {
     //vertex(x, y, z)
     stroke(20);
     vertex(i, map(noise(offset + i * 0.001), 0, 1, 8, height *2), 100);
     vertex(i + 20, map(noise(offset + i * 0.001), 0, 1, 8, height *2), 20);
     vertex(i + 100, map(noise(offset + i * 0.001), 0, 1, 8, height *2), -100);
    offset += 0.0001;
   }
   endShape();
   textSize(15);
 text("Your name is Marcel. You're 25, and you're constantly feeling anxious from existential dread.", 20, 30);
  text("[Press right key for next]", 30, 70);
    break;
    
    
    case 1:
    noStroke();
    for (int i = 0; i < 100; i++) {
    for (int j = 0; j <100; j++) {
       float b = map(noise(j * 0.2, i * 0.2, frameCount *0.1), 0, 1, 0, 255);
      fill(b, 140, b, 200);
      rect(i * 50, j * 50, 50, 50);
    }
    }
ellipse(400, 400, 400, 400);
fill(0);
text("One day you see this odd tunnel in the forest, and you decide to go in.", 20, 30);
    break;
    
    case 2:
    fill(0);
     text("You see a grass field in the tunnel, you water the land and some flowers grow and come alive", 20, 30);
  pushMatrix();
  translate(180, 340, -80);
  rectMode(CENTER);
  rotateX(radians(frameCount *0.5));
  rotateY(radians(frameCount *0.3));
  rotateZ(radians(frameCount *0.1));
  fill(255, 140, 178);
  stroke(2);
  directionalLight(255, 150, 400, 400, 400, -1);
  pointLight(255, 255, 190, 100, 100, 100);
  sphereDetail(int(map(400, 0, width, 0, 10)));
  sphere(30);
  popMatrix();
  //3
  pushMatrix();
  translate(430, 300, -30);
  rectMode(CENTER);
  rotateX(radians(frameCount *0.5));
  rotateY(radians(frameCount *0.3));
  rotateZ(radians(frameCount *0.1));
  sphereDetail(int(map(250, 0, width, 0, 10)));
  sphere(35);
  popMatrix();
  //2
      pushMatrix();
  translate(300, 400, 30);
  rectMode(CENTER);
  rotateX(radians(frameCount *0.5));
  rotateY(radians(frameCount *0.3));
  rotateZ(radians(frameCount *0.1));
  sphereDetail(int(map(100, 0, width, 0, 10)));
  sphere(40);
  popMatrix();
  
    pushMatrix();
  translate(430, 410, 100);
  rectMode(CENTER);
  rotateX(radians(frameCount *0.5));
  rotateY(radians(frameCount *0.3));
  rotateZ(radians(frameCount *0.1));
  sphereDetail(int(map(350, 0, width, 0, 10)));
  sphere(20);
  popMatrix();
  
  pushMatrix();
  translate(580, 410, 100);
  rectMode(CENTER);
  rotateX(radians(frameCount *0.5));
  rotateY(radians(frameCount *0.3));
  rotateZ(radians(frameCount *0.1));
  sphereDetail(int(map(34, 0, width, 0, 10)));
  sphere(40);
  popMatrix();
  

translate(width/2 + 25, height/2);
rotateX(PI/3);
fill(127, 229, 98);
rect(-26, -26, 570, 500);
    break;
    case 3:
  
  pushMatrix();
  background(255); 
  directionalLight(255, 136, 10, 200, 300, -2);
  translate(width/2, height/2);
  sphereDetail(int(map(500, 0, width, 0, 10)));
  noStroke();
  sphere(mouseX -100);

  popMatrix();
 text("You see this pufferfish that grows & follows you when you feed it", 20, 30);
break;

case 4:
stroke(0);
fill(255);
pushMatrix();
rotateY(radians(frameCount *0.05));
translate(600, 300);
sphere(80);
popMatrix();

pushMatrix();
rotateX(radians(frameCount *0.05));
translate(700, 200);
sphere(180);
popMatrix();

pushMatrix();
rotateZ(radians(frameCount *0.05));
translate(100, 300);
sphere(30);
popMatrix();

pushMatrix();
rotateY(radians(frameCount *0.05));
translate(400, 500);
sphere(120);
popMatrix();

pushMatrix();
rotateY(radians(frameCount *-0.05));
translate(600, 300);
sphere(80);
popMatrix();

pushMatrix();
rotateX(radians(frameCount *-0.05));
translate(700, 200);
sphere(180);
popMatrix();

pushMatrix();
rotateZ(radians(frameCount *-0.05));
translate(100, 300);
sphere(30);
popMatrix();

pushMatrix();
rotateY(radians(frameCount *-0.05));
translate(400, 500);
sphere(120);
popMatrix();

fill(0);
text("After you exit the tunnel, you realize from your experiences", 20, 30);
text("that even though life is nothingness, you can make your own meaning :)", 20, 50);
break;

  } 
}


void keyPressed() {
    if (key == CODED) {
    if (keyCode == RIGHT) {
  switch (scene) {
    case 0:
    advance();
    break;
    case 1:
advance();
break;
    case 2:
advance();
break;
case 3: 
advance();
break;

    default:
}
    }
    }
}

void advance() {
  scene++;
}
