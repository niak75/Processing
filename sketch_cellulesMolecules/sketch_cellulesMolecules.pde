float diametreMoyen = 50;
float mouvementMoyen = 5;

float vitesseMoyenne = 1;
float amplitudeMouvement = 10;

int nbCellules = 300;
Cellule[] cellules = new Cellule[nbCellules];

int nbCellulesApresExplosion = 35;
float seuilExplosion = 100;

color couleurCreation = color(255);
Equipe equipeCreation;
boolean onChercheUneCouleur=false;

boolean equipesDeterminees;
Equipe[] equipes = new Equipe[0];
String[] listeNoms = {"Bouboule", "Vikings", "Huns", "Samouraïs", "Conquisadors", "Aztecs", "Templiers", "Romains", "Illuminatis", "Mushrooms", "Zombies", "Gobelins", "Chamallow", "Bisounours", "Grobbi"};
boolean nomsAttribues = false;

void setup() {
  textAlign(LEFT, CENTER);
  size(700,700);
  noStroke();

  for (int i=0; i< nbCellules; i++) {
    color couleur = color(random(255), random(255), random(255));
    cellules[i] = new Cellule(i, couleur, random(width), random(height), new Equipe(couleur));
  }
}

void draw() {
  background(0);
  int i=0;
  while (i<nbCellules) {
    Cellule cellule = cellules[i];
    cellule.dessine();
    cellule.bouge();
    cellule.enleveDechets();

    if (cellule.diametre>seuilExplosion) {
      cellule.explose();
    }
    Cellule[] voisins = cellule.cellulesTouchees();
    if (voisins.length>0) {
      cellule.assemble(voisins[0]);
    }
    i++;
  }
  fill(couleurCreation, 170);
  rect(width-50, 30, 20, 20);

  if (frameCount==300) {
    determineEquipes();
  }
  if (equipesDeterminees) {
    calculePoints();
  }
}

void enleveCellule(int indice) {
  for (int i=indice; i<cellules.length-1; i++) {
    cellules[i] = cellules[i+1];
    cellules[i].indice--;
  }
  cellules = (Cellule[])shorten(cellules);
  nbCellules--;
}

void creeCellule(color couleur, float x, float y, Equipe equipe) {
  cellules = (Cellule[])append(cellules, new Cellule(nbCellules, couleur, x, y, equipe));
  nbCellules++;
}

void determineEquipes() {
  for (int i=0; i<nbCellules; i++) {
    boolean equipeDejaCreee = false;
    for (int n=0; n<equipes.length; n++) {
      if (equipes[n].couleur == cellules[i].equipe.couleur) {
        equipeDejaCreee = true;
        cellules[i].equipe = equipes[n];
      }
    }
    if (!equipeDejaCreee) {
      equipes=(Equipe[])append(equipes, cellules[i].equipe);
      cellules[i].equipe = equipes[equipes.length-1];
    }
  }
  equipesDeterminees=true;
}

void calculePoints() {
  for (int n=0; n<equipes.length; n++) {
    equipes[n].score=0;
  }

  for (int i=0; i<nbCellules; i++) {
    cellules[i].equipe.score += cellules[i].aire;
  }
  
  detruisEquipesVides();
  attribueRangs();
  afficheScores();
  if (nomsAttribues==false && equipes.length<=10) {
    attribueLesNoms();
  }
}

void mousePressed() {
  if (onChercheUneCouleur) {
    for (int i=0; i<nbCellules; i++) {
      float distanceClic = (float)Math.sqrt((mouseX-cellules[i].x)*(mouseX-cellules[i].x)+(mouseY-cellules[i].y)*(mouseY-cellules[i].y));
      if (distanceClic<cellules[i].diametre/2) {
        couleurCreation = cellules[i].couleur;
        equipeCreation = cellules[i].equipe;
        onChercheUneCouleur = false;
      }
    }
  }

  if (mouseX<width-30 && mouseX>width-50 && mouseY<50 && mouseY>30) {
    onChercheUneCouleur=true;
  }
}

void mouseDragged() {
  if (!onChercheUneCouleur) {
    creeCellule(couleurCreation, mouseX, mouseY, equipeCreation);
  }
}

class Equipe {
  float score;
  int rang;
  color couleur;
  String nom;

  Equipe(color nouvCouleur) {
    score=0;
    couleur = nouvCouleur;
  }
}

void attribueRangs() {
  float[] scores = new float[equipes.length];
  for (int i=0; i<equipes.length; i++) {
    scores[i]=equipes[i].score;
  }
  scores = reverse(sort(scores));

  for (int i=0; i<equipes.length; i++) {
    for (int n=0; n<scores.length; n++) {
      if (equipes[i].score == scores[n]) {
        equipes[i].rang=n;
      }
    }
  }
}

void detruisEquipesVides() {
  for (int i=0; i<equipes.length; i++) {
    if (equipes[i].score==0) {
      for (int n=i; n<equipes.length-1; n++) {
        equipes[n] = equipes[n+1];
      }
      equipes = (Equipe[])shorten(equipes);  
    }
  }
}

void attribueLesNoms() {
  for (int i=0; i<equipes.length; i++) {
    int numeroNom = (int)random(listeNoms.length);
    equipes[i].nom = listeNoms[numeroNom];
    for (int n=numeroNom; n<listeNoms.length-1; n++) {
      listeNoms[n] = listeNoms[n+1];
    }
    listeNoms = shorten(listeNoms);
  }
  nomsAttribues=true;
}

void afficheScores() {
  fill(255, 150);
  rect(5, 5, 130, 20*equipes.length+10);
  for (int i=0; i<equipes.length; i++) {
    fill(equipes[i].couleur);
    text((int)(equipes[i].score/1000.0), 20, equipes[i].rang*20+23);
    rect(10, equipes[i].rang*20+20, 7, 7);
    if (nomsAttribues) {
      text(equipes[i].nom, 50, equipes[i].rang*20+23);
    }
  }
}