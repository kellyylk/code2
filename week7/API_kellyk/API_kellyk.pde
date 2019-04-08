
String apiKey = "7b7acfd8f1aafab21720b68e6236cc45"; // YOUR API KEY HERE
String city = "moscow";

PImage colorrange;

JSONObject data;
JSONObject wind;
JSONObject clouds;
JSONObject main;


float speed = 0;
float direction = 0;
float mist = 0;
float amount = 0;
float time = 0;
float millisecondsToWait = 30000;

int xpa = 10;
int ypa = 10;
int state = 0;

int[][] shape = new int[xpa][ypa];

void setup() {
  size(600, 600);
  colorrange = loadImage("colorrange.jpg");
  fill(0);
  updateData();
  time = millis();
    for (int i = 0; i < xpa; i++) {
    for (int j = 0; j < ypa; j++) {
    shape[i][j] = 4;
    }
}
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      switch (state) {
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
        break;
      }
    }
  }
}

void draw() {
 background(255);
 
  if (millis() > time + millisecondsToWait) {
    updateData();
    time = millis();
  }
  for (int i = 0; i < xpa; i++) {
    for (int j = 0; j < ypa; j++) {
      updateData();
    }
  }
  
  
  }

void advance() {
  state++;
}

void updateData() {
  data = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?q=" + city + "&APPID=" + apiKey);
  wind = data.getJSONObject("wind");
  direction = wind.getFloat("deg");
  speed = wind.getFloat("speed");
  
  
  clouds = data.getJSONObject("clouds");
  amount = clouds.getInt("all");
  
  main = data.getJSONObject("main");
  mist = main.getFloat("humidity");

  

  switch(state) {
    case 0:
    background(255);
    fill(0);
 textSize(20);
 text("Moscow", 30,60);
 textSize(12);
 text("press right key to see visuals", 30, 80);
 textSize(12);
   text("Wind speed: " + speed, 30, 120);
   text("Humidity: " + mist , 30, 140);
   text("Cloudiness: " + amount, 30, 180);
       image(colorrange, 20, 145, 130, 20);

break;
  case 1:
  //wind speed
  background(255);
   for (int i = 0; i < xpa; i++) {
    for (int j = 0; j < ypa; j++) {
      float xPos = random(0, 600);
      float yPos = random(200, 480);
      noStroke();
      fill(0, 0, 0);
      rect(xPos, yPos, speed * 2.5, shape[i][j]);
    }
   }
   fill(0);
textSize(20);
 text("Moscow", 30,60);
 textSize(12);
   text("Wind speed: " + speed, 30, 120);
   text("Humidity: " + mist , 30, 140);
   text("Cloudiness: " + amount, 30, 180);
       image(colorrange, 20, 145, 130, 20);

   
  break;
  
  case 2:
  if (mist < 10 ) {
  background(255, 255, 255);
}
if (mist < 30) {
  background(224, 236, 255); 
}
if (mist < 60) {
  background(191, 215, 255);
}
if (mist < 90) {
  background(165, 199, 255);
}
if (mist < 120) {
  background(140, 183, 255);
}
   for (int i = 0; i < xpa; i++) {
    for (int j = 0; j < ypa; j++) {
      float xPos = random(0, 600);
      float yPos = random(200, 480);
      noStroke();
      fill(0, 0, 0);
      rect(xPos, yPos, speed * 2.5, shape[i][j]);
    }
   }
fill(0);
textSize(20);
 text("Moscow", 30,60);
 textSize(12);
   text("Wind speed: " + speed, 30, 120);
   text("Humidity: " + mist , 30, 140);
   text("Cloudiness: " + amount, 30, 180);
       image(colorrange, 20, 145, 130, 20);

break;
  
  case 3:
  if (mist < 10 ) {
  background(255, 255, 255);
}
if (mist < 30) {
  background(224, 236, 255); 
}
if (mist < 60) {
  background(191, 215, 255);
}
if (mist < 90) {
  background(165, 199, 255);
}
if (mist < 120) {
  background(140, 183, 255);
}
   for (int i = 0; i < xpa; i++) {
    for (int j = 0; j < ypa; j++) {
      float xPos = random(0, 600);
      float yPos = random(200, 480);
      noStroke();
      fill(0, 0, 0);
      rect(xPos, yPos, speed * 2.5, shape[i][j]);
    }
   }
fill(0);
textSize(20);
 text("Moscow", 30,60);
 textSize(12);
   text("Wind speed: " + speed, 30, 120);
   text("Humidity: " + mist , 30, 140);
   text("Cloudiness: " + amount, 30, 180);
 
 //xywh
 fill(178, 168, 255, 200);
   ellipse(random(0, 100), random(0, 100), amount, amount);
   ellipse(300, 120, amount +10, amount +10);
   ellipse(300, 150, amount * 2, amount *2);
   ellipse(250, 130, amount + 30, amount + 30);
   ellipse(350, 150, amount +5, amount + 5);
   ellipse(255, 180, amount *2, amount *2);
   ellipse(320, 170, amount *1.5, amount *1.5);
   ellipse(220, 155, amount, amount);
    image(colorrange, 20, 145, 130, 20);

break;
  }
}
  
