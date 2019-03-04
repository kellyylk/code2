class Shape {
  String[] data;
  int x;
  int y;
  color c;
  
  Shape(String[] i, int j, int h) {
    data = i;
    x = j;
    y = h;
    c = color(random(255), random(255), random(255));
  }
  
  void display() {
  String[] splitData = data[0].split(",");
  String[] splitDataSiz = data[1].split(",");
  for (int i = 0; i < splitData.length; i++){
   fill(c);
   rect(x + int(splitData[i]) * 80, y * 4, int(splitDataSiz[i]), int(splitDataSiz[i]));
  }
  }
  
}
