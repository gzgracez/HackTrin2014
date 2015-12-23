import java.awt.Frame;
import java.awt.BorderLayout;
import controlP5.*;
ControlP5 cp5;
String textValue = "";
int grid;
float x, y, xp, yp; //parabola
float h=0, k=0; //center of parabola
float nh; //negative h
float a=2; //width of parabola
float dis;//discriminant
float b, c;//b and c of equation
float sP, sN;//solutions of equation (positive & negative solutions)
float real, imag;//b/2a & imaginary part of solution
float nimag; //negative of imag
int aNumDec;//number of digits after decimal of a

void setup() {
  size(700, 750);
  background(200);
  PFont font = createFont("arial", 20);
  cp5 = new ControlP5(this);
  cp5.addTextfield("a")
    .setPosition(250, -300)
      .setSize(50, 40)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 0, 0))
              .setAutoClear(false)
                ;

  cp5.addTextfield("b")
    .setPosition(250, -200)
      .setSize(50, 40)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 0, 0))
              .setAutoClear(false)
                ;

  cp5.addTextfield("c")
    .setPosition(250, -100)
      .setSize(50, 40)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 0, 0))
              .setAutoClear(false)
                ;
}

void draw() {
  background(200);
  translate(300, 350);
  scale(1, -1);
  stroke(0);
  fill(255);
  strokeWeight(4);
  rectMode(CENTER);
  rect(0, 0, 400, 500);
  scale(1, -1);
  fill(0);
  textSize(30);
  textAlign(CENTER);
  text("Quadratic Equation Solver", 0, -295);
  scale(1, -1);
  line(0, 250, 0, -250); 
  line(-200, 0, 200, 0);
  strokeWeight(1);
  for (grid=-250;grid<=250;grid+=10) {
    line(-200, grid, 200, grid);
  }
  for (grid=-200;grid<=200;grid+=10) {
    line(grid, 250, grid, -250);
  }
  strokeWeight(3);
  for (x=-20;x<=20;x+=0.01) {
    y=a*(sq(x-h))+k;
    xp=x-0.01;
    yp=a*(sq(xp-h))+k;
    if (y>-25 && y<25 && yp>-25 && yp<25) {
      stroke(0, 0, 255);
      line(xp*10, yp*10, x*10, y*10);
    }
  }
  dis=-4*a*k;
  b=-2*a*h;
  c=a*h*h+k;
  real=-b/(2*a);
  imag=(sqrt(-dis))/(2*a);
  nh=-h;
  scale(1, -1);
  if (a<1 && a>-1)
    aNumDec=3;
  else 
    aNumDec=1;
  String aa=nf(a, 1, aNumDec);//a in standard form
  String bb=nf(b, 1, 1);//b in standard form
  String cc=nf(c, 1, 1);//c in standard form
  String hh=nf(h, 1, 1);//h in vertex form
  String kk=nf(k, 1, 1);//k in vertex form
  String nhh=nf(nh, 1, 1);//-h in vertex form
  textSize(20);
  if (b>0) {
    if (c>0) text("Standard Form: \u0192(x)=" + aa + "x\u00B2 + " + bb + " x + " + cc, 0, 290);
    if (c==0) text("Standard Form: \u0192(x)=" + aa + "x\u00B2 + " + bb + " x", 0, 290);
    if (c<0) text("Standard Form: \u0192(x)=" + aa + "x\u00B2 + " + bb + " x " + cc, 0, 290);
  }
  else if (b==0) {
    if (c>0) text("Standard Form: \u0192(x)=" + aa + "x\u00B2 + " + cc, 0, 290);
    if (c==0) text("Standard Form: \u0192(x)=" + aa + "x\u00B2", 0, 290);
    if (c<0) text("Standard Form: \u0192(x)=" + aa + "x\u00B2 " + cc, 0, 290);
  }
  else {
    if (c>0) text("Standard Form: \u0192(x)=" + aa + "x\u00B2 " + bb + " x + " + cc, 0, 290);
    if (c==0) text("Standard Form: \u0192(x)=" + aa + "x\u00B2 " + bb + " x", 0, 290);
    if (c<0) text("Standard Form: \u0192(x)=" + aa + "x\u00B2 " + bb + " x " + cc, 0, 290);
  }
  if (h>0) {
    if (k>0) text("Vertex Form: \u0192(x)=" + aa + " (x - " + hh + ")\u00B2 + " + kk, 0, 320);
    else if (k<0) text("Vertex Form: \u0192(x)=" + aa + " (x - " + hh + ")\u00B2 " + kk, 0, 320);
    else text("Vertex Form: \u0192(x)=" + aa + " (x - " + hh + ")\u00B2", 0, 320);
  }
  else if (h==0) {
    if (k>0) text("Vertex Form: \u0192(x)=" + aa + "x\u00B2 + " + kk, 0, 320);
    else if (k<0) text("Vertex Form: \u0192(x)=" + aa + "x\u00B2 " + kk, 0, 320);
    else text("Vertex Form: \u0192(x)=" + aa + "x\u00B2", 0, 320);
  }
  else {
    if (k>0) text("Vertex Form: \u0192(x)=" + aa + " (x + " + nhh + ")\u00B2 + " + kk, 0, 320);
    else if (k<0) text("Vertex Form: \u0192(x)=" + aa + " (x + " + nhh + ")\u00B2 " + kk, 0, 320);
    else text("Vertex Form: \u0192(x)=" + aa + " (x + " + nhh + ")\u00B2", 0, 320);
  }
  text("Vertex of Parabola: (" + hh + ", " + kk + ")", 0, 350);
  String sPo=nf(sP, 1, 1);//positive solution
  String sNe=nf(sN, 1, 1);//negative solution
  String Real=nf(real, 1, 1);//-b/2a
  String imagin=nf(imag, 1, 1);//imaginary solution (discriminant part)
  stroke(255, 0, 0);
  fill(255, 0, 0);
  if (dis>0) {
    sP=(-b+(sqrt(dis)))/(2*a);
    sN=(-b-(sqrt(dis)))/(2*a);
    if (sP<=20 && sP>=-20) ellipse(sP*10, 0, 3, 3);
    if (sN<=20 && sN>=-20) ellipse(sN*10, 0, 3, 3);
    fill(0);
    text("Solutions: x=" + sNe + ", " + sPo, 0, 380);
  }
  else if (dis==0) {
    sP=(-b+(sqrt(dis)))/(2*a);
    if (sP<=20 && sP>=-20) ellipse(sP*10, 0, 3, 3);
    fill(0);
    text("Solutions (repeated roots): x=" + sPo, 0, 380);
  }
  else {
    fill(0);
    if (real==0) text("Solutions (imaginary roots): x=" + imagin + "i" + ", " + "-" + imagin + "i", 0, 380);
    else text("Solutions (imaginary roots): x=" + Real + "+" + imagin + "i" + ", " + Real + "-" + imagin + "i", 0, 380);
  }
}

void mouseClicked() {
  if (mouseButton==LEFT && mouseX>100 && mouseX<500 && mouseY>100 && mouseY<600) { //graph
    h=(float)(mouseX-300)/10;
    k=((float)(-(mouseY-350)))/10;
    a=random(0.1, 10);
  }
  else if (mouseButton==RIGHT && mouseX>100 && mouseX<500 && mouseY>100 && mouseY<600) { //graph
    h=(float)(mouseX-300)/10;
    k=((float)((-(mouseY-350)))/10);
    a=random(-10, 0);
  }
}

void mouseDragged() {
  if (a==0) a=a-0.1;
  if (mouseX>100 && mouseX<500 && mouseY>150 && mouseY<650)
    a=((((float)(-(mouseY-350))/10))-k)/sq(((mouseX-300)/10)-h);//drag graph
}
