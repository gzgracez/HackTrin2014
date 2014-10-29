class Bird {
  float y;
  float deltaY;
  int diam;



  Bird() {
    y = 250;
    deltaY = 0;
    diam = 50;
  }  


  void show() {
    if (resetBird == true) {
      y = 250;
      deltaY = 0;
      diam = 50; 
      resetBird = false;
    }
    if (bigger == true) {
      diam+=10;
      bigger = false;
    }
    if (smallbird == true) {
      diam-=10;
      smallbird = false;
    }
    fill(255, 255, 0);
    ellipse(225, y, diam, diam);

    if (y>=575) {
      collision = true;
    }
    if (collision == false) {


      if (keyPressed == true) {
        if (key == ' ') {
          if (invert == true) {
            y+=3;
          } 
          else {
            y-=3;
          }
          check = true;
        }
      }
      if (y<=25) {
        check = false;
        count = 0;
      } 
      if (check == true&&count<15) {
        if (invert == true) {
          y+=3;
        } 
        else {
          y-=3;
        } 
        count++;
      }
      else if (check == true&& count >= 15) {
        count = 0;
        check = false;
        if (invert == true) {
          y+=3;
        } 
        else {
          y-=3;
        }
        deltaY = 0;
      }
      else {
        y+=deltaY;
        if (invert == true) {
          deltaY-=.2;
        }

        else {
          deltaY +=.2;
        }
      }
    } 
    else if (collision == true) {
      if (y<575) {
        y+=10;
      }
    }
  }
}

