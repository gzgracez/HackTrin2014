import java.awt.Frame;
import java.awt.BorderLayout;
import controlP5.*;
ControlP5 cp5;

int state = 0; //0 = home, 1 = game, 2 = physics, 3 = flappy bird, 4 = falling, 5 = orderin, 6 = essay

ArrayList <Bogies> bogies = new ArrayList <Bogies>();
Player p1 = new Player();
int time;
int bestTime;
int endTime;
boolean playing;

float x=50, y=75, x2=450, y2=75;
String textValue = "";
float vx=0, vy=0, vx2=0, vy2=0;//velocity in the x & y directions
float vxi=0, vyi=0, vxi2=0, vyi2=0;
float ay=9.8, ay2=9.8;//acceleration in the x & y directions
float mass=50, mass2=50;
PImage dropAgain;
PImage dropTogether;
PImage home;
PImage resetP;
boolean drop1=false, drop2=false;
PFont font = createFont("arial", 20);

boolean collision = false;
float w=500;
boolean check = false;
int count;
int pipecount = 0;
int score = 0;
boolean reset = false;
int highscore = 0;

boolean resetBird = false;
int invincecount = 0;

boolean lessspace=false;
boolean  bigger=false;
boolean  speedup=false;
boolean  invert=false;
boolean  widepipe=false;
boolean   morespace=false;
boolean   narrowpipe=false;
boolean  doublepoints=false;
boolean   slowdown=false;
boolean   invince=false;
boolean   smallbird=false;
boolean collidecount = false;


Bird bird = new Bird();

ArrayList <Pipes> pipes = new ArrayList<Pipes>();  
ArrayList <power> Power = new ArrayList<power>();
ArrayList <Blocks> blocks = new ArrayList <Blocks>();
int time2=0;
Ball ball = new Ball();
boolean win=true;

DropdownList Cuisine;
Range Price;

JSONArray food;

int m;
int d;
int h;
int min;

String[] cui = new String[191];
int cuiL;

int costMin = 100;

int costMax = 100;

int printed;


float point;
float count6;
float count7;
float count8;
float semicount;
float wordcount;
int q = 0;
float point1;
float point2;
float point3;
float point4;
float point5;

void setup() {
  size(700, 600);
  frame.setResizable(true);
  background(0, 200, 255);
  cp5 = new ControlP5(this);
  dropAgain=loadImage("DropAgain1.png");
  dropTogether=loadImage("DropTogether1.png");
  home=loadImage("home.png");
  resetP=loadImage("reset.png");
  m = month();
  d = day();
  h = hour();
  min = minute();

  //food = loadJSONArray("https://r-test.ordr.in/dl/0"+m+"-0"+d+"+"+h+":"+min+"/10024/New York/101 91st Street?_auth=1,MqhgExygRiqzkvlG37pCRXYt-265Nheo4JZb6xLwOj4");


  //JSONObject cu = food.getJSONObject("cu");


  println(m+"-"+d+"+"+h+":"+min);
  //println(food);


  /*for (int i = 0; i < food.size(); i++) {
   if (food.getJSONObject(i).getString("na").equals("All American Pancake House (Brought to you by Cafe 82)")) {
   food.remove(i);
   }
   if (food.getJSONObject(i).getString("na").equals("Giovanni's Italian Restaurant & Pizzeria")) {
   food.remove(i);
   }
   println(food.getJSONObject(i).getString("na"));
   if (food.getJSONObject(i).hasKey("cu")) {
   println(food.getJSONObject(i).getJSONArray("cu"));
   for (int m = 0; m < food.getJSONObject(i).getJSONArray("cu").size(); m++) {
   for (int j = 0; j < cui.length; j++) {
   cui[i] = food.getJSONObject(i).getJSONArray("cu").getString(m);
   }
   }
   }
   }*/


  println(cui);

  /*Cuisine = cp5.addDropdownList("Cuisine")
   .setPosition(50, 50)
   .setSize(200, 200)
   ;*/


  Price = cp5.addRange("Price")
    .setBroadcast(false) 
      .setPosition(300, 25)
        .setSize(200, 30)
          .setHandleSize(15)
            .setRange(0, 20)
              .setRangeValues(0, 10)
                .setBroadcast(true)
                  .setColorForeground(color(70, 40))
                    .setColorBackground(color(150, 40))  
                      ;

  //customize(Cuisine);
  customize1(Price);
  cp5.addButton("Watch_the_Skies")
    .setValue(0)
      .setPosition(150, 150)
        .setSize(100, 100)
          ;

  cp5.addButton("Physics")
    .setValue(0)
      .setPosition(150, 300)
        .setSize(100, 100)
          ;

  cp5.addButton("Bounce")
    .setValue(0)
      .setPosition(150, 450)
        .setSize(100, 100)
          ;

  cp5.addButton("Falling")
    .setValue(0)
      .setPosition(400, 150)
        .setSize(100, 100)
          ;

  cp5.addButton("OrdrIn")
    .setValue(0)
      .setPosition(400, 300)
        .setSize(100, 100)
          ;

  cp5.addButton("EssayGrader")
    .setValue(0)
      .setPosition(400, 450)
        .setSize(100, 100)
          ;


  cp5.addTextfield("Mass (Ball 1)")
    .setPosition(825, 125)
      .setSize(50, 40)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 0, 0))
              .setAutoClear(false)
                ;

  cp5.addTextfield("Gravity (Ball 1)")
    .setPosition(825, 225)
      .setSize(50, 40)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 0, 0))
              .setAutoClear(false)
                ;

  cp5.addTextfield("Velocity X (Ball 1)")
    .setPosition(825, 325)
      .setSize(50, 40)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 0, 0))
              .setAutoClear(false)
                ;

  cp5.addTextfield("Velocity Y (Ball 1)")
    .setPosition(825, 425)
      .setSize(50, 40)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 0, 0))
              .setAutoClear(false)
                ;

  cp5.addButton("Earth1")
    .setValue(0)
      .setPosition(925, 125)
        .setSize(50, 40)
          ;

  cp5.addButton("Moon1")
    .setValue(0)
      .setPosition(925, 225)
        .setSize(50, 40)
          ;

  cp5.addButton("Mars1")
    .setValue(0)
      .setPosition(925, 325)
        .setSize(50, 40)
          ;

  cp5.addButton("Jupiter1")
    .setValue(0)
      .setPosition(925, 425)
        .setSize(50, 40)
          ;

  cp5.addTextfield("Mass (Ball 2)")
    .setPosition(1025, 125)
      .setSize(50, 40)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 0, 0))
              .setAutoClear(false)
                ;

  cp5.addTextfield("Gravity (Ball 2)")
    .setPosition(1025, 225)
      .setSize(50, 40)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 0, 0))
              .setAutoClear(false)
                ;

  cp5.addTextfield("Velocity X (Ball 2)")
    .setPosition(1025, 325)
      .setSize(50, 40)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 0, 0))
              .setAutoClear(false)
                ;

  cp5.addTextfield("Velocity Y (Ball 2)")
    .setPosition(1025, 425)
      .setSize(50, 40)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 0, 0))
              .setAutoClear(false)
                ;

  cp5.addButton("Earth2")
    .setValue(0)
      .setPosition(1125, 125)
        .setSize(50, 40)
          ;

  cp5.addButton("Moon2")
    .setValue(0)
      .setPosition(1125, 225)
        .setSize(50, 40)
          ;

  cp5.addButton("Mars2")
    .setValue(0)
      .setPosition(1125, 325)
        .setSize(50, 40)
          ;

  cp5.addButton("Jupiter2")
    .setValue(0)
      .setPosition(1125, 425)
        .setSize(50, 40)
          ;
  state=0;
  ay=9.8;
  ay2=9.8;
}

void draw() {
  noStroke();
  if (state == 0) {
    saveFrame("main.png");
    frame.setSize(700, 623);
    frameRate(60);
    cp5.get(Button.class, "Watch_the_Skies").show();
    cp5.get(Button.class, "Physics").show();
    cp5.get(Button.class, "Bounce").show();
    cp5.get(Button.class, "Falling").show();
    cp5.get(Button.class, "OrdrIn").show();
    cp5.get(Range.class, "Price").hide();
    cp5.get(Button.class, "EssayGrader").show();
    cp5.get(Textfield.class, "Mass (Ball 1)").hide();
    cp5.get(Textfield.class, "Gravity (Ball 1)").hide();
    cp5.get(Textfield.class, "Velocity X (Ball 1)").hide();
    cp5.get(Textfield.class, "Velocity Y (Ball 1)").hide();
    cp5.get(Textfield.class, "Mass (Ball 2)").hide();
    cp5.get(Textfield.class, "Gravity (Ball 2)").hide();
    cp5.get(Textfield.class, "Velocity X (Ball 2)").hide();
    cp5.get(Textfield.class, "Velocity Y (Ball 2)").hide();
    cp5.get(Button.class, "Earth1").hide();
    cp5.get(Button.class, "Moon1").hide();
    cp5.get(Button.class, "Mars1").hide();
    cp5.get(Button.class, "Jupiter1").hide();
    cp5.get(Button.class, "Earth2").hide();
    cp5.get(Button.class, "Moon2").hide();
    cp5.get(Button.class, "Mars2").hide();
    cp5.get(Button.class, "Jupiter2").hide();
    textAlign(CENTER);
    rectMode(CENTER);
    background(0, 200, 255);
    textSize(50);
    fill(0);
    text("Programs For the Future", 350, 75);
  }

  else if (state == 1) {//Game
    frame.setSize(750, 623);
    frameRate(60);
    background(50, 100, 250);
    cp5.get(Button.class, "Watch_the_Skies").hide();
    cp5.get(Button.class, "Physics").hide();
    cp5.get(Button.class, "Bounce").hide();
    cp5.get(Button.class, "Falling").hide();
    cp5.get(Button.class, "OrdrIn").hide();
    cp5.get(Range.class, "Price").hide();
    cp5.get(Button.class, "EssayGrader").hide();
    cp5.get(Textfield.class, "Mass (Ball 1)").hide();
    cp5.get(Textfield.class, "Gravity (Ball 1)").hide();
    cp5.get(Textfield.class, "Velocity X (Ball 1)").hide();
    cp5.get(Textfield.class, "Velocity Y (Ball 1)").hide();
    cp5.get(Textfield.class, "Mass (Ball 2)").hide();
    cp5.get(Textfield.class, "Gravity (Ball 2)").hide();
    cp5.get(Textfield.class, "Velocity X (Ball 2)").hide();
    cp5.get(Textfield.class, "Velocity Y (Ball 2)").hide();
    cp5.get(Button.class, "Earth1").hide();
    cp5.get(Button.class, "Moon1").hide();
    cp5.get(Button.class, "Mars1").hide();
    cp5.get(Button.class, "Jupiter1").hide();
    cp5.get(Button.class, "Earth2").hide();
    cp5.get(Button.class, "Moon2").hide();
    cp5.get(Button.class, "Mars2").hide();
    cp5.get(Button.class, "Jupiter2").hide();
    textAlign(CENTER);
    rectMode(CORNER);

    p1.show();
    p1.move();
    p1.collide();

    if (playing) {
      time++;
    }

    for (int i = 0; i < bogies.size(); i++) {
      Bogies b = bogies.get(i);
      b.show();
      b.move();

      b.level+=.0002;

      if (b.ObsY > 650) {
        bogies.remove(i);
        bogies.add(new Bogies(b.level, b.timer));
      }
    }

    fill(127);
    rect(600, 0, 100, 600);

    fill(15, 200, 0);
    ellipse(650, 100, 80, 80);
    rect(625, 400, 50, 50);
    fill(0);
    textSize(25);
    text("Start!", 650, 100);
    textSize(20);
    text("Lives "+p1.lives, 650, 200);
    textSize(15);
    if (floor((time/60)%60) < 10) {
      text("Time "+":0"+floor((time/60)%60), 650, 250);
    }
    else {
      text("Time "+floor(time/3600)+":"+floor((time/60)%60), 650, 250);
    }

    textSize(12);
    if (floor((bestTime/60)%60) < 10) {
      text("Best Time "+":0"+bestTime, 650, 300);
    }
    else {
      text("Best Time "+floor(bestTime/60)+":"+floor(bestTime), 650, 300);
    }

    if (endTime > bestTime) {
      bestTime = endTime;
    }

    textSize(10);
    text("Back", 650, 425);

    if (p1.dead == true) {
      endTime = time/60;
      textSize(100);
      text("GAME OVER", 300, 250);
      textSize(20);
      text("Click Start to Play Again", 300, 300);
      playing = false;
    }
  }//Game end
  else if (state==2) {
    saveFrame("physics.png");
    frame.setSize(1200, 623);
    frameRate(3);
    cp5.get(Textfield.class, "Mass (Ball 1)").show();
    cp5.get(Textfield.class, "Gravity (Ball 1)").show();
    cp5.get(Textfield.class, "Velocity X (Ball 1)").show();
    cp5.get(Textfield.class, "Velocity Y (Ball 1)").show();
    cp5.get(Textfield.class, "Mass (Ball 2)").show();
    cp5.get(Textfield.class, "Gravity (Ball 2)").show();
    cp5.get(Textfield.class, "Velocity X (Ball 2)").show();
    cp5.get(Textfield.class, "Velocity Y (Ball 2)").show();
    cp5.get(Button.class, "Earth1").show();
    cp5.get(Button.class, "Moon1").show();
    cp5.get(Button.class, "Mars1").show();
    cp5.get(Button.class, "Jupiter1").show();
    cp5.get(Button.class, "Earth2").show();
    cp5.get(Button.class, "Moon2").show();
    cp5.get(Button.class, "Mars2").show();
    cp5.get(Button.class, "Jupiter2").show();
    cp5.get(Button.class, "Watch_the_Skies").hide();
    cp5.get(Button.class, "Physics").hide();
    cp5.get(Button.class, "Bounce").hide();
    cp5.get(Button.class, "Falling").hide();
    cp5.get(Button.class, "OrdrIn").hide();
    cp5.get(Range.class, "Price").hide();
    cp5.get(Button.class, "EssayGrader").hide();
    String m=cp5.get(Textfield.class, "Mass (Ball 1)").getText();
    String g=cp5.get(Textfield.class, "Gravity (Ball 1)").getText();
    String vX=cp5.get(Textfield.class, "Velocity X (Ball 1)").getText();
    String vY=cp5.get(Textfield.class, "Velocity Y (Ball 1)").getText();
    String m2=cp5.get(Textfield.class, "Mass (Ball 2)").getText();
    String g2=cp5.get(Textfield.class, "Gravity (Ball 2)").getText();
    String vX2=cp5.get(Textfield.class, "Velocity X (Ball 2)").getText();
    String vY2=cp5.get(Textfield.class, "Velocity Y (Ball 2)").getText();
    background(0, 0, 255);
    rectMode(CORNER);
    imageMode(CENTER);
    textAlign(CENTER);
    stroke(0);
    stroke(0);
    fill(200);
    ellipse(x, y, mass, mass);
    noStroke();
    fill(0, 0, 255);
    rect(400, 0, 800, 600);//second blue area
    stroke(0);
    fill(200);
    ellipse(x2, y2, mass2, mass2);
    line(400, 0, 400, 600);//dividing line
    noStroke();
    fill(200);
    rect(800, 0, 1015, 600);//gray panel
    if (drop1==true) {
      vy+=ay;
      x+=vx;
      y+=vy;
    }
    if (drop2==true) {
      vy2+=ay2;
      x2+=vx2;
      y2+=vy2;
    }
    if (y>=600+mass||x>=400+mass) {
      x=50;
      y=75;
      drop1=false;
    }
    if (y2>=600+mass2||x2>=800+mass2) {
      x2=450;
      y2=75;
      drop2=false;
    }
    image(dropAgain, 900, 60, 120, 60);
    image(dropAgain, 1100, 60, 120, 60);
    image(dropTogether, 1000, 520, 120, 60);
    image(home, 1150, 550, 50, 50);
    image(resetP, 850, 550, 50, 50);
    textAlign(CENTER);
    textSize(12);
    fill(0);
    text(nf(mass, 1, 1)+"\nkg", 900, 140);
    text(nf(mass2, 1, 1)+"\nkg", 1100, 140);
    text(nf(ay, 1, 1)+"\nN/kg", 900, 240);
    text(nf(ay2, 1, 1)+"\nN/kg", 1100, 240);
    text(nf(vx, 1, 1)+"\nm/s", 900, 340);
    text(nf(vx2, 1, 1)+"\nm/s", 1100, 340);
    text(nf(vy, 1, 1)+"\nm/s", 900, 440);
    text(nf(vy2, 1, 1)+"\nm/s", 1100, 440);
    text("Assuming no air resistance", 1000, 580);
    textSize(10);
    text("Mass cannot exceed 100kg", 1000, 593);
    if (drop1==false) {
      if (m!=null && m.length()>0) { 
        float ma=Float.parseFloat(m);
        if (ma<=100) mass=ma;
      }
      if (g!=null && g.length()>0) ay=Float.parseFloat(g);
      if (vX!=null && vX.length()>0) vxi=Float.parseFloat(vX);
      if (vY!=null && vY.length()>0) vyi=Float.parseFloat(vY);
    }
    if (drop2==false) {
      if (m2!=null && m2.length()>0) { 
        float ma2=Float.parseFloat(m2);
        if (ma2<=100) mass2=ma2;
      }
      if (g2!=null && g2.length()>0) ay2=Float.parseFloat(g2);
      if (vX2!=null && vX2.length()>0) vxi2=Float.parseFloat(vX2);
      if (vY2!=null && vY2.length()>0) vyi2=Float.parseFloat(vY2);
    }
  }//state=2
  else if (state==3) {
    frame.setSize(600, 600);
    cp5.get(Button.class, "Watch_the_Skies").hide();
    cp5.get(Button.class, "Physics").hide();
    cp5.get(Button.class, "Bounce").hide();
    cp5.get(Button.class, "Falling").hide();
    cp5.get(Button.class, "OrdrIn").hide();
    cp5.get(Range.class, "Price").hide();
    cp5.get(Button.class, "EssayGrader").hide();
    cp5.get(Textfield.class, "Mass (Ball 1)").hide();
    cp5.get(Textfield.class, "Gravity (Ball 1)").hide();
    cp5.get(Textfield.class, "Velocity X (Ball 1)").hide();
    cp5.get(Textfield.class, "Velocity Y (Ball 1)").hide();
    cp5.get(Textfield.class, "Mass (Ball 2)").hide();
    cp5.get(Textfield.class, "Gravity (Ball 2)").hide();
    cp5.get(Textfield.class, "Velocity X (Ball 2)").hide();
    cp5.get(Textfield.class, "Velocity Y (Ball 2)").hide();
    cp5.get(Button.class, "Earth1").hide();
    cp5.get(Button.class, "Moon1").hide();
    cp5.get(Button.class, "Mars1").hide();
    cp5.get(Button.class, "Jupiter1").hide();
    cp5.get(Button.class, "Earth2").hide();
    cp5.get(Button.class, "Moon2").hide();
    cp5.get(Button.class, "Mars2").hide();
    cp5.get(Button.class, "Jupiter2").hide();
    rectMode(CORNER);
    if (reset == true) {
      invert = false;
      doublepoints = false;
      collision = false; 
      w=500;
      check = false;
      count =0;
      pipecount = 0;
      score = 0;
      resetBird = true;
      invince = false;
      slowdown = false;
      speedup = false;
    }
    fill(255, 0, 0);
    stroke(0);
    rect(w, 0, 100, 600);
    rect(w-100, 0, 100, 600);
    rect(w-200, 0, 100, 600);
    rect(w-300, 0, 100, 600);
    rect(w-400, 0, 100, 600);
    if (w>500) {
      rect(w-500, 0, 100, 600);
      rect(0, 0, w-500, 600);
      if (collision == false) {
        if (speedup == true) {
          w-=2;
        }
        else if (slowdown == true) {
          w-=.5;
        }

        else {
          w--;
        }
      }
    }
    else {
      w=600;
    }
    if (round(random(200)) == 19) {
      Power.add(new power());
    }

    for (int i = 0; i<Power.size(); i++) {
      Power.get(i).show();
      if (reset == true&&Power.size()>0) {
        for (int j = Power.size()-1; j>=0; j--) {
          Power.remove(j);
        }
      }
      if (Power.size()>0) {

        if (Power.get(i).hasCollision(bird) == true) {
          if (Power.get(i).type == 0) {
            bigger = true;
            smallbird = false;
          }
          else if (Power.get(i).type == 1) {
            speedup = true;
            slowdown = false;
          }
          else if (Power.get(i).type == 2) {
            invert = true;
          }
          else if (Power.get(i).type == 3) {
            doublepoints = true;
          }
          else if (Power.get(i).type == 4) {
            slowdown = true;
            speedup = false;
          }
          else if (Power.get(i).type == 5) {
            invince = true;
          }
          else if (Power.get(i).type == 6) {
            smallbird = true;
            bigger = false;
          }
          else if (Power.get(i).type == 7) {
            collision = true;
          }     
          Power.remove(i);
          i--;
        }
      }
    }


    if ((pipecount == 85&&speedup == true)||(slowdown == false&&pipecount == 170)||(pipecount == 340 &&slowdown == true) && collision == false) {
      pipes.add(new Pipes());
      pipecount = 0;
    }
    else {
      pipecount++;
    }

    for (int i = pipes.size()-1; i>=0; i--) {

      if (reset == true&&pipes.size()>0) {
        for (int j = pipes.size()-1; j>=0; j--) {
          pipes.remove(j);
        }
        reset = false;
      }
      if (pipes.size()>0) {
        pipes.get(i).show();
        if (pipes.get(i).hasCollision(bird)) {
          collision = true;
        }
        else if (pipes.get(i).pipex<150&&pipes.get(i).scoreCheck == false) {
          if (doublepoints == true) {
            score+=2;
          }
          else {
            score++;
          }
          pipes.get(i).scoreCheck = true;
        }
        if (pipes.get(i).pipex <-50) {
          pipes.remove(i);
          i--;
        }
      }
      else {
        break;
      }
    }
    bird.show();

    fill(0, 0, 255);
    stroke(0);
    textSize(40);
    text(score, 300, 100);
    strokeWeight(1);
    reset = false;

    if (collision == true) {
      fill(180, 0, 255);
      rect(200, 250, 200, 100);
      fill(255, 255, 0);
      if (score>highscore) {  
        highscore= score;
      }

      text("Score: " + score, 210, 290);
      textSize(20);
      text("High Score: " +  highscore, 210, 330);
      fill(0, 128, 0);
      ellipse(250, 388, 76, 76);
      ellipse(350, 388, 76, 76);
      textAlign(CENTER);
      fill(255, 255, 0);
      textSize(20);
      text("Retry", 250, 393);
      textSize(15);
      text("Fly Home", 350, 393);
      textAlign(LEFT);
      if (mousePressed == true) {
        if (sq(mouseX-250)+sq(mouseY-388)<= sq(38)) {
          reset = true;
        }
        else if (sq(mouseX-350)+sq(mouseY-388)<=sq(38)) {
          state = 0;
        }
      }
    }
    if (invince == true) {
      invincecount++;
      if (invincecount == 500) {
        invince = false;
      }
    }
  }//state=3
  else if (state==4) {
    frame.setSize(600, 600);
    frameRate(60);
    background(50, 100, 250);
    cp5.get(Button.class, "Watch_the_Skies").hide();
    cp5.get(Button.class, "Physics").hide();
    cp5.get(Button.class, "Bounce").hide();
    cp5.get(Button.class, "Falling").hide();
    cp5.get(Button.class, "OrdrIn").hide();
    cp5.get(Range.class, "Price").hide();
    cp5.get(Button.class, "EssayGrader").hide();
    cp5.get(Textfield.class, "Mass (Ball 1)").hide();
    cp5.get(Textfield.class, "Gravity (Ball 1)").hide();
    cp5.get(Textfield.class, "Velocity X (Ball 1)").hide();
    cp5.get(Textfield.class, "Velocity Y (Ball 1)").hide();
    cp5.get(Textfield.class, "Mass (Ball 2)").hide();
    cp5.get(Textfield.class, "Gravity (Ball 2)").hide();
    cp5.get(Textfield.class, "Velocity X (Ball 2)").hide();
    cp5.get(Textfield.class, "Velocity Y (Ball 2)").hide();
    cp5.get(Button.class, "Earth1").hide();
    cp5.get(Button.class, "Moon1").hide();
    cp5.get(Button.class, "Mars1").hide();
    cp5.get(Button.class, "Jupiter1").hide();
    cp5.get(Button.class, "Earth2").hide();
    cp5.get(Button.class, "Moon2").hide();
    cp5.get(Button.class, "Mars2").hide();
    cp5.get(Button.class, "Jupiter2").hide();
    if (win==true) {
      background(200);
      time2++;
      if (time2%150==0) blocks.add(new Blocks());
      for (int i=0; i<blocks.size(); i++) {
        if (600-blocks.get(i).y-10<=0) blocks.remove(i);
      }
      for (int i=0; i<blocks.size(); i++) {
        blocks.get(i).show();
        blocks.get(i).move();
        if (blocks.get(i).hasCollision(ball)==false) ball.vY=1;
        else {
          ball.bY=600-blocks.get(i).y-15;
        }
      }
      ball.show();
      ball.move();
      if (ball.bY<=15) {
        win=false;
      }
    }
    else {
      background(50, 100, 250);
      textAlign(CENTER);
      imageMode(CENTER);
      text("You lost!", 300, 250);
      image(home, 300, 350, 50, 50);
    }
  }//state=4
  if (state==5) {
    frame.setSize(1250, 1000);
    cp5.get(Button.class, "Watch_the_Skies").hide();
    cp5.get(Button.class, "Physics").hide();
    cp5.get(Button.class, "Bounce").hide();
    cp5.get(Button.class, "Falling").hide();
    cp5.get(Button.class, "OrdrIn").hide();
    cp5.get(Range.class, "Price").show();
    cp5.get(Button.class, "EssayGrader").hide();
    cp5.get(Textfield.class, "Mass (Ball 1)").hide();
    cp5.get(Textfield.class, "Gravity (Ball 1)").hide();
    cp5.get(Textfield.class, "Velocity X (Ball 1)").hide();
    cp5.get(Textfield.class, "Velocity Y (Ball 1)").hide();
    cp5.get(Textfield.class, "Mass (Ball 2)").hide();
    cp5.get(Textfield.class, "Gravity (Ball 2)").hide();
    cp5.get(Textfield.class, "Velocity X (Ball 2)").hide();
    cp5.get(Textfield.class, "Velocity Y (Ball 2)").hide();
    cp5.get(Button.class, "Earth1").hide();
    cp5.get(Button.class, "Moon1").hide();
    cp5.get(Button.class, "Mars1").hide();
    cp5.get(Button.class, "Jupiter1").hide();
    cp5.get(Button.class, "Earth2").hide();
    cp5.get(Button.class, "Moon2").hide();
    cp5.get(Button.class, "Mars2").hide();
    cp5.get(Button.class, "Jupiter2").hide();
    textAlign(LEFT);
    noStroke();
    fill(140);
    rect(0, 70, 4000, 4000);
    rect(0, 50, 300, 30);
    for (int i = 0; i < food.size(); i++) {
      if (food.getJSONObject(i).getInt("mino") >= costMin && food.getJSONObject(i).getInt("mino") <= costMax) {
        if (food.getJSONObject(i).getInt("del") <= 30) {
          printed+=20;
          fill(0);
          textSize(15);
          if (70+printed <= 880) {
            text(food.getJSONObject(i).getString("na")+" - "+food.getJSONObject(i).getInt("del")+" Mins", 20, 70+printed);
          }
          if (70+printed > 880 && 70+printed <= 1680) {
            text(food.getJSONObject(i).getString("na")+" - "+food.getJSONObject(i).getInt("del")+" Mins", 360, 70+printed-800);
          }
          if (70+printed > 1680 && 70+printed < 2480) {
            text(food.getJSONObject(i).getString("na")+" - "+food.getJSONObject(i).getInt("del")+" Mins", 700, 70+printed-1600);
          }
          else {
            text(food.getJSONObject(i).getString("na")+" - "+food.getJSONObject(i).getInt("del")+" Mins", 1040, 70+printed-2400);
          }
        }
      }
    }
    printed = 0;
    imageMode(CENTER);
    image(home, 1100, 800, 50, 50);
  }//state=5;
  else if (state==6) {
    cp5.get(Button.class, "Watch_the_Skies").hide();
    cp5.get(Button.class, "Physics").hide();
    cp5.get(Button.class, "Bounce").hide();
    cp5.get(Button.class, "Falling").hide();
    cp5.get(Button.class, "OrdrIn").hide();
    cp5.get(Button.class, "EssayGrader").hide();
    cp5.get(Range.class, "Price").hide();
    cp5.get(Textfield.class, "Mass (Ball 1)").hide();
    cp5.get(Textfield.class, "Gravity (Ball 1)").hide();
    cp5.get(Textfield.class, "Velocity X (Ball 1)").hide();
    cp5.get(Textfield.class, "Velocity Y (Ball 1)").hide();
    cp5.get(Textfield.class, "Mass (Ball 2)").hide();
    cp5.get(Textfield.class, "Gravity (Ball 2)").hide();
    cp5.get(Textfield.class, "Velocity X (Ball 2)").hide();
    cp5.get(Textfield.class, "Velocity Y (Ball 2)").hide();
    cp5.get(Button.class, "Earth1").hide();
    cp5.get(Button.class, "Moon1").hide();
    cp5.get(Button.class, "Mars1").hide();
    cp5.get(Button.class, "Jupiter1").hide();
    cp5.get(Button.class, "Earth2").hide();
    cp5.get(Button.class, "Moon2").hide();
    cp5.get(Button.class, "Mars2").hide();
    cp5.get(Button.class, "Jupiter2").hide();
    while (q<1) {
      background (0, 128, 0);
      String essay[] = loadStrings("essay.txt");
      println(essay);
      for (int k =0; k<essay.length; k++) {


        essay[k]= essay[k].replace(' ', '\n');
      }
      println(essay);
      saveStrings("finalessay.txt", essay); 
      String finalessay[] = loadStrings("finalessay.txt");
      wordcount = finalessay.length;
      for (int i = 0; i<finalessay.length; i++) {
        if (finalessay[i].length()==6 && finalessay[i].charAt(5)!=';'&&finalessay[i].charAt(5)!='.'&&finalessay[i].charAt(5)!=',') {
          count6++;
        }
        else if (finalessay[i].length()==7&& finalessay[i].charAt(6)!=';'&&finalessay[i].charAt(6)!='.'&&finalessay[i].charAt(6)!=',') {
          count7++;
        }
        else if (finalessay[i].length()>=8&& finalessay[i].charAt(7)!=';'&&finalessay[i].charAt(7)!='.'&&finalessay[i].charAt(7)!=',') {
          count8++;
        }

        for (int j = 0; j<finalessay[i].length(); j++) {
          if (finalessay[i].charAt(j)==';') {
            semicount++;
          }
        }
      }
      if (wordcount/10<=20) {
        point+=wordcount/75;
      }
      else {
        point+=20;
      }

      if ( semicount/wordcount*300<=20) {
        point+= semicount/wordcount*300;
      }
      else {
        point+=20;
      }

      if ( count6/wordcount*300<=20) {
        point+= count6/wordcount*300;
      }
      else {
        point+=20;
      }
      if ( count7/wordcount*150<=20) {
        point+= count6/wordcount*150;
      }
      else {
        point+=20;
      }

      if (count6/wordcount*500<=20) {
        point+= count6/wordcount*500;
      }
      else {
        point+=20;
      }
      println(point);
      println(wordcount);
      q++;
      textAlign(CENTER);
      textSize(70);
      text(point+"%", 300, 300);
      if (point<60) {
        text("F", 300, 380);
      }
      else if (point<70) {
        text("D", 300, 380);
      }
      else if (point<80) {
        text("C", 300, 380);
      }
      else if (point<90) {
        text("B", 300, 380);
      }
      else if (point<100) {
        text("A", 300, 380);
      }
      else {
        text("A+", 300, 380);
      }
    }
    imageMode(CENTER);
    image(home, 300, 450, 50, 50);
  }
}

void mouseClicked() {
  if (state==2) {
    if (mouseX>1125 && mouseX<1175 && mouseY>525 && mouseY<575) {//home
      state=0;
    }
    if (mouseX>825 && mouseX<875 && mouseY>525 && mouseY<575) {//reset
      x=50;
      y=75;
      x2=450;
      y2=75;
      vx=0;
      vy=0;
      vx2=0;
      vy2=0;
      vxi=0;
      vyi=0;
      vxi2=0;
      vyi2=0;
      ay=9.8;
      ay2=9.8;
      mass=50; 
      mass2=50;
      drop1=false;
      drop2=false;
    }
    if (mouseX>840 && mouseX<960 && mouseY>30 && mouseY<90) {//drop left
      x=50;
      y=75;
      vx=vxi;
      vy=vyi;
      drop1=true;
    }
    if (mouseX>1040 && mouseX<1160 && mouseY>30 && mouseY<90) {//drop right
      x2=450;
      y2=75;
      vx2=vxi2;
      vy2=vyi2;
      drop2=true;
    }
    if (mouseX>880 && mouseX<1120 && mouseY>490 && mouseY<550) {//drop together
      x=50;
      y=75;
      x2=450;
      y2=75;
      vx=vxi;
      vy=vyi;
      vx2=vxi2;
      vy2=vyi2;
      drop1=true;
      drop2=true;
    }
  }
  else if (state==4) {
    if (mouseX>275 && mouseX<325 && mouseY>325 && mouseY<375) {//home
      state=0;
    }
  }
  else if (state==5) {
    if (mouseX>1075 && mouseX<1125 && mouseY>775 && mouseY<825) {//home
      state=0;
    }
  }
  else if (state==6) {
    if (mouseX>275 && mouseX<325 && mouseY>425 && mouseY<475) {//home
      state=0;
    }
  }
}

void mousePressed() {
  if (state == 0) {
    if (mouseX > 125 && mouseX < 225 && mouseY > 110 && mouseY < 210) {
      state = 1;
    }
  }
  else if (state == 1) {
    if ((mouseX - 650) * (mouseX - 650) + (mouseY - 100) * (mouseY - 100) < 6400) {
      playing = true;
      time = 0;

      if (p1.dead) {
        p1.dead = false;
        p1.lives = 10;
      }
      for (int i = 0; i < 30; i++) {
        bogies.add(new Bogies(1, 0));
      }
    }
    else if (mouseX > 625 && mouseX < 675 && mouseY > 400 && mouseY < 450) {//back
      state = 0;
      p1.dead = true;
    }
  }
}

void keyPressed() {
  if (state==1) {
    if (keyCode == LEFT) {
      p1.left = true;
    }
    if (keyCode == RIGHT) {
      p1.right = true;
    }
    if (keyCode == UP) {
      p1.up = true;
    }
    if (keyCode == DOWN) {
      p1.down = true;
    }
  }
  else if (state==4) {
    if (keyCode == LEFT) {
      if (ball.bX>=15)
        ball.bX-=5;
    }
    if (keyCode == RIGHT) {
      if (ball.bX<=585)
        ball.bX+=5;
    }
  }
}

void keyReleased() {
  if (state==1) {
    if (keyCode == LEFT) {
      p1.left = false;
    }
    if (keyCode == RIGHT) {
      p1.right = false;
    }
    if (keyCode == UP) {
      p1.up = false;
    }
    if (keyCode == DOWN) {
      p1.down = false;
    }
  }
}

public void Watch_the_Skies() {
  state=1;
}

public void Physics() {
  state=2;
}

public void Bounce() {
  state=3;
}

public void Falling() {
  state=4;
}

public void OrdrIn() {
  state=5;
}

public void Earth1() {
  ay=9.8;
}

public void Moon1() {
  ay=1.6;
}

public void Mars1() {
  ay=3.7;
}

public void Jupiter1() {
  ay=24.8;
}

public void Earth2() {
  ay2=9.8;
}

public void Moon2() {
  ay2=1.6;
}

public void Mars2() {
  ay2=3.7;
}

public void Jupiter2() {
  ay2=24.8;
}

public void EssayGrader() {
  state=6;
}

void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isFrom("Price")) {
    costMin = int(theControlEvent.getController().getArrayValue(0));
    costMax = int(theControlEvent.getController().getArrayValue(1));
  }
}

void customize1(Range ddl) {
  textSize(10);
  ddl.captionLabel().set("What is the minimum price you would be willing to spend?");
}

