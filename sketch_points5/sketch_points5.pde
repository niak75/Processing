float[] posX = new float[1000000];
float[] posY = new float[1000000];
float[] ancienPosX = new float[1000000];
float[] ancienPosY = new float[1000000];

int nbElements=0;
int n;

void setup(){
  size(700,700);
  noStroke();
}

void draw(){
  println(nbElements);
  fill(0,0,0,20);
  rect(0,0,width,height);
 
  for(int i=0;i<nbElements;i++){
    fill((i*55)%255,frameCount%255,125,frameCount%255+40);
    posX[i]+=random(-10,10);
    posY[i]+=random(-10,10);
    ellipse(posX[i],posY[i],(i%13)+6,(i%13)+6);
    if(posX[i]<0 || posX[i]>width || posY[i]<0  || posY[i]>height){
      posX[i]=width/2;
      posY[i]=height/2;
      
      posX[nbElements]=width/2;
      posY[nbElements]=height/2;
      nbElements++;
    }
  }
}

void mouseMoved(){
  posX[nbElements]=width/2;
  posY[nbElements]=height/2;
  nbElements++;
}