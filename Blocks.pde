class Blocks {
  float x, y;
  float size, rSize;

  Blocks() {
    size=random(400);
    rSize=600-random(500-size-30);
    x=0;
    y=0;
  }

  void show() {
    rectMode(CORNERS);
    rect(0, 600-y, size, 600-y-10);
    rect (rSize, 600-y, 600, 600-y-10);
  }

  void move() {
    y+=1;
  }

  boolean hasCollision(Ball b) {
    //if ((b.bY+15)>=(600-y) && (b.bX>15 && b.bX<size-15 || b.bX>rSize-15 && b.bX<585))return true;
    if (abs(600-y-b.bY)<=15 && (b.bX>15 && b.bX<size-15 || b.bX>rSize-15 && b.bX<585))return true;
    else return false;
  }
}
