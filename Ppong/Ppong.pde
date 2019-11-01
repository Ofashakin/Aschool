Puck puck;

void setup() {
  size(600, 400);
puck = new Puck();
}

void draw() {
  background(0);
  
  puck.update();
  puck.edges();
  puck.show();
  
}
