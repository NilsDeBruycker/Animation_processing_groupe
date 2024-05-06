class LaveVaisselle {
  PImage imageVideLV;
  PImage imagePleinLV;
  boolean estPleinLV = false;
  boolean estAllumeLV = false;
  
    boolean estEnPauseLV = false;
  int tempsRestantLV = 0; // en minutes

  int xLV;
  int yLV;
  
  Temp heureFinirLV;
  


  LaveVaisselle(String vide, String plein, int x, int y) {
    this.imageVideLV = loadImage("lavevaisselleVide.png");
    this.imagePleinLV = loadImage("lavevaissellePlein (1).png");
    this.xLV = x;
    this.yLV = y;
    heureFinirLV = new Temp();
    
  }

  void afficherLV() {
    if (estPleinLV) {
      image(imagePleinLV, xLV, yLV, imagePleinLV.width/2, imagePleinLV.height/2);
    } else {
      image(imageVideLV, xLV, yLV, imageVideLV.width/2, imageVideLV.height/2);
    }
    if (estAllumeLV) {
      fill(0, 255, 0); // Vert pour allumé
      ellipse(xLV + 50, yLV + 35, 10, 10); // Ajuster la position du rond
    } else {
      fill(255, 0, 0); // Rouge pour éteint
      ellipse(xLV + 50, yLV + 35, 10, 10);
    }
  }

  void togglePleinLV() {
    estPleinLV = !estPleinLV;
  }
  boolean guard_toggle_pleinLV(){if(estAllumeLV){return false;}else return true;}

  void toggleAllumeLV() {
    if ((temps.heure >= 22 || temps.heure < 6 || temps.ferie || temps.jour % 7 == 5 || temps.jour % 7 == 6) && !estAllumeLV && eau_et_electricite.electricite && eau_et_electricite.eau) {
      estAllumeLV = true;
      
      heureFinirLV.jour= temps.jour;
      heureFinirLV.heure=temps.heure;
      heureFinirLV.minute=temps.minute;
      heureFinirLV.forward(0,2,0);
    } else if (estAllumeLV) {
      estAllumeLV = false;
      heureFinirLV.jour=0;
      heureFinirLV.heure=0;
      heureFinirLV.minute=0;
      tempsRestantLV = 0;
    }
  }
  
   boolean guard_toggleLV (){
    //if(!estPlein){return notification}
    return(temps.heure >= 22 || temps.heure < 6) && estPleinLV && !estAllumeLV && login.login  && eau_et_electricite.electricite && eau_et_electricite.eau;
   }
  
   boolean guard_toggle_eteintLV(){return(heureFinirLV.jour<temps.jour||(heureFinirLV.jour==temps.jour&&(heureFinirLV.heure<temps.heure||(heureFinirLV.heure==temps.heure && heureFinirLV.minute<temps.minute))));}
   
    void pauseLV() {
      if (estAllumeLV) {
        estEnPauseLV = true;
        estAllumeLV = false;
        tempsRestantLV = (heureFinirLV.heure-temps.heure)*60 + (heureFinirLV.minute - temps.minute); // Calcul simplifié du temps restant
    }
  }

  void repriseLV() {
    /*if (estEnPause && !estAllume && eau_et_electricite.electricite && eau_et_electricite.eau)*/ 
      estAllumeLV = true;
      estEnPauseLV = false;
      heureFinirLV.heure = temps.heure + (tempsRestantLV)/60;
      heureFinirLV.minute = (temps.minute + tempsRestantLV)%60; // Remettre le temps restant
    
  }
  
  boolean guard_repriseLV(){ return(estEnPauseLV && !estAllumeLV && eau_et_electricite.electricite && eau_et_electricite.eau && tempsRestantLV != 0 && ((temps.heure + (tempsRestantLV)/60)<6 ||((temps.heure + (tempsRestantLV)/60)<6&&(temps.minute + (tempsRestantLV)%60)==0)) || temps.heure>=22);
  }
}
