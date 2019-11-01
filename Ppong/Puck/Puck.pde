
class Puck {
  float x = width/2;
  float y = height/2;
  float xspeed = random(-3,3);
  float yspeed = random(-3,3
  

  void show() {
    fill(255);
    ellipse(x,y,24,24);
  }
}
