Balle balle;
Boite boite;

void setup() {
  size(displayWidth, displayHeight);
  
  balle=new Balle(100,100);
  boite=new Boite(20,20,300,300);
}

void draw() {
  background(255);
  
  balle.dessine();
  boite.dessine();
  balle.bouge();
}

class Balle {
  float x;
  float y;
  float rayon;
  
  float direction;
  float vitesse;
  Balle(float nouvX, float nouvY) {
    x=nouvX;
    y=nouvY;
    rayon=30;
    
    direction=(float)(Math.random()*2*Math.PI);
    vitesse=(float)(Math.random()+Math.random());
  }
  
  void dessine(){
    fill(0);
    ellipse(x,y,rayon,rayon);
  }
  
  void bouge(){
    x+=cos(direction)*vitesse;
    y+=sin(direction)*vitesse;
  }
}

class Boite {
  float tailleX;
  float tailleY;

  float x;
  float y;
  Boite(float nouvX, float nouvY, float nouvTailleX, float nouvTailleY) {
    tailleX=nouvTailleX;
    tailleY=nouvTailleY;

    x=nouvX;
    y=nouvY;
  }
  
  void dessine(){
    noFill();
    rect(x,y,tailleX,tailleY);
  }
}