Puck puck;
Puck puck2;

Paddle left;
Paddle right;

int leftscore = 0;
int rightscore = 0;
boolean secondPuck = false;
boolean gameStart = false;
String inst1 = "Player 1:\nMove UP: W \nMove DOWN: S";
String inst2 = "Player 2:\nMove UP: Up_Arrow \nMove Down: Down_Arrow";
void setup() {
  size(800, 533);
  puck = new Puck();
  puck2 = new Puck();
  left = new Paddle(true);
  right = new Paddle(false);
}

void draw() {
  if(gameStart == false){
    fill(0);
    background(#66A182);
    textSize(30);
    textAlign(LEFT);
    text(inst1, 10, height / 3);
    text("Press SPACE to start \nPress R to restart...Enjoy! ;)",  2 * (width / 6),  400);

    
    textAlign(RIGHT);
    text(inst2, width - 10, height / 3);
    left.show();
  right.show();
  left.update();
  right.update();

    if(keyPressed == true)
    {
      if(key == ' ')
        gameStart = true;
    }
  }
  else
  {
  background(#66A182);
  noFill();
  strokeWeight(5);
  stroke(255);
  ellipse(width / 2, height / 2, 100, 100);
  strokeWeight(0);
  for(int i = 0; i < 17; i++){
    fill(255);
    rect(width / 2, 20+ (40 * i), 5, 30);
  }

  //puck.checkPaddle(left);
  puck.checkPaddleRight(right);
  puck.checkPaddleLeft(left);
  
  puck2.checkPaddleRight(right);
  puck2.checkPaddleLeft(left);

  left.show();
  right.show();
  left.update();
  right.update();
  
  if(leftscore >= 3 || rightscore >= 3){
    secondPuck = true;
  }
  else{
    secondPuck = false;
  }
  
  puck2.update(secondPuck);
  puck2.show(secondPuck);
  puck2.edges();
  puck.update(true);
  puck.edges();
  puck.show(true);

  fill(255);
  textSize(32);
  text(leftscore, 32, 40);
  text(rightscore, width-64, 40);
  }
}

void keyReleased() {
  left.move(0);
  right.move(0);
}

void keyPressed() {
  if(key == 'r'){
    gameStart = false;
    puck.reset();
    puck2.reset();
    leftscore = 0;
    rightscore = 0;
  }
  
  if (key == 'w') {
    left.move(-10);
  } else if (key == 's') {
    left.move(10);
  }

if (key == CODED) {
    if (keyCode == UP) {    
      right.move(-10);
  } else if (keyCode == DOWN) {
    right.move(10);
  }
}

}
