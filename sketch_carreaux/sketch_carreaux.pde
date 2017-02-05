int nbCarreauxParCote=175;
Carreau[] carreaux=new Carreau[nbCarreauxParCote*nbCarreauxParCote];

void setup() {
  size(700, 700);
  noStroke();

  for (int y=0; y<nbCarreauxParCote; y++) {
    for (int x=0; x<nbCarreauxParCote; x++) {
      carreaux[y*nbCarreauxParCote+x]=new Carreau(x, y, nbCarreauxParCote);
    }
  }
}

void draw() {
  for (int y=0; y<nbCarreauxParCote; y++) {
    for (int x=0; x<nbCarreauxParCote; x++) {
      carreaux[y*nbCarreauxParCote+x].dessine();
      carreaux[y*nbCarreauxParCote+x].deplace();
    }
  }
}

class Carreau {
  int x;
  int y;

  float r;
  float g;
  float b;

  int reference;

  Carreau(int nouvX, int nouvY, int nbCarreauxParCote) {
    x=nouvX;
    y=nouvY;

    r=random(255);
    g=random(255);
    b=random(255);

    reference=(int)random(nbCarreauxParCote*nbCarreauxParCote);
  }

  void dessine() {
    fill(r, g, b);
    rect(x*width/nbCarreauxParCote, y*height/nbCarreauxParCote, width/nbCarreauxParCote, height/nbCarreauxParCote);
  }

  void deplace() {
    Carreau ref=carreaux[reference];
    float echelle=width/nbCarreauxParCote;
    
    float sommeCouleurs=b;
    float distSouris=(float)Math.sqrt((mouseX-x*echelle)*(mouseX-x*echelle)+(mouseY-y*echelle)*(mouseY-y*echelle));

    float sommeCouleursReference=ref.b;
    float distSourisReference=(float)Math.sqrt((mouseX-ref.x*echelle)*(mouseX-ref.x*echelle)+(mouseY-ref.y*echelle)*(mouseY-ref.y*echelle));

    if ((sommeCouleurs<sommeCouleursReference && distSouris>distSourisReference) || (sommeCouleurs>sommeCouleursReference && distSouris<distSourisReference)) {
      int xTemporaire=x;
      int yTemporaire=y;

      x=carreaux[reference].x;
      y=carreaux[reference].y;

      carreaux[reference].x=xTemporaire;
      carreaux[reference].y=yTemporaire;
    }
  }
}