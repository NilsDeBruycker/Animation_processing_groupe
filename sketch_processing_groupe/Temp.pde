public class Temp {
  int jour;
  int heure;
  int minute;
  int compteur;
  
  boolean ferie;
  

  Temp() {
    jour = 0;
    heure = 0;
    minute = 0;
    compteur = 0;
    ferie=false;
  }

  void forward(int jour_en_plus, int heure_en_plus, int minute_en_plus) {
    jour = jour + jour_en_plus + (heure + heure_en_plus + (minute + minute_en_plus) / 60) / 24;
    heure = (heure + heure_en_plus + (minute + minute_en_plus) / 60) % 24;
    minute = (minute + minute_en_plus) % 60;
  }

  void slow_forward() {
    if (compteur < 30) {
      compteur += 1;
    } else {
      compteur = 0;
      forward(0, 0, 1);
    }
  }

  void display() {
    fill(0, 280, 180);
    textAlign(CENTER, CENTER);
    textSize(16);

    String timeLabel = nf(heure, 2) + ":" + nf(minute, 2) + ":" + nf(int(compteur), 2);

    text(timeLabel, 950, 106); // Position ajustée pour l'affichage de l'heure
    
    if (ferie){text("est férié",150,210);}
    else{text("est non férié",150,210);}
    
  }
  
  void ferie_on(){ferie=true;}
  void ferie_off(){ferie=false;}
  
  void maj_bouton(){
  fermerVoletButton.maj_souris();
  //boutonFermerV.majcouleur(guard_volet());
  fermerVoletButton.affiche();
  ouvrirVoletButton.maj_souris();
  ouvrirVoletButton.affiche();
  //boutonFermerV.majcouleur(guard_volet());
  ouvrirVoletButton.maj_souris();
  enableAlarmJardinButton.maj_souris();
  enableAlarmPartialButton.maj_souris();
  enableAlarmTotalButton.maj_souris();
  disableAlarmButton.maj_souris();
  intruJardinButton.maj_souris();
  intruBackButton.maj_souris();
  intruRoofButton.maj_souris();
  enableAlarmJardinButton.affiche();
  enableAlarmPartialButton.affiche();
  enableAlarmTotalButton.affiche();
  disableAlarmButton.affiche();
  intruJardinButton.affiche();
  intruBackButton.affiche();
  intruRoofButton.affiche();
  go_away.affiche();
  go_home.affiche();
   go_away.maj_souris();
  go_home.maj_souris();
  
  metre_ferie_on.maj_souris();
  metre_ferie_on.affiche();
  
  metre_ferie_off.maj_souris();
  metre_ferie_off.affiche();
  
  bouton_pas_tondre.maj_souris();
  bouton_pas_tondre.majcouleur(tondeuse.guard_off());
  bouton_pas_tondre.affiche();
  
  bouton_tondre.maj_souris();
  bouton_tondre.majcouleur(tondeuse.guard_tondre());
  bouton_tondre.affiche();
  
  bouton_login.maj_souris();
  bouton_login.affiche();
  
  bouton_login_tondeuse.maj_souris();
  bouton_login_tondeuse.affiche();
  
  }
}
