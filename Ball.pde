class Ball {
  float bX, bY;
  float vY;

  Ball() {
    bX=300;
    bY=20;
    vY=1;
  }

  void show() {
    ellipse(bX, bY, 30, 30);
  }

  void move() {
    if (bY<=600-15)
      bY+=vY;
  }
}
