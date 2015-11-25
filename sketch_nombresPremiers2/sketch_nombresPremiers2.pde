int[] nbPremiers = {2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,
113,127,131,137,139,149,151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,
233,239,241,251,257,263,269,271,277,281,283,293,307,311,313,317,331,337,347,349,353,
359,367,373,379,383,389,397,401,409,419,421,431,433,439,443,449,457,461,463,467,479,
487,491,499,503,509,521,523,541,547,557,563,569,571,577,587,593,599,601,607,613,617,
619,631,641,643,647,653,659,661,673,677,683,691};
int[] couleursPixels = new int[700*700];
int vitesse=7;

void setup(){
  background(0);
  size(700,700);
}

void draw(){
  frameRate(vitesse);
  for(int y=0 ; y<height ; y++){
    for(int x=0 ; x<width ; x++){
      int n=y*width+x;
      int id=(int)Math.ceil(random(nbPremiers.length))-1;
      if(id==-1)id=0;
      int nbPremier=nbPremiers[id];
      //color noir=color(0,0,0);
      if(n%nbPremier==0){
        couleursPixels[y*width+x]+=1;
        set(x,y,couleursPixels[y*width+x]);
       }
      //else{
      //  set(x,y,noir);
      //}
      
      ////if(n%7==0) vert+=50;
      //if(n%11==0 && n%13==0) vert+=100;
      ////if(n%13==0) bleu+=50;
      //color currentCouleur=color(rouge,vert,bleu);
      //set(x,y,currentCouleur);
    }
  }
}