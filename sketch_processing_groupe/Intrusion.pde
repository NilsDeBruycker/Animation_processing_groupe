import java.util.Random;
Random rand = new Random();
int randomIndex = int(random(3));


public class intrusion{
  boolean intrusion;
  boolean desactiv_sirene;
  PImage intrus;
  PImage sirene;
  boolean jard;
  boolean back;
  boolean roof;
  int x_intrus;
  int y_intrus;
  int x_sirene;
  int y_sirene;
  boolean intrudetect;
   proprio propri;
   
   
  void check(){}
 
  intrusion(){
    intrusion = false;
    desactiv_sirene=false;
    jard=false;
    back=false;
    roof=false;
    intrus=loadImage("intrus.png");
    sirene=loadImage("Sirene.png");
    x_intrus=0;
    y_intrus=0;
    x_sirene=720;
    y_sirene=700;
   propri=new proprio();
   intrudetect = false;
  }
  void intru_Jardin_detect(){
    intrusion=true; back=false;
    roof=false;
    jard=true;
    intrudetect = false;
    x_intrus=380;
    y_intrus=950;
    
    
}
 

 void intru_Back_detect(){
   intrusion=true; back=true;
    roof=false;jard=false; intrudetect = false;
   x_intrus=1000;
   y_intrus=950;
   
}

 void intru_Roof_detect(){
    intrusion=true; back=false;
    roof=true;jard=false;intrudetect = false;
   x_intrus=590;
   y_intrus=510;
   
   
 }

 void intru_non_detect(){
   intrusion=true; back=false;
    roof=false;jard=false;
 }
 boolean guard_desactiv_siren(){return propri.is_here();}
 
 void desactiv_siren(){
   desactiv_sirene=true;}
void reactiv_siren(){
  desactiv_sirene=false;
}
void display(){
  if (intrusion==true && jard == true && back==false && roof==false){
    image(intrus,x_intrus,y_intrus,intrus.width/2,intrus.height/2);
    if(!desactiv_sirene && (alarme.total || alarme.partial || alarme.jardin)){
    image(sirene,x_sirene,y_sirene,sirene.width/2,sirene.height/2);
  }
    if (!intrudetect){ 
     notification = "Intru detectee sur le jardin"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification 
    intrudetect = true;
    message.register_new_intrusion();
     }
    if(!intrusion && !jard ) {
      showNotification = false;
    }
}
  if (intrusion ==true  && back==true && jard==false && roof==false){
     image(intrus,x_intrus,y_intrus,intrus.width/2,intrus.height/2);
     if(!desactiv_sirene && (alarme.total || alarme.partial)){
     image(sirene,x_sirene,y_sirene,sirene.width/2,sirene.height/2);
  }
     if (!intrudetect){ 
     notification = "Intru detectee sur la venue "; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification 
    intrudetect = true;
    message.register_new_intrusion();
     }
    if(!intrusion && !back) {
      showNotification = false;
    }
}
  if(intrusion==true &&  roof==true && back==false && jard==false){
    image(intrus,x_intrus,y_intrus,intrus.width/2,intrus.height/2);
    if(!desactiv_sirene&& alarme.total){
     image(sirene,x_sirene,y_sirene,sirene.width/2,sirene.height/2);
     
     
     if (!intrudetect){ 
     notification = "Intru detectee sur le toit"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification 
    intrudetect = true;
    message.register_new_intrusion();
     }
    if(!intrusion &&  !roof) {
      showNotification = false;
    }
 }
}
if (intrusion == true && roof == false && back == false && jard == false) {
  
  
  if (randomIndex == 0) {
    image(intrus, 380, 950, intrus.width/2, intrus.height/2);
  } else if (randomIndex == 1) {
    image(intrus, 1000, 950, intrus.width/2, intrus.height/2);
  } else if (randomIndex == 2) {
    image(intrus, 590, 510, intrus.width/2, intrus.height/2);
  }
}
}
}
