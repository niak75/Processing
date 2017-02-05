class Case { //La classe qui représente chaque case
  int n=0;//Le num de la case (0 tant que pas trouvé)

  int x;
  int y;
  
  color couleur=color(0,0,0);

  Case(int position) {    
    y=position/9;
    x=position%9;
  }

  int[] determineLesPossibilites() {
    if (n!=0)println("Cette case a déjà un numéro");
    int[] possibilites={1, 1, 1, 1, 1, 1, 1, 1, 1};

    for (int i=0; i<casesDansMaZone().length; i++) {
      if (numeros[casesDansMaZone()[i]].n!=0) {
        possibilites[numeros[casesDansMaZone()[i]].n-1]=0;
      }
    }
    return possibilites;
  }

  int[] possibilitesDeMaZone() {
    int[] possibilitesDeMaZone={0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0, 
      0, 0, 0, 0, 0, 0, 0, 0, 0};

    for (int i=0; i<casesDansMaZone().length; i++) {
      if (casesDansMaZone()[i]!=y*9+x) { //Si la case n'est pas la même que la nôtre
        for (int n=0; n<9; n++) {
          if (numeros[casesDansMaZone()[i]].n==0) {
            if (numeros[casesDansMaZone()[i]].determineLesPossibilites()[n]==1) {
              possibilitesDeMaZone[n+(i/9)*9]=1;
            }
          }
        }
      }
    }
    return possibilitesDeMaZone;
  }

  int[] casesDansMaZone() { //Retourne les coordonnées des cases appartenant à la zone de la case
    int posCarreau=(y/3)*9*3+(x/3)*3; //Position du carreau 3*3 dans lequel est la case
    int[] casesDansMaZone={y*9, y*9+1, y*9+2, y*9+3, y*9+4, y*9+5, y*9+6, y*9+7, y*9+8, x, 9+x, 18+x, 27+x, 36+x, 45+x, 54+x, 63+x, 72+x, 
      posCarreau, posCarreau+1, posCarreau+2, posCarreau+9, posCarreau+10, posCarreau+11, posCarreau+18, posCarreau+19, posCarreau+20};
    return casesDansMaZone;
  }
}