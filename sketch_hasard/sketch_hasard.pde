int nbNombres=110000;
int n;
float r=1;
int[] repartition = new int[700];

void setup(){
  size(700,700);
}

void draw(){
  frameRate(1);
  for(int i=0 ; i<100000000 ; i++){
    for(int e=0 ; e<r ; e++){
      n+=random(width);
    }
    repartition[(int)(n/r)]++;
    n=0;
  }
  r+=1;
  for(int x=0 ; x<width ; x++){
    stroke(0);
    line(x,0,x,repartition[x]/1000);
    stroke(255);
    line(x,repartition[x]/1000,x,height);
    repartition[x]=0;
  }
}

void mousePressed(){
  noLoop();
}