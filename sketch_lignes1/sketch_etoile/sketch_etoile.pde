float taille=350;
int nbPoints=10;

float[] positionsPointsAxeX = new float[nbPoints];
float[] positionsPointsAxeY = new float[nbPoints];

float angle=0;

void setup() {
  size(1280, 800);
  background(0);
  stroke(255);
}

void draw() {
  fill(0,0,0,50);
  rect(-1,-1,width+1,height+1);
  angle=radians(mouseX);
 
  translate(width/2,height/2);
  line(-taille,0,taille,0);
  line(sin(angle)*taille,cos(angle)*taille,-sin(angle)*taille,-cos(angle)*taille);
  for (int i=1; i<nbPoints+1; i++) {
    float positionSurAxe= i/(float)nbPoints;   // Nombre entre 0 et 1
    println(positionSurAxe);
    line(-taille*positionSurAxe,0,sin(angle)*taille*(1-positionSurAxe),cos(angle)*taille*(1-positionSurAxe));
    line(-taille*positionSurAxe,0,-sin(angle)*taille*(1-positionSurAxe),-cos(angle)*taille*(1-positionSurAxe));
    line(taille*positionSurAxe,0,sin(angle)*taille*(1-positionSurAxe),cos(angle)*taille*(1-positionSurAxe));
    line(taille*positionSurAxe,0,-sin(angle)*taille*(1-positionSurAxe),-cos(angle)*taille*(1-positionSurAxe));
  }
}

void mousePressed(){
  noLoop();
}