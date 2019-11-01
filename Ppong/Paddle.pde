
class Paddle {
  float x;
  float y;
  float w = 10;
  float h = 50;
  
  Paddle(float x_) {
    x = x_;
  }
  
 void show() {
   fill(255);
   rectMode(CENTER);
   rect(x,y,w,h);
}
