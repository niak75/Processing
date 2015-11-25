// Le nombre qui va porter l'erreur de calcul pour chaque pixel
double n=0; 

// Le nombre qui sert de base à n et qui sert a calculer l'erreur de calcul finale
float r=0; 

// Utilisée pour varier la luminosité des pixels en fonction de chaque représentation
float luminosite; 

boolean loop=true;

void setup() {
  size(700, 700);
}

// Suspend et redémarre draw()
void mouseReleased() {
  if (loop) {
    noLoop();
    loop=false;
  } else {
    loop();
    loop=true;
  }
}

void draw() {
  frameRate(0.5);

  // Les deux boucles qui calculent la couleur de chaque pixel
  for (float y=0; y<height; y++) {
    for (float x=0; x<width; x++) {
      if (y==0) y=1;
      n = 0;

      // Quatre cas possibles (en modifiant r) pour des représentations différentes      
      if (frameCount%5==1) { 
        r=(width*y+x+1)/10; 
        luminosite=100;
      }
      if (frameCount%5==2) {
        r=x*y; 
        luminosite=100;
      }
      if (frameCount%5==3) {
        r=x/y; 
        luminosite=5;
      }
      if (frameCount%5==4) {
        r=(x-y)*y*x; 
        luminosite=0.4;
      }
      if (frameCount%5==0) {
        r=(x/y)/(y-x)*(width*y+x+1)/10/(x-y)*y*x;  
        luminosite=3;
      }
      // Incrémentation de n par r pour créer l'erreur de calcul
      for (int i=0; i<1000; i+=1) {
        n+=r;
      }

      // Obtention d'un arrondi de r aux dixièmes
      r=r*10;
      r=(int)Math.round(r);
      r=r/10;

      // Colorage des points en fonction de l'écart entre 1000r et n dû aux erreurs de calcul 
      set((int)x, (int)y, color(abs((float)(1000*r-n)*luminosite)));
    }
  }
}