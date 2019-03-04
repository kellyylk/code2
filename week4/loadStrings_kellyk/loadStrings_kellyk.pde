// bryan ma for code 2 sp 19 A
//kellyk
String[] data;
Shape s;
Shape r;

void setup() {
  data = loadStrings("dataPos.txt");
  background(255);
  s = new Shape(data, 30, 100); // the values here go into Shape(String[] i, int j, int h
  r = new Shape(data, 50, 20);
  size(600, 600);
  s.display();
  r.display();
}

void draw() {
  
}
