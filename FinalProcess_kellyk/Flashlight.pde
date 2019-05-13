class Flashlight {

  void display() {
    //used your example code for the flashlight part
    loadPixels();
    finalstage.loadPixels();
    for (int x = 0; x < finalstage.width; x++) {
      for (int y = 0; y < finalstage.height; y++) {
        int loc = x + y* finalstage.width;
        float r, g, b;
        r = red(finalstage.pixels[loc]);
        g = green(finalstage.pixels[loc]);
        b = blue(finalstage.pixels[loc]);
        float maxdist = 80;
        float d = dist(x, y, mouseX, mouseY);
        float adjustbrightness = 255*(maxdist-d)/maxdist;
        r += adjustbrightness;
        g += adjustbrightness;
        b += adjustbrightness;
        r = constrain(r, 0, 255);
        g = constrain(g, 0, 255);
        b = constrain(b, 0, 255);
        color c = color(r, g, b);
        pixels [y * width + x] = c;
      }
    }
    updatePixels();
      if (mouseX > 300 && mouseX < 400 && mouseY > 10 && mouseY < 70 && mousePressed) {
      background(255);
    }
    if (mouseX > 500 && mouseX < 650 && mouseY > 120 && mouseY < 160 && mousePressed) {
      state = 10;
    }
     if (mouseX > 490 && mouseX < 590 && mouseY > 620 && mouseY < 660 && mousePressed) {
        background(255);
    }
     if (mouseX > 85 && mouseX < 210 && mouseY > 480 && mouseY < 530 && mousePressed) {
      background(255);
    }
  
}
}
