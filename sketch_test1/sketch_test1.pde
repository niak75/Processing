void setup() {
  size(700,700);
}

int maxiterations = 100;

void draw() {
  float a = mouseY/100;
  float b = mouseX/100;
  int n = 0;
  while (n < maxiterations) {
      float aa = a * a;
      float bb = b * b;
      float twoab =  2.0* a * b;
      a = aa - bb + mouseX/100;
      b = twoab + mouseY/100;
      // Infinty in our finite world is simple, let's just consider it 16
      if (aa + bb > 16.0) {
        break;  // Bail
      }
      n++;
    }
    if(n<100&&n>0){
      ellipse(mouseX,mouseY,10,10);
    }
}