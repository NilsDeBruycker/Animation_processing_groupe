class SecheLinge {
    PImage secheLingeVide;
    PImage secheLingePlein;
    boolean secheLingeEstPlein = false; 
    boolean secheLingeEstAllume = false; 
    
    boolean estEnPauseSL = false;
    int tempsRestantSL = 0; // en minutes

    int posXSL; // Position X du sèche-linge
    int posYSL; // Position Y du sèche-linge
    Temp heureFinirSL;
    

    SecheLinge(String vide, String plein, int x, int y) {
        this.secheLingeVide = loadImage(vide);
        this.secheLingePlein = loadImage(plein);
        this.posXSL = x;
        this.posYSL = y;
        heureFinirSL = new Temp();
        
    }

    void afficherSL() {
        if (secheLingeEstPlein) {
            image(secheLingePlein, posXSL, posYSL, secheLingePlein.width/2, secheLingePlein.height/2);
        } else {
            image(secheLingeVide, posXSL, posYSL, secheLingeVide.width/2, secheLingeVide.height/2);
        }
        if (secheLingeEstAllume) {
            fill(0, 255, 0); // Vert pour allumé
            ellipse(posXSL + 55, posYSL + 10, 10, 10); // Ajuster la position du rond
        } else {
            fill(255, 0, 0); // Rouge pour éteint
            ellipse(posXSL + 55, posYSL + 10, 10, 10);
        }
    }

    void togglePleinSL() {
        secheLingeEstPlein = !secheLingeEstPlein;
    }
    boolean guard_toggle_pleinSL(){if(secheLingeEstAllume){return false;}else return true;}

    void toggleAllumeSL() {
      if ((temps.heure >= 22 || temps.heure < 6 || temps.ferie || temps.jour % 7 == 5 || temps.jour % 7 == 6) && !secheLingeEstAllume && eau_et_electricite.electricite && eau_et_electricite.eau) {
        secheLingeEstAllume = true;
      
        heureFinirSL.jour= temps.jour;
        heureFinirSL.heure=temps.heure;
        heureFinirSL.minute=temps.minute;
        heureFinirSL.forward(0,2,0);
      } else if (secheLingeEstAllume) {
        secheLingeEstAllume = false;
        heureFinirSL.jour=0;
        heureFinirSL.heure=0;
        heureFinirSL.minute=0;
        tempsRestantSL = 0;
      }
    }
    boolean guard_toggleSL (){
    //if(!estPlein){return notification}
      return(temps.heure >= 22 || temps.heure < 6) && secheLingeEstPlein && !secheLingeEstAllume && login.login && eau_et_electricite.electricite && eau_et_electricite.eau;
    }
  
    boolean guard_toggle_eteintSL(){return(heureFinirSL.jour<temps.jour||(heureFinirSL.jour==temps.jour&&(heureFinirSL.heure<temps.heure||(heureFinirSL.heure==temps.heure && heureFinirSL.minute<temps.minute))));}
    
    void pauseSL() {
      if (secheLingeEstAllume) {
        estEnPauseSL = true;
        secheLingeEstAllume = false;
        tempsRestantSL = (heureFinirSL.heure-temps.heure)*60 + (heureFinirSL.minute - temps.minute); // Calcul simplifié du temps restant
    }
  }

  void repriseSL() {
    /*if (estEnPause && !estAllume && eau_et_electricite.electricite && eau_et_electricite.eau)*/ 
      secheLingeEstAllume = true;
      estEnPauseSL = false;
      heureFinirSL.heure = temps.heure + (tempsRestantSL)/60;
      heureFinirSL.minute = (temps.minute + tempsRestantSL)%60; // Remettre le temps restant
    
  }
  
  boolean guard_repriseSL(){ return(estEnPauseSL && !secheLingeEstAllume && eau_et_electricite.electricite && eau_et_electricite.eau && tempsRestantSL != 0 && ((temps.heure + (tempsRestantSL)/60)<6 ||((temps.heure + (tempsRestantSL)/60)<6&&(temps.minute + (tempsRestantSL)%60)==0)) || temps.heure>=22);
  }
}
