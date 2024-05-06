public class MachineALaver {
  PImage imageVide;
  PImage imagePlein;
  boolean estPlein = false;
  boolean estAllume = false;
  
  boolean estEnPause = false;
  int tempsRestant = 0; // en minutes

  // Coordonnées de base pour le placement de la machine et des boutons
  int x;
  int y;
  
  /*Temp temp;*/ // Ajout d'une référence à Temp
  Temp heureFinir;

  MachineALaver(String vide, String plein, int x, int y) {
    this.imageVide = loadImage("machinealaverVide-removebg-preview.png");
    this.imagePlein = loadImage("machineàlavpleine-removebg-preview (2).png");
    this.x = x;
    this.y = y;
    heureFinir = new Temp();

    
  }

  void afficher() {
    if (estPlein) {
      image(imagePlein, 575, 885,imagePlein.width/2,imagePlein.height/2);
    } else {
      image(imageVide, 575, 880,imageVide.width/2,imageVide.height/2);
    }
    if (estAllume) {
      fill(0, 255, 0); // Vert pour allumé
      ellipse(x - 600, y + 70, 10, 10); // Ajuster la position du rond
    } else {
      fill(255, 0, 0); // Rouge pour éteint
      ellipse(x - 600, y + 70, 10, 10); // Ajuster la position du rond
    }
  }

  void togglePlein() {
    estPlein = !estPlein;
  }
  boolean guard_toggle_plein(){if(estAllume){return false;}else return true;}

  void toggleAllume() {

    if ((temps.heure >= 22 || temps.heure < 6 || temps.ferie || temps.jour % 7 == 5 || temps.jour % 7 == 6) && !estAllume && eau_et_electricite.electricite && eau_et_electricite.eau) {
      estAllume = true;
      
      heureFinir.jour= temps.jour;
      heureFinir.heure=temps.heure;
      heureFinir.minute=temps.minute;
      heureFinir.forward(0,2,0);
    } else if (estAllume) {
      estAllume = false;
      heureFinir.jour=0;
      heureFinir.heure=0;
      heureFinir.minute=0;
      tempsRestant = 0;
    }
  }
  
  boolean guard_toggle (){
  //if(!estPlein){return notification}
  return(temps.heure >= 22 || temps.heure < 6) && estPlein && !estAllume && login.login && eau_et_electricite.electricite && eau_et_electricite.eau;
  }
  
  boolean guard_toggle_eteint(){return(heureFinir.jour<temps.jour||(heureFinir.jour==temps.jour&&(heureFinir.heure<temps.heure||(heureFinir.heure==temps.heure && heureFinir.minute<temps.minute))));}
 
   void pause() {
    if (estAllume) {
      estEnPause = true;
      estAllume = false;
      tempsRestant = (heureFinir.heure-temps.heure)*60 + (heureFinir.minute - temps.minute); // Calcul simplifié du temps restant
    }
  }

  void reprise() {
    /*if (estEnPause && !estAllume && eau_et_electricite.electricite && eau_et_electricite.eau)*/ 
      estAllume = true;
      estEnPause = false;
      heureFinir.heure = temps.heure + (tempsRestant)/60;
      heureFinir.minute = (temps.minute + tempsRestant)%60; // Remettre le temps restant
    
  }
  
  boolean guard_reprise(){ return(estEnPause && !estAllume && eau_et_electricite.electricite && eau_et_electricite.eau && tempsRestant != 0 && ((temps.heure + (tempsRestant)/60)<6 ||((temps.heure + (tempsRestant)/60)<6&&(temps.minute + (tempsRestant)%60)==0)) || temps.heure>=22);
  }
  
}
