void setup() {
  size(700,700);
  noStroke();
  background(0);
}

void draw() {
  float posX = random(width);
  float posY = random(height);
  float taille = random(40)+random(40);
  
  float rouge = random(255);
  float vert = random(255);
  float bleu = random(255);
  
  fill(0,0,0,5);
  rect(0,0,width,height);
  
  fill(rouge,vert,bleu,80);
  ellipse(posX,posY,taille,taille);
}