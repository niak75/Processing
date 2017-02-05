Case[] numeros=new Case[81];
color couleur=color(0,0,0);

void setup() {
  size(700, 700);
  for (int i=0; i<numeros.length; i++) {
    numeros[i]=new Case(i);
  }
  attribueLesCases();
}

void draw() {
  background(127);
  dessineLeSudoku();
}

void attribueLesCases() {
  //On donne les numros connus
}

void dessineLeSudoku() {
  dessineLeQuadrillage();
  dessineNumerosConnus();
  dessineLesPossibilites();
  dessineLesPossibilitesUniques();
  
  fill(couleur);
  rect(width-20,0,20,20);
}

void mousePressed() {
  if (mouseX>width-20 && mouseX<width && mouseY>0 && mouseY<20) {
    couleur=color(random(255),random(255),random(255));
  } else {
    int coordonneesSouris=(int)(Math.floor(float(mouseY)/height*9)*9+Math.floor(float(mouseX)/width*9));
    numeros[coordonneesSouris].n=(numeros[coordonneesSouris].n+1)%10; //Augmente de 1 le num de la case cliquée
    numeros[coordonneesSouris].couleur=couleur;
  }
}


/*
  http://www.01annoncesclassees.com/cgi/sudoku_gratuit.php?num=29
 numeros[0*9+4].n=9; 
 numeros[0*9+8].n=4;
 numeros[1*9+0].n=1;
 numeros[1*9+4].n=6;
 numeros[1*9+8].n=2;
 numeros[2*9+0].n=3;
 numeros[2*9+1].n=9;
 numeros[2*9+8].n=8;
 numeros[3*9+2].n=9;
 numeros[3*9+3].n=8;
 numeros[3*9+5].n=1;
 numeros[3*9+7].n=7;
 numeros[3*9+8].n=6;
 numeros[4*9+1].n=3;
 numeros[5*9+0].n=4;
 numeros[5*9+3].n=5;
 numeros[6*9+2].n=2;
 numeros[6*9+4].n=1;
 numeros[6*9+5].n=9;
 numeros[7*9+5].n=2;
 numeros[7*9+7].n=6;
 numeros[8*9+0].n=5;
 numeros[8*9+6].n=4;
 
 
 numeros[0*9+0].n=8; //Très dur
 numeros[1*9+2].n=3;
 numeros[1*9+3].n=6;
 numeros[2*9+1].n=7;
 numeros[2*9+4].n=9;
 numeros[2*9+6].n=2;
 numeros[3*9+1].n=5;
 numeros[3*9+5].n=7;
 numeros[4*9+4].n=4;
 numeros[4*9+5].n=5;
 numeros[4*9+6].n=7;
 numeros[5*9+3].n=1;
 numeros[5*9+7].n=3;
 numeros[6*9+2].n=1;
 numeros[6*9+7].n=6;
 numeros[6*9+8].n=8;
 numeros[7*9+2].n=8;
 numeros[7*9+3].n=5;
 numeros[7*9+7].n=1;
 numeros[8*9+1].n=9;
 numeros[8*9+6].n=4;
 */