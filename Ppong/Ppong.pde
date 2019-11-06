Puck puck;
// 18:19
Paddle left;
Paddle right;

void setup() {
  size(600, 400);
puck = new Puck();
left = new Paddle(true);
right = new Paddle(false);
}

void draw() {
  background(0);
  
  left.show();
  right.show();
  
  puck.update();
  puck.edges();
  puck.show();
}

void keyReleased() {
  left.move(0);
  right.move(0);
}

void keyPressed() {
 if (key == 'a') {
   left.move(-10);
 } else if (key == 'z') {
   left.move(10);
 }
    if (key == 'j') {
   right.move(-10);
 } else if (key == 'm') {
   right.move(10);
 }
 
}
