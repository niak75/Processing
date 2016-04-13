int a=0;
int deuxiemeMaximumAttaque;

void setup() {
  size(100, 100);
  frameRate(100);
}

void draw() {
  a+=combat(10,10);
}

int combat(int soldatsAttaque, int soldatsDefense) {
  while (soldatsAttaque>0 && soldatsDefense>0) {

    int nbDesAttaque=min(3, soldatsAttaque);
    int nbDesDefense=min(2, soldatsDefense);

    int[] desAttaque=new int[nbDesAttaque];
    int[] desDefense=new int[nbDesDefense];

    for (int i=0; i<nbDesAttaque; i++) {
      desAttaque[i]=(int)Math.ceil(random(0, 6));
    }
    for (int i=0; i<nbDesDefense; i++) {
      desDefense[i]=(int)Math.ceil(random(0, 6));
    }

    if (max(desAttaque)>max(desDefense)) {
      soldatsDefense-=1;
    } else {
      soldatsAttaque-=1;
    }

    if (soldatsAttaque>1 && soldatsDefense>1) {
      deuxiemeMaximumAttaque=min(desAttaque);
      
      for (int i=0; i<nbDesAttaque; i++) {
        if (desAttaque[i]!=min(desAttaque) && desAttaque[i]!=max(desAttaque)) {
          deuxiemeMaximumAttaque=desAttaque[i];
        }
      }
    }
    int deuxiemeMaximumDefense=min(desDefense);
    if (deuxiemeMaximumAttaque>deuxiemeMaximumDefense) {
      soldatsDefense-=1;
    } else {
      soldatsAttaque-=1;
    }
    println(deuxiemeMaximumAttaque, deuxiemeMaximumDefense);

  } 

if (soldatsDefense==0) {
  return 1;
} else {
  return 0;
}
}

void mousePressed() {
  int chancesDeGagner=round(100*float(a)/float(frameCount));
  println("Il y a "+chancesDeGagner+" % de chances de gagner la bataille en attaquant !");
  if (chancesDeGagner>85)println("La bataille est dans la poche !");
  else if (chancesDeGagner>70)println("Nos ennemis tremblent déja devant notre armée !");
  else if (chancesDeGagner>55)println("Nos soldats sentent la victoire approcher...");
  else if (chancesDeGagner>45)println("La bataille va être rude, mais ce sera une belle bataille !");
  else if (chancesDeGagner>30)println("A triompher sans mérite, on triompherait sans gloire...");
  else if (chancesDeGagner>10)println("D'un héroique courage aura besoin l'armée...");
  else {
    print("Je ne suis pas payé pour me suicider, je démissione !");
  }
  noLoop();
}