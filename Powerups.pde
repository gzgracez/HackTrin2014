class power {
  int diam;
  int type;
  int y;
  int x;
  int deltax;
  int deltay;
  int ycount;
  power() {
    diam = 40;
    type = round(random(7));
    x=700;
    y= round(random(diam/2, 600-diam/2));
    deltax = round(random(-5, -3));
    deltay = round(random(-5, 5));
    ycount=0;
  }



  void show() {
    if (type <3) {
      fill(128, 0, 0);
    }
    else if (type<7) {
      fill(0, 128, 0);
    }

    else {
      fill(255, 128, 0);
    }  


    ellipse(x, y, diam, diam);
    x+=deltax;
    if (y+deltay>diam/2&& y+deltay<600-diam/2) {
      y+=deltay;
    }
    else {
      deltay*=-1;
    }

    if (ycount == 20 ) {
      deltay = round(random(-5, 5));
      ycount = 0;
    }
    else {
      ycount++;
    }
  }

  boolean hasCollision(Bird b) {
    if (diam/2+b.diam/2>=  sqrt(sq(x-225)+sq(y-b.y))) {
      return true;
    }
    else {
      return false;
    }
  }
}

