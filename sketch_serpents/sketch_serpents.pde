int nbSerpents=50;
serpent[] serpents=new serpent[nbSerpents];
serpent mySerpent1 = new serpent(350, 350, 0, 0, 0, 255);
serpent mySerpent2 = new serpent(350, 350, 0, 255, 255, 0);

void setup() {
  size(1200, 700);
  background(0);
  frameRate(25);
  for (int i = 0; i < nbSerpents; i++) {
    serpents[i] = new serpent(350, 350, 0, 255, 255, 255);
  }
}

void draw() {
  fill(0, 0, 0, 60);
  stroke(0);
  rect(0, 0, width, height);
  strokeWeight(20);
  mySerpent1.avance();
  mySerpent2.avance();
  strokeWeight(2);
  for (int i = 0; i < nbSerpents; i++) {
    serpents[i].avance();
  }
}

class serpent {
  float x;
  float y;
  float ancienX;
  float ancienY;

  float direction;

  float r;
  float v;
  float b;

  serpent(float newX, float newY, float newDirection, float newR, float newV, float newB) {
    x=newX;
    ancienX=x;
    y=newY;
    ancienY=y;

    direction=newDirection;

    r=newR;
    v=newV;
    b=newB;
  }

  void avance() {
    float distance=random(25, 40);
    x+=distance*Math.cos(direction)-(x-width/2)/20;
    y+=distance*Math.sin(direction)-(y-height/2)/20;
    direction+=random(-radians(45), radians(45));
    
    stroke(color(r, v, b));
    line(ancienX, ancienY, x, y);
    ancienX=x;
    ancienY=y;

    r+=random(-7, 7);
    v+=random(-7, 7);
    b+=random(-7, 7);

    serpents[(int)random(nbSerpents)]=new serpent(x, y, direction, r, v, b);
  }

  void changeCouleur() {
    r=random(255);
    v=random(255);
    b=random(255);
  }
}

void mousePressed() {
  mySerpent1.changeCouleur();
  mySerpent2.changeCouleur();
}