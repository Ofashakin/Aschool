class Puck {
  float x = width/2;
  float y = height/2;
  float xspeed;
  float yspeed;
  float r = 12;
  float speed = 5;

  Puck() {
    reset();
  }

  void checkPaddleLeft(Paddle p) {
    if (y - r < p.y + p.h/2 && y + r > p.y - p.h/2 && x - r < p.x + p.w/2) {
      if (x > p.x) {
        float diff = y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        speed *= 1.1;
        xspeed = speed * cos(angle);
        yspeed = speed * sin(angle);
        x = p.x + p.w/2 + r;
        //xspeed *= -1;
      }
    }
  }
  void checkPaddleRight(Paddle p) {
    if (y - r < p.y + p.h/2 && y + r > p.y - p.h/2 && x + r > p.x - p.w/2) {
      if (x < p.x) {
        //xspeed *= -1;
        float diff = y - (p.y - p.h/2);
        float angle = map(diff, 0, p.h, radians(225), radians(135));
        speed  *= 1.1;
        xspeed = speed * cos(angle);
        yspeed = speed * sin(angle);
        x = p.x - p.w/2 - r;
      }
    }
  }




  void update(boolean visible) {
    if(visible){
    x = x + xspeed;
    y = y + yspeed;
    }
  }

  void reset() {
    x = width/2;
    y = height/2;
    float angle = random(-PI/4, PI/4);
    //angle = 0;
    speed = 5;
    xspeed = speed * cos(angle);
    yspeed = speed * sin(angle);

    if (random(1) < 0.5) {
      xspeed *= -1;
    }
  }

  void edges() {
    if (y < 0 || y > height) {
      yspeed *= -1;
    }

    if (x - r > width) {
      leftscore++;
      reset();
    }

    if (x + r < 0) {
      rightscore++;
      reset();
    }
  }


  void show(boolean visible) {
    if(visible){
    fill(255);
    ellipse(x, y, r*2, r*2);
    }
  }
}
