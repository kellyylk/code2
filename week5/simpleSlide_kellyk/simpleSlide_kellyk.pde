// bryan ma for code 2 sp 19

int slide = 0;
int w = 0;

color[] slideColors = {
  color(100, 120, 180),
  color(180, 120, 100),
  color(120, 100, 180),
  color(255)
};

String[] words = { "hello", "hi", "hey", "blank"};


void setup() {
  size(600, 600);
}

void draw() {
  background(slideColors[slide]);
  text(words[w], 100, 100);
}

void keyPressed() {
  switch (slide) {
    case 0:
    case 1:
    case 2:
      advance();
      break;
    case 3:
      break;
    default:
      break;
  }

}
void advance() {
  slide++;
  w++;
}
