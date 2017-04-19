class Cellule {
  float x;
  float y;

  float vitesseX;
  float vitesseY;

  float diametre;
  float diametreFinal;
  float aire;
  color couleur;
  int indice;
  Equipe equipe;

  Cellule(int i, color nouvCouleur, float nouvX, float nouvY, Equipe nouvEquipe) {
    x = nouvX;
    y = nouvY;

    vitesseX = random(vitesseMoyenne*2)-vitesseMoyenne;
    vitesseY = random(vitesseMoyenne*2)-vitesseMoyenne;

    diametre = (random(diametreMoyen)+random(diametreMoyen))/2.0;
    aire = (float)(Math.PI*diametre*diametre/4.0);
    diametreFinal = diametre;
    couleur = nouvCouleur;
    indice = i;
    equipe= nouvEquipe;
  }

  void dessine() {
    fill(couleur);
    ellipse(x, y, diametre, diametre);
  }

  void bouge() {
    x += vitesseX;
    y += vitesseY;

    vitesseX += random(vitesseMoyenne*2)-vitesseMoyenne - vitesseX/amplitudeMouvement;
    vitesseY += random(vitesseMoyenne*2)-vitesseMoyenne - vitesseY/amplitudeMouvement;

    diametre += (diametreFinal-diametre)/20.0;
    aire = (float)(Math.PI*diametre*diametre/4.0);
  }

  Cellule[] cellulesTouchees() {
    Cellule[] cellulesTouchees = new Cellule[0];
    for (int i=0; i<nbCellules; i++) {
      if (i!=indice && cellules[i].diametreFinal!=0 && cellules[i].couleur != couleur) {
        float distanceEntreCentres = (float)Math.sqrt((x-cellules[i].x)*(x-cellules[i].x)+(y-cellules[i].y)*(y-cellules[i].y));
        float sommeRayons = diametre/2.0+cellules[i].diametre/2.0;

        if (distanceEntreCentres<=sommeRayons) {
          cellulesTouchees = (Cellule[])append(cellulesTouchees, cellules[i]);
        }
      }
    }
    return cellulesTouchees;
  }

  void assemble(Cellule autreCellule) {
    float coefficientProportionnalite = (diametreFinal*diametreFinal)/(diametreFinal*diametreFinal+autreCellule.diametreFinal*autreCellule.diametreFinal);
    Cellule celluleGagnante = this; 
    Cellule cellulePerdante = autreCellule;
    if (Math.random()>coefficientProportionnalite) {
      celluleGagnante = autreCellule;
      cellulePerdante = this;
    }

    celluleGagnante.diametreFinal = (float)Math.sqrt((Math.PI*diametreFinal*diametreFinal+Math.PI*autreCellule.diametreFinal*autreCellule.diametreFinal)/Math.PI);
    cellulePerdante.diametreFinal = 0;
  }

  void explose() {
    for (int i=0; i<nbCellulesApresExplosion; i++) {
      creeCellule(couleur, x, y, equipe);
    }
    enleveCellule(indice);
  }

  void enleveDechets() {
    if (diametre<1 || x<-100 || x>width+100 || y < -100 || y>height+100) {
      enleveCellule(indice); //On enlève les cellules qui sont trop loin ou trop petites
    }
  }
}