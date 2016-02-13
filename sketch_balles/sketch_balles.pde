int nbBalles=30;
double distanceBalles;
balle[] balles=new balle[nbBalles];

void setup() {
  size(displayWidth, displayHeight);
  for (int i=0; i<nbBalles; i++) {
    boolean ok;
    do {
      ok = true;
      balles[i]= new balle(random(-180, 180), random(0, 8));
      for (int n=0; n<i; n++) {
        if (balles[n].toucheBalle(balles[i])) {
          ok = false;
          break;
        }
      }
    } while (!ok);
  }
  frameRate(40);
}

void draw() {
  background(0);
  for (int i=0; i<nbBalles; i++) {
    balles[i].bouge();
    balles[i].affiche();
    for (int n=0; n<i; n++) {
      balles[n].rebondisContre(balles[i]);
    }
  }
}


class Mouvement {
  float direction;
  float vitesse;
  Mouvement(float nouvDirection, float nouvVitesse) {
    direction=nouvDirection;
    vitesse=nouvVitesse;
  }

  float deplacementX() {
    return cos(radians(direction))*vitesse;
  }
  float deplacementY() {
    return sin(radians(direction))*vitesse;
  }
  void echange(Mouvement autre) {
    float tmpVitesse = autre.vitesse, tmpDirection = autre.direction;
    autre.vitesse = vitesse; 
    vitesse = tmpVitesse;
    autre.direction = direction; 
    direction = tmpDirection;
  }
}

class balle {
  Mouvement mouvement;
  float posX;
  float posY;
  float taille;
  float couleur;

  balle(float nouvDirection, float nouvVitesse) {
    mouvement=new Mouvement(nouvDirection, nouvVitesse);
    posX=random(50, width-50);
    posY=random(50, height-50);
    taille=random(30, 100);
    couleur=255;
  }

  void bouge() {
    posX+=mouvement.deplacementX();
    posY+=mouvement.deplacementY();

    if (posX>width) {
      posX=0;
    }
    if (posX<0) {
      posX=width;
    }
    if (posY>height) {
      posY=0;
    }
    if (posY<0) {
      posY=height;
    }
  }

  void affiche() {
    ellipse(posX, posY, taille, taille);
  }

  void echangeMouvements(balle autreBalle) {
    mouvement.echange(autreBalle.mouvement);
  }
  
  float distanceTorique(float x1, float x2, float largeur) {
    return min(abs(x1-x2), largeur - max(x1,x2) + min(x1,x2));
  }

  double calculeDistance(balle autre) {
    return Math.sqrt(Math.pow(distanceTorique(posX, autre.posX, width), 2)
    +(Math.pow(distanceTorique(posY, autre.posY, height), 2)));
  }

  boolean toucheBalle(balle autre) {
    return calculeDistance(autre) < autre.taille/2 + taille/2;
  }

  void rebondisContre(balle autre) {
    if (toucheBalle(autre)) {
      echangeMouvements(autre);
    }
  }
}