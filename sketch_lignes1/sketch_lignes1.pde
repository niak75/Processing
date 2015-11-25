int epaisseurDuTrait = 3;
double direction;

float currentX;
float currentY;

float newX;
float newY;

void setup () {
  size(800,600);
  currentX = 20;
  currentY = 20;
  
  newX = 20;
  newY = 20;

  direction = 1;
  
  strokeWeight(epaisseurDuTrait);
}

void draw(){
  direction = direction +Math.floor(random(-1,2));
  frameRate(2);
  println(direction);
  
  
  if (direction%4 == 0 || direction%4 == -0) newX = random(currentX,width-20)/2+random(currentX,width-20)/2;
  if (direction%4 == 1 || direction%4 == -1) newY = random(currentY,height-20)/2+random(currentY,height-20)/2;
  if (direction%4 == 2 || direction%4 == -2) newX = random(20,currentX)/2+random(20,currentX)/2;
  if (direction%4 == 3 || direction%4 == -3) newY = random(20,currentY)/2+random(20,currentY)/2;
  
  line(currentX,currentY,newX,newY);
  
  currentX = newX;
  currentY = newY;


  
  
  
}