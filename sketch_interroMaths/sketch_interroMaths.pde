String[] questions = {"cos 30","cos 45","cos 60","sin 30","sin 45","sin 60","tan 30","tan 45","tan 60"};
String[] reponses = {"racine de 3/2","racine de 2/2","1/2","1/2","racine de 2/2","racine de 3/2","racine de 3/3","1","racine de 3"};
int[] numeroQuestion = new int[20];

void setup(){
  size(700,700);
  frameRate(0.5);
}

void draw(){
  if(frameCount==20)noLoop();
  background(255);
  fill(0);
  numeroQuestion[frameCount-1]=(int)random(0,9);
  text(questions[numeroQuestion[frameCount-1]], 10, 20);
  if(frameCount==20){
    for(int i=0 ; i<20 ; i++){
      text(reponses[numeroQuestion[i]], 10, i*20);
    }
  }
  //questions[(int)random(0,9)]
}