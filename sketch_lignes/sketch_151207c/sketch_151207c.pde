float taille=350;
int nbPoints=10;

void setup() {
  size(700, 700);
}

void draw() {
  translate(width/2, height/2);

  line(-taille, 0, taille, 0);
  line(0, -taille, 0, taille);

  for (int x=0; x<nbPoints+1; x++) {
    line(x*taille/nbPoints-taille-taille/nbPoints, 0, 0, (nbPoints-x)*taille/nbPoints-taille);
    line(x*taille/nbPoints-taille-taille/nbPoints, 0, 0, (nbPoints+x)*taille/nbPoints-taille);
    line(x*taille/nbPoints+taille/nbPoints, 0, 0, (nbPoints-x)*taille/nbPoints);
    line(x*taille/nbPoints+taille/nbPoints, 0, 0, (-nbPoints+x)*taille/nbPoints);
  }
}