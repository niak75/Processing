float r=random(255);
float g=random(255);
float b=random(255);

void setup() {
  size(displayWidth, displayHeight);
  background(0);
  strokeWeight(10);
}

void draw() {
  stroke(r, g, b, 10 );

  r+=random(20)-10;
  g+=random(20)-10;
  b+=random(20)-10;

  for (int i=0; i<width; i++) {
    point(i, height/2-dessin1(i));
    point(i, height/2-dessin2(i));
    point(i, height/2-dessin3(i));
  }
}

float dessin1(int n) {
  return (float)(Math.sqrt(n)*n)/frameCount;
}

float dessin2(int n) {
  return (float)(n*Math.cos(radians(n)))/(float)Math.sqrt(frameCount);
}

float dessin3(int n) {
  return -(float)(Math.sqrt(n)*n)/frameCount;
}



void mousePressed() {
  background(0);
  frameCount=0;

  r=random(255);
  g=random(255);
  b=random(255);
}