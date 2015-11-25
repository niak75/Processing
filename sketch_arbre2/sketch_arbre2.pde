float tendanceBranchesX = 50;
float tendanceBranchesY = 30;

float[] bourgeonsPositionsX = {};
float[] bourgeonsPositionsY = {};

int nbBourgeons = 2;
int tailleArbre = 4;

double currentX;
double currentY;

void setup() {
  size(700,700);
  background(0);
  translate(width/2,height);
  rotate(radians(180));
  makeArbre();
}

void makeArbre() {
  fill(255);
  
  for (int rangY=0 ; rangY<tailleArbre ; rangY=rangY+1){
    int premiereOuDeuxiemeBranche = 0;
    for (int rangX=0 ; rangX<Math.pow(nbBourgeons,rangY) ; rangX=rangX+1){
      
      int bourgeonID = (int)Math.round(100*(rangY-1)+Math.floor(rangX/2));
      //currentX = bourgeonsPositionsX[bourgeonID]; 
      //currentY = bourgeonsPositionsY[bourgeonID]; 
      
      if(premiereOuDeuxiemeBranche%2==0){
        currentX=(float)currentX-(Math.random()*tendanceBranchesX)/rangY;
      }
      else{
        currentX=(float)currentX+(random(tendanceBranchesX))/rangY;
      }
      //currentY = currentY+(random(tendanceBranchesY))/rangY;

      
      //println(rangY+"   "+rangX);
      int currentPositionID = 100*rangY+rangX;
      println((float)currentY+(random(tendanceBranchesY))/rangY);
      
      bourgeonsPositionsX[currentPositionID] = currentX;
      bourgeonsPositionsY[currentPositionID] = currentY;

    }
  }
  
}