int nbNombres=110000;
int n;
int i=0;

void setup(){
  size(700,700);
  strokeWeight(2);
}

void draw(){
  translate(width/2,height/2);
  int[] nbPassage = new int[700];
  for(int i=1 ; i<nbNombres+1 ; i++){
    n=i;
    while(n!=1){
      if(n%2==0){
        n=n/2;
      }
      else{
        n=3*n+1;
      }
      if(n<700)nbPassage[n]+=1;
    }
  }
  for(int i=0 ; i<height;i++){
    rotate(radians(height/360));
    stroke(nbPassage[i]/300,0,0);
    line(0,0,sqrt(sqrt(nbPassage[i]*10000)),0);
  }
}

void mousePressed(){
  noLoop();
}