class Bogies {

  int weight;
  float ObsX, ObsY;

  float deltaObsX = 0;

  float level;

  int sideways;

  int timer;

  Bogies(float s, int t) {
    ObsX = random(20, 580);
    ObsY = random(-800, -100);

    weight = int(random(15, 40));

    level = s;

    sideways = 0;

    timer = t;
  }

  void show() {
    colorMode(HSB);
    fill(8*weight, 240, 240);
    ellipse(ObsX, ObsY, weight, weight);
    colorMode(RGB);

    timer++;

    if (sideways > 5)
      sideways = int(random(10000-(level*500), 10001));

    else 
      sideways = int(random(1, 11));
  }

  void move() {
    ObsY+=5*level;
    ObsX+=deltaObsX;

    if (sideways != 0) {
      if (timer % sideways == 0) {
        if (timer % round(random(1, 2)) == 0) {
          deltaObsX = 1;
        }
        else {
          deltaObsX = -1;
        }
      }
      if (timer % int(random(90, 400)) == 0) {
        deltaObsX = deltaObsX * -1;
      }
    }
  }
}

