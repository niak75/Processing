
color noir = color(0,0,0);
color blanc = color(255,255,255);
boolean estPremier=false;

void setup(){
  size(300,300);
}

void draw(){
  frameRate(0.1);
  for(int n=0 ; n<90000 ; n++){
    if (n < 0) {
      estPremier = false;
    }
    else if (n != 0 && n != 1) {
      for (int i = 2; i <= n/2; i++) {
        if (n != i && n % i == 0) {
          estPremier = false;
          set(n%300,Math.round(n/300),noir);
          break;
        }
        else{
          set(n%300,Math.round(n/300),blanc);
        }
      }
    }
  }
}