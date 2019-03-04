Table data;
color c;
int R;
int G;
int B;

void setup() {
  c = color (R, G, B);
  
  size(600, 600);
  data = loadTable("data2.csv", "header");
  for(int i = 0; i < data.getRowCount(); i++) {
    TableRow row = data.getRow(i);
    int x = row.getInt("x");
    int y = row.getInt("y");
    int size = row.getInt("size");
    int R = row.getInt("R");
    int G = row.getInt("G");
    int B = row.getInt("B");
    fill(R, G, B);
    ellipse(x, y, size, size);
  }
}

void draw() {
  R = int(random(255));
  G = int(random(255));
  B = int(random(255));
  
}

void mousePressed() {
  int s = int(random(50, 200));
  ellipse(mouseX, mouseY, s, s);
  fill(R,G,B);
  TableRow newRow = data.addRow();
  newRow.setInt("x", mouseX);
  newRow.setInt("y", mouseY);
  newRow.setInt("size", s);
  newRow.setInt("R", R);
  newRow.setInt("G", G);
  newRow.setInt("B", B);
  saveTable(data, "data/data2.csv");
}
