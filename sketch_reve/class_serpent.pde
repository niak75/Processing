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
    float distance=random(tailleSerpents-15,tailleSerpents);
    if(distance<0)distance=0;
    
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