class volet{
  boolean ouvert;
  int x;
  int y;
  PImage  imvolet;
volet (){
  ouvert=true;
  x=0;
  y=0;
  imvolet=loadImage("volet.png");
  }
  void ouvrir_volet(){
  ouvert=true;}
  void fermer_volet(){
  ouvert=false;x=600;y=600;}
  void display(){
  if (ouvert==false){
    image(imvolet,x-10,y,imvolet.width/2,imvolet.height/2);
    image(imvolet,x+70,y,imvolet.width/2,imvolet.height/2);
    image(imvolet,x+140,y,imvolet.width/2,imvolet.height/2);
    }
  }
  /*public boolean guard_volet(){
    return login;*/
}
