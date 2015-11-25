void setup(){
  size(700,700);
}

void draw() {
  for(int y=0 ; y<height ; y++){
    for(int x=0 ; x<width ; x++){
      color couleur=color(determineCouleur(x,y));
      set(x,y,couleur);
    }
  }
}

float determineCouleur(int x, int y){
  
  int n = 0;
  x -= width/2;
  y -= height/2;
  
  while(n<255){
    if(x*y%700!=0){
      x+=x+y;
    }
    else{
      break;
    }
    n++;
  }
  float resultat=n;
  return resultat;
}