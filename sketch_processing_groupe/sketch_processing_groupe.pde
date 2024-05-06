import java.util.Random;

/*PImage maison;
  PImage porte;

  PImage camera_toit;
  PImage camera_jardin;
  PImage camera_porte;
  
  PImage herbe;
  PImage téléphone;*/  //ne pas suprimer
  PImage background;
  volet Volet;
  Login login;
  alarm Alarm;
  intrusion Intrusion;
  proprio Proprio;
 Bouton boutonOuvrirV=new Bouton(100,100,150,50,"ouvrir");
 Bouton boutonFermerV=new Bouton(300,100,150,50,"Fermer");
 Bouton boutonactivJardin=new Bouton(300,200,150,50,"EnableAlarmJardin");
 Bouton boutonactivPartial=new Bouton(300,300,150,50,"EnableAlarmPartial");
 Bouton boutonactivTotal=new Bouton(300,400,150,50,"EnableAlarm");
 Bouton boutondesactiv=new Bouton(300,500,150,50,"DisableAlarm");
 Bouton boutonIntrujard=new Bouton(300,600,150,50,"IntruJardin");
 Bouton boutonIntruBack=new Bouton(300,650,150,50,"IntruBack");
 Bouton boutonIntruroof=new Bouton(300,700,150,50,"IntruRoof");
 Bouton boutonProrioGoH=new Bouton(300,750,150,50,"GoHome");
 Bouton boutonProrioGoA=new Bouton(300,800,150,50,"GoAway");
 Bouton boutonActivSirene=new Bouton(300,850,150,50,"desactiveSirene");
 Bouton boutonActivDesactivSirene=new Bouton(300,900,150,50,"DEdesActiveSirene");
 
public void setup(){
size(1920,1080);
//surface.setResizable(true);
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
  Volet= new volet();
  login=new Login();
  Alarm= new alarm();
  Intrusion=new intrusion();
  Proprio=new proprio();
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
  temp.slow_forward();
  temp.maj_bouton();
  Volet.display();
  Alarm.display();
  Intrusion.display();
  Proprio.display();
}

void mouseClicked() {
 if (boutonOuvrirV.selectionne()&& Alarm.isTotal()) {
    Volet.ouvrir_volet();
  } if (boutonFermerV.selectionne()) {
    Volet.fermer_volet();
  }
  if(boutonactivJardin.selectionne()){
    Alarm.activateJardin();
  }
   if(boutonactivPartial.selectionne()){
    Alarm.activatePartial();
  }
   if(boutonactivTotal.selectionne()){
    Alarm.activateTotal();
  }
   if(boutondesactiv.selectionne()){
    Alarm.turnOff();
  }
    if(boutonProrioGoH.selectionne()){
      Proprio.go_home();
  }
     if(boutonProrioGoA.selectionne()){
    Proprio.go_away();
  }
  if (boutonIntrujard.selectionne()&& (Alarm.isJardin()|| Alarm.isPartial()|| Alarm.isTotal()) ){
    Intrusion.intru_Jardin_detect();
  }else if(boutonIntrujard.selectionne() && (!Alarm.isJardin()|| !Alarm.isPartial() || !Alarm.isTotal())){
    Intrusion.intru_Jardin_non_detect();}
  if(boutonIntruBack.selectionne() && (Alarm.isPartial() || Alarm.isTotal() ) ){
    Intrusion.intru_Back_detect();
  }else if(boutonIntruBack.selectionne()&& (!Alarm.isPartial()|| !Alarm.isTotal())){
    Intrusion.intru_Back_non_detect();}
  if(boutonIntruroof.selectionne()&& Alarm.isTotal()){
  Intrusion.intru_Roof_detect();
  }else if(boutonIntruroof.selectionne()&& !Alarm.isTotal()){
    Intrusion.intru_Roof_non_detect();}
  if((boutonIntrujard.selectionne() || boutonIntruBack.selectionne() || boutonIntruroof.selectionne()) &&(!Alarm.isPartial()&& !Alarm.isTotal() && !Alarm.isJardin())){
    Intrusion.intru_non_detect();
  }
  if( boutonActivSirene.selectionne()){
    Intrusion.desactiv_siren();
  }
  if(  boutonActivDesactivSirene.selectionne()){
    Intrusion.reactiv_siren();
  }
}
void mouseReleased(){
  boutonOuvrirV.relache();
  boutonFermerV.relache();
  boutonactivJardin.relache();
  boutonactivPartial.relache();
  boutonactivTotal.relache();
  boutondesactiv.relache();
  boutonIntrujard.relache();
  boutonIntruBack.relache();
  boutonIntruroof.relache();
  boutonProrioGoA.relache();
  boutonProrioGoH.relache();
  boutonActivSirene.relache();
  boutonActivDesactivSirene.relache();
}
