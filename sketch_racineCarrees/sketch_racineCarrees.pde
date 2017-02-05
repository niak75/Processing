float nb = 729;

void setup(){
}

void draw(){
  println("Calculée : "+racineCarree(nb));
  println("Donnée : "+Math.sqrt(nb));
  println();
}

double racineCarree(float n){
  double maxima=n;
  double minima=0;
  double racine=maxima/2;
  for(int i=0 ; i<1000 ; i++){
    if(racine*racine<n){
      minima=racine;
      racine=(maxima+minima)/2;
    }
    if(racine*racine>n){
      maxima=racine;
      racine=(maxima+minima)/2;
    }
    if(racine*racine==n){
      i=1000;
    }
  }
  return racine;
}