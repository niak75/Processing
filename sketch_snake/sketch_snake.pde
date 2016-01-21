float x;
float y;
float taille=5;

void setup(){
  background(0);
  size(1280,800);
  x=width/2;
  y=height/2;
  
  strokeWeight(3);
  fill(255);
  stroke(255);
}

void draw(){
  background(0);
  taille+=0.1;
  avance();
  dessineSerpent(x,y,taille);
}

void dessineSerpent(float x, float y, float taille){
  ellipse(x,y,20,20);
  line(x,y,x-taille*10,y);
}

void avance(){
  if(onMonte) y--;
  if(onDescend) y++;
  if(aDroite) x++;
  if(aGauche) x--;
  
  if (keyCode == UP) boolean onMonte=true;
  if (keyCode == DOWN)onDescend=true;
  if (keyCode == RIGHT)aDroite=true;
  if (keyCode == LEFT)aGauche=true;
}