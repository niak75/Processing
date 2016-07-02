int votesA = 150;
int votesB = 120;

int nombreDeTests=10000;

void setup() {
  size(800,500);
  text("console des erreurs", 10, 30);
}

void draw() {
  int nbFaux=0;
  int nbVrai=0;

  int nbVotes = votesA+votesB;
  
  for (int n=0; n<nombreDeTests; n++) {
    int votesDepouillesA=0;
    int votesDepouillesB = 0;

    boolean candidatAToujoursDevant = true;

    for (int i=0; i<nbVotes; i++) {
      int votesNonDepouilles = votesA-votesDepouillesA+votesB-votesDepouillesB;

      int bulletinTire = tireUnBulletin(votesNonDepouilles);
      if (votesNonDepouilles<1) {
        text("votesNonDepouilles doit être supérieur ou égal à 1",30,60);
      }
      if (bulletinTire<1 || bulletinTire>votesA-votesDepouillesA+votesB-votesDepouillesB) {
        text("bug sur la variable bulletinTire qui vaut : "+bulletinTire,10,90);
      }
      
      if(attribueLeTirageAUnVote(bulletinTire, votesA-votesDepouillesA, votesB-votesDepouillesB)=="tirage d'un A"){
        votesDepouillesA += 1;
      }
      else if(attribueLeTirageAUnVote(bulletinTire, votesA-votesDepouillesA, votesB-votesDepouillesB)=="tirage d'un B"){
        votesDepouillesB += 1;
      }

      //println(votesDepouillesA, votesDepouillesB);
      if (votesDepouillesA<votesDepouillesB) {
        candidatAToujoursDevant=false;
      }
    }
    if (candidatAToujoursDevant) {
      nbVrai+=1;
    } else {
      nbFaux+=1;
    }
  }
  println("Pour un pourcentage de "+100*votesA/nbVotes+"% pour "+nbVotes+" votes, le candidat A reste toujours devant à "+100*nbVrai/(nbVrai+nbFaux) +"% de chances.");
}

int tireUnBulletin(int maximum) {
  return (int)Math.ceil(Math.random()*maximum);
}

String attribueLeTirageAUnVote(int numeroBulletin, int nbVotesA, int nbVotesB){
  if(numeroBulletin<=nbVotesA && numeroBulletin>=1){
    return "tirage d'un A";
  }
  else if(numeroBulletin<=nbVotesA+nbVotesB && numeroBulletin>=1){
    return "tirage d'un B";
  }
  else{
    text("Le bulletin ne peut pas être attribué à un vote, sa valeur est de : "+numeroBulletin+" il y a "+nbVotesA+" possibilités de votes A et "+nbVotesB+" possibilités de vote B.",10,120);
    return "erreur";
  }
}