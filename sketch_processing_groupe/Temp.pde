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
    if (message.guard_refresh())
      {message.refresh();}
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
  
  bouton_tondre2.maj_souris();
  bouton_tondre2.majcouleur(tondeuse.guard_tondre());
  bouton_tondre2.affiche();
  
  bouton_tondre3.maj_souris();
  bouton_tondre3.majcouleur(tondeuse.guard_tondre());
  bouton_tondre3.affiche();
  
  bouton_login.maj_souris();
  bouton_login.affiche();
  
  bouton_login_tondeuse.maj_souris();
  bouton_login_tondeuse.affiche();
  
  bouton_meteo_soleil.maj_souris() ;
  bouton_meteo_soleil.affiche() ;
  
  bouton_meteo_pluie.maj_souris() ;
  bouton_meteo_pluie.affiche() ;
  
  // Gestion des boutons pour le lave-vaisselle
  allumerLV.maj_souris();
  //allumerLV.majcouleur(tondeuse.guard_off());
  allumerLV.affiche();
  ÉteindreLV.maj_souris();
  ÉteindreLV.affiche();
  RemplirLV.maj_souris();
  RemplirLV.affiche();
  ViderLV.maj_souris();
  ViderLV.affiche();
  RepriseLV.maj_souris();
  RepriseLV.affiche();
  
  // Gestion des boutons pour la machine à laver
  Allumer.maj_souris();
  Allumer.affiche();
  Éteindre.maj_souris();
  Éteindre.affiche();
  Remplir.maj_souris();
  Remplir.affiche();
  Vider.maj_souris();
  Vider.affiche();
  Reprise.maj_souris();
  Reprise.affiche();
  
  // Gestion des boutons pour le séche linge
  AllumerSL.maj_souris();
  AllumerSL.affiche();
  ÉteindreSL.maj_souris();
  ÉteindreSL.affiche();
  RemplirSL.maj_souris();
  RemplirSL.affiche();
  ViderSL.maj_souris();
  ViderSL.affiche();
  RepriseSL.maj_souris();
  RepriseSL.affiche();
  
  turn_on.maj_souris() ;
  turn_on.affiche() ;
  turn_off.maj_souris() ;
  turn_off.affiche() ;
  
  
  commandeLV.maj_souris();
  commandeLV.affiche();
  
  commandeML.maj_souris();
  commandeML.affiche();
  
  commandeSL.maj_souris();
  commandeSL.affiche();
  
  tondeuse_avance_1h.maj_souris();
  tondeuse_avance_5min.maj_souris();
  tondeuse_recule_1h.maj_souris();
  tondeuse_recule_5min.maj_souris();
  tondeuse_avance_1min.maj_souris();
  tondeuse_recule_1min.maj_souris();
  clear_message.maj_souris();
  send_message.maj_souris();
  
  tondeuse_avance_1h.affiche();
  tondeuse_avance_5min.affiche();
  tondeuse_recule_1h.affiche();
  tondeuse_recule_5min.affiche();
  tondeuse_avance_1min.affiche();
  tondeuse_recule_1min.affiche();
  clear_message.affiche();
  send_message.affiche();
  
  }
}
