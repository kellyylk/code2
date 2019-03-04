//brickbreaker data version kellyk
Player player;
Ball ball;
int COLS = 10;
int ROWS = 5;
int SCORE = 0;

boolean rightPressed = false;
boolean leftPressed = false;

ArrayList<AngryBrick>b1 = new ArrayList<AngryBrick>();
ArrayList<FragileBrick>b2 = new ArrayList<FragileBrick>();

Table data;

void setup() {
  size(900, 600);
  player = new Player();
  ball = new Ball();
  data = loadTable("dataBrick.csv", "header");
 
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      TableRow row = data.getRow(j);
      int level = row.getInt(i);
      //bricks[i][j] = new Brick(5 + i * 90, 50 + j * 40, 80, 20);
      if (level == 0) {
      b1.add(new AngryBrick(5 + i * 90, 50 + j * 40, 80, 20));
      } else if (level == 1) {
      b2.add(new FragileBrick(5 + i * 90, 50 + j * 40, 80, 20));
    }
    }
  }
}

void draw() {
  background(10);
  player.update();
  player.display();
  ball.update();
  ball.display();
  textSize(40);
  text(SCORE, 50, 550);


  // does it make sense for ball to own this?
  if (ball.pos.x > player.x - player.w/2 && ball.pos.x < player.x + player.w/2 &&
    ball.pos.y > player.y - player.h/2 && ball.pos.y < player.y + player.h/2) {
      
    ball.angle = random(PI, TWO_PI);
    ball.vel = new PVector(cos(ball.angle), sin(ball.angle));
    ball.vel.mult(ball.speed);
    ball.pos.add(ball.vel);
  }
  

  for (int i= 0; i< b1.size(); i++) {
    AngryBrick angryBrick = b1.get(i);
    if (angryBrick.active) {
      angryBrick.display();
      if (ball.didCollideWithBrick(angryBrick)) {
        angryBrick.active = true;
      }
    }
  }
 for (int i= 0; i< b2.size(); i++) {
    FragileBrick fragileBrick = b2.get(i);
    if (fragileBrick.active) {
      fragileBrick.display();
      if (ball.didCollideWithBrick(fragileBrick)) {
        fragileBrick.active = false;
        SCORE++;   
      }
      }
    }
  }
