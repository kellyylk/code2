Player player;
Ball ball;
//Brick[][] bricks = new Brick[10][5];
int COLS = 10;
int ROWS = 5;
int SCORE = 0;

boolean rightPressed = false;
boolean leftPressed = false;

ArrayList<AngryBrick>b1 = new ArrayList<AngryBrick>();
ArrayList<FragileBrick>b2 = new ArrayList<FragileBrick>();


void setup() {
  size(900, 600);
  player = new Player();
  ball = new Ball();

  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      //bricks[i][j] = new Brick(5 + i * 90, 50 + j * 40, 80, 20);
      int r = int(random(0,2));
      if (r == 0) {
      b1.add(new AngryBrick(5 + i * 90, 50 + j * 40, 80, 20));
      } else if (r == 1) {
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
    //call object 1 by 1 and stores it as a local object
    AngryBrick angryBrick = b1.get(i);
    if (angryBrick.active) {
      angryBrick.display();
      if (ball.didCollideWithBrick(angryBrick)) {
        angryBrick.active = true;
      }
    }
  }
 for (int i= 0; i< b2.size(); i++) {
    //call object 1 by 1 and stores it as a local object
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
