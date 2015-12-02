float angle=0;
float[] coins = new float[700*700*700];
float coinX;
float coinY;

void setup() {
  background(255);
  size(1280, 760);
  noFill();
  strokeWeight(3);
  frameRate(30);
}

void draw() {
  angle=(angle+0.1)%90;
  translate(width/2, height/2);
  double taille=10;
  for (int i=0; i<100; i++) {
    stroke(0,i/2,0,i/5);
    rect(-(float)taille/2, -(float)taille/2, (float)taille, (float)taille);

    rotate(radians(angle));
    taille=taille*(Math.cos(radians(angle))+Math.sin(radians(angle)));
  }
  if(frameCount==90*10)noLoop();
}

void mousePressed() {
  println(frameCount);
  noLoop();
}