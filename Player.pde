class Player {

  float plX, plY;

  int lives;

  boolean left, right, up, down;

  boolean dead = false;

  Player() {

    plX = 300;
    plY = 300;

    lives = 10;
  }

  void show() {
    fill(0, 255, 0);
    ellipse(plX, plY, 30, 30);
    fill(0);
    textSize(8);
    text("Player", plX, plY);

    if (lives <= 0)
      dead = true;
  }

  void move() {
    if (dead == false) {
      if (up && down && right) {
        plY = plY;
        plX+=3;
      }

      else if (up && down && left) {
        plY = plY;
        plX-=3;
      }

      else if (right && left && up) {
        plX = plX;
        plY-=3;
      }

      else if (right && left && down) {
        plX = plX;
        plY+=3;
      }

      else if (left && up) {
        plX-=(3/sqrt(2));
        plY-=(3/sqrt(2));
      }

      else if (left && down) {
        plX-=(3/sqrt(2));
        plY+=(3/sqrt(2));
      } 

      else if (right && down) {
        plX+=(3/sqrt(2));
        plY+=(3/sqrt(2));
      } 

      else if (right && up) {
        plX+=(3/sqrt(2));
        plY-=(3/sqrt(2));
      } 

      else if (left && right) {
        plX = plX;
      }

      else if (up && down) {
        plY = plY;
      }

      else if (left) {
        if (plX > 15)
          plX-=3;
      } 

      else if (right) {
        if (plX < 585)
          plX+=3;
      } 

      else if (up) {
        if (plY > 15)
          plY-=3;
      } 

      else if (down) {
        if (plY < 485)
          plY+=3;
      }
    }
  }

  void collide() {
    for (int i = 0; i < bogies.size(); i++) {
      Bogies b = bogies.get(i);
      if (dead == false) {
        if (sqrt((b.ObsX - plX) * (b.ObsX - plX) + (b.ObsY - plY) * (b.ObsY - plY)) < 15 + b.weight/2) {
          lives--;
          bogies.remove(i);
          bogies.add(new Bogies(b.level, b.timer));
        }
      }
      else if (dead) {
        bogies.remove(i);
      }
    }
  }
}

