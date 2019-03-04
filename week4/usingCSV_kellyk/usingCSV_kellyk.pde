// bryan ma for code 2 sp19 A

// replace the sizes integer array with csv data loaded externally.
//int[] sizes = { 300, 500, 100, 200, 400, 300, 500, 200 };

Table data;

void setup() {
  data = loadTable("dataSize.csv", "header");
  size(800, 600);
  rectMode(CENTER);
  for (int i = 0; i < data.getRowCount(); i++) {
    TableRow row = data.getRow(i);
    int sizes = row.getInt("sizes");
    float x = map(i, 0, data.getRowCount() - 1, 100, 700);
    float y = height/2;
    float w = 50;
 //   float h = sizes[i];
    rect(x, y, w, sizes);
  }
}

void draw() {
}
