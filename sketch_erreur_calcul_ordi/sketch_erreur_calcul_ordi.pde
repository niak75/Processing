double n=0;
float r=0;

void setup() {
  size(700, 700);
}

void mouseReleased(){
  println(mouseY);
}

void draw() {
  for (float y=0; y<height; y++) {
    for (float x=0; x<width; x++) {
      n = 0;
      if (frameCount%2==1) r=width*(y/10)+((x+1)/10); 
      if (frameCount%2==0) r=(width*y+x+1)/10; 
      for (int i=0; i<1000; i+=1) {
        n+=r;
      }
      r=r*10;
      r=(int)Math.round(r);
      r=r/10;
      set((int)x, (int)y, color(abs((float)(1000*r-n)*100)));
      //if(x==103) println(((int)(r*10))/10);
    }
  }
}