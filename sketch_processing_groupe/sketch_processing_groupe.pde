
/*PImage maison;
  PImage porte;

  PImage camera_toit;
  PImage camera_jardin;
  PImage camera_porte;
  
  PImage herbe;
  PImage téléphone;*/  //ne pas suprimer
  PImage background;
  //volet Volet;
  Login login;
  Bouton boutonOuvrirV=new Bouton(100,100,90,30,"bouton");
  Bouton boutonFermerV=new Bouton(190,100,90,30,"bouton");
  Bouton bouton_tondre=new Bouton(835,835,90,30,"tondre");
  Bouton bouton_pas_tondre=new Bouton(1025,835,90,30,"pas_tondre");
  Tondeuse tondeuse;
  Bouton bouton_login= new Bouton(885,115,100,30,"");
  Bouton bouton_login_tondeuse= new Bouton(1285,1015,100,30,"");
  

public void setup(){
  size(1920,1080);
  surface.setResizable(true);
  /*
  maison=loadImage("maison.png");
  porte=loadImage("porte.png");

  camera_toit=loadImage("camera.png");
  camera_jardin=loadImage("camera2.png");
  camera_porte=loadImage("camera.png");
  
  herbe=loadImage("herbe.png");
  téléphone=loadImage("telephone.png");  */ //ne pas suprimer
  background=loadImage("background.png");
  frameRate(30);
  //Volet= new volet();
  login=new Login(835,100,"1234");
  tondeuse = new Tondeuse();
  bouton_login.couleur=#FFFFFF;
  bouton_login_tondeuse.couleur=#FFFFFF;
}
Temp temp=new Temp();
Eau_et_electricite eau_et_electricite=new Eau_et_electricite();

void draw(){
  /*background(255,255,255);
  image(maison,480,540,maison.width/2,maison.height/2);
  image(porte,545,950,porte.width/2,porte.height/2);
  image(camera_toit,725,530,camera_toit.width/2,camera_toit.height/2);
  image(camera_jardin,825,940,camera_jardin.width/2,camera_jardin.height/2);
  image(camera_porte,535,940,camera_porte.width/2,camera_porte.height/2);
  image(herbe,0,910,herbe.width/2,herbe.height/2);
  image(herbe,300,910,herbe.width/2.25,herbe.height/2);
  image(herbe,835,910,herbe.width/2,herbe.height/2);
  image(herbe,1135,910,herbe.width/2,herbe.height/2);
  image(téléphone,830,45,téléphone.width/2,téléphone.height/2);
  image(téléphone,1150,45,téléphone.width/2,téléphone.height/2);
  image(téléphone,1370,45,téléphone.width/2,téléphone.height/2);*/ //ancien code gaurder ca en aurai besoin si veut refaire l'ariere plant mais garder en com sinon car impacte performance
  image(background,0,0);
  temp.display();
  temp.forward(0,0,1);
  temp.maj_bouton();
  tondeuse.check();
  tondeuse.display();
  tondeuse.login_tondeuse.get_input_from_user();
  login.get_input_from_user();
  login.display();
  //Volet.display();
}

void mouseClicked() {
 if (boutonOuvrirV.selectionne()) {//Volet.ouvrir_volet();
 } 
 if (boutonFermerV.selectionne()) {//Volet.fermer_volet();
 }
 if (bouton_tondre.selectionne()&&tondeuse.guard_tondre()){tondeuse.tondre(1);}
 if(bouton_pas_tondre.selectionne()&&tondeuse.guard_off()){tondeuse.off();}
 if(bouton_login.selectionne()){login.ecrire=true;}
 if(bouton_login_tondeuse.selectionne()){tondeuse.login_tondeuse.ecrire=true;}
}
void mouseReleased(){
  boutonOuvrirV.relache();
  boutonFermerV.relache();
  bouton_pas_tondre.relache();
  bouton_tondre.relache();
  bouton_login.relache();
  bouton_login_tondeuse.relache();
  


}
