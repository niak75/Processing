float angle=0;

void setup(){
  size(700,700);
  background(0);
  noStroke();
  frameRate(100);
}

void draw(){
  background(0);
  angle=(angle+1)%360;
  translate(width/2,height/2);
  fill(255,255,255);
  triangle(-100,0,100,0,100*sin(radians(angle)),100*cos(radians(angle)));
  fill(255,0,0);
  triangle(-100,0,100*sin(radians(angle)),100*cos(radians(angle)),-100,(200*-tan(radians(90-((angle-90)/2)))));
  fill(0,0,255);
  triangle(100,0,100*sin(radians(angle)),100*cos(radians(angle)),100,(200*-tan(radians((angle-90)/2))));
}

void mousePressed(){
  println(90-((angle-90)/2));
  noLoop();
}