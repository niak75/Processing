int nbMax=1;
int nbColonnes=800;

void setup() {
  size(displayWidth, displayHeight);
  noStroke();
}

void draw() {
  nbMax++;
  int[][] cases=new int[nbMax][nbMax];
  background(0);
  for (int i=0; i<nbMax; i++) {
    syracuse(i+1, cases);
  }
  dessineQuadrillage(cases);
}

void syracuse(int n, int[][] cases) {
  int i=1;
  while (n!=1) {
    if (i<=nbMax && n<=nbMax) {
      cases[n-1][i-1]+=1;
    }

    if (n%2==0) {
      n=n/2;
    } else {
      n=3*n+1;
    }
    i++;
  }
  if (i<nbMax && n<nbMax) {
    cases[n-1][i-1]+=1;
  }
}

void dessineQuadrillage(int[][] cases) {
  for (int y=0; y<nbMax; y++) {
    for (int x=0; x<nbMax; x++) {
      fill(cases[x][y]*40);
      if(cases[x][y]*40>255)fill(255);
      rect(x*width/nbColonnes, y*height/200, width/nbColonnes, height/200);
    }
  }
}

void mousePressed(){
  noLoop();
  println((float)mouseX/((float)width/(float)nbColonnes)+1);
}

//1 2 4 5 8 10 16 20 23 35 40 46 53 61 70 80 92 106 122 160 184 244 325 433 488 577 650

//2+2+1,25+1,6+1,25+1,25+1,15+1,15+1,52+1,14+1,15+1,152+1,150+1,147+1,142+1,15+1,152+1,151+1,31+1,15+1,32+2,26 = 1,34
//1 2 1 3 2 6  4  3  12 5  6  7  8  9  10 12 14 16  38  24  60  31  108 56  89  73
//23-92   53-106   61-122-244