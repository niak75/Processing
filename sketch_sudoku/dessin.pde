void dessineLeQuadrillage() {
  for (int i=0; i<9; i++) { //Le quadrillage
    strokeWeight(1);
    if (i%3==0) {
      strokeWeight(2);
    }
    line(0, i*height/9, width, i*height/9);
    line(i*width/9, 0, i*width/9, height);
  }
}

void dessineNumerosConnus() {
  textAlign(LEFT, CENTER);
  for (int y=0; y<9; y++) {
    for (int x=0; x<9; x++) {
      if (numeros[y*9+x].n!=0) {//Si le numéro est connu
        fill(numeros[y*9+x].couleur);
        text(numeros[y*9+x].n, x*width/9+width/18, y*height/9+height/18);
      }
    }
  }
}

void dessineLesPossibilites() {
  for (int i=0; i<numeros.length; i++) {
    if (numeros[i].n==0) {
      for (int n=0; n<9; n++) {
        if (numeros[i].determineLesPossibilites()[n]==1) {
          fill(255);
          text(n+1, numeros[i].x*width/9+width/100+n%3*width/30, numeros[i].y*height/9+height/70+n/3*height/30);
        }
      }
    }
  }
}

void dessineLesPossibilitesUniques() {
  for (int i=0; i<numeros.length; i++) {
    for (int n=0; n<9; n++) {
      if (numeros[i].n==0) {
        if (numeros[i].determineLesPossibilites()[n]==1 && (numeros[i].possibilitesDeMaZone()[n]==0||numeros[i].possibilitesDeMaZone()[n+9]==0||numeros[i].possibilitesDeMaZone()[n+18]==0)) {
          fill(255,0,0);
          text(n+1, numeros[i].x*width/9+width/100+n%3*width/30, numeros[i].y*height/9+height/70+n/3*height/30);
        }
      }
    }
  }
}