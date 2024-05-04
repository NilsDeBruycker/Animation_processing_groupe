import java.util.Random;
Random rand = new Random();
int randomIndex = int(random(3));
public class intrusion{
  boolean intrusion;
  PImage intrus;
  PImage sirene;
  boolean jard;
  boolean back;
  boolean roof;
  int x_intrus;
  int y_intrus;
  int x_sirene;
  int y_sirene;
  alarm Alarm;
 
  intrusion(){
    intrusion = false;
    jard=false;
    back=false;
    roof=false;
    intrus=loadImage("intrus.png");
    sirene=loadImage("Sirene.png");
    x_intrus=0;
    y_intrus=0;
    x_sirene=0;
    y_sirene=0;
    Alarm=new alarm();
   
  }
  void intru_Jardin_detect(){
    intrusion=true; back=false;
    roof=false;
    jard=true;
    x_intrus=380;
    y_intrus=950;
    x_sirene=720;
    y_sirene=700;
    
}
  void intru_Jardin_non_detect(){
    intrusion=true; back=false;
    roof=false;
    jard=true;
    x_intrus=380;
    y_intrus=950;
    x_sirene=-100;
    y_sirene=-100;
    
}

 void intru_Back_detect(){
   intrusion=true; back=true;
    roof=false;jard=false;
   x_intrus=1000;
   y_intrus=950;x_sirene=720;
    y_sirene=700;
   
}
void intru_Back_non_detect(){
   intrusion=true; back=true;
    roof=false;jard=false;
   x_intrus=1000;
   y_intrus=950;x_sirene=-100;
    y_sirene=-100;
   
}
 void intru_Roof_detect(){
    intrusion=true; back=false;
    roof=true;jard=false;
   x_intrus=590;
   y_intrus=510;
   x_sirene=720;
    y_sirene=700;
   
 }
 void intru_Roof_non_detect(){
    intrusion=true; back=false;
    roof=true;jard=false;
   x_intrus=590;
   y_intrus=510;
   x_sirene=-100;
   y_sirene=-100;
   
 }
 void intru_non_detect(){
   intrusion=true; back=false;
    roof=false;jard=false;
    x_sirene=-100;
    y_sirene=-100;
 }
void display(){
  if (intrusion==true && jard == true && back==false && roof==false){
    image(intrus,x_intrus,y_intrus,intrus.width/2,intrus.height/2);
    image(sirene,x_sirene,y_sirene,sirene.width/2,sirene.height/2);
  }
  if (intrusion ==true  && back==true && jard==false && roof==false){
     image(intrus,x_intrus,y_intrus,intrus.width/2,intrus.height/2);
     image(sirene,x_sirene,y_sirene,sirene.width/2,sirene.height/2);
  }
  if(intrusion==true &&  roof==true && back==false && jard==false){
    image(intrus,x_intrus,y_intrus,intrus.width/2,intrus.height/2);
     image(sirene,x_sirene,y_sirene,sirene.width/2,sirene.height/2);
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
