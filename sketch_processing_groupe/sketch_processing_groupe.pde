import processing.core.PApplet;
import processing.core.PImage;

Messages message=new Messages();
boolean show_text_to_comp=false;
int y2;
PImage background;
boolean phone_on=false;
Temp temps;
String message_to_companny="";
boolean text_tocompany=false;
MachineALaver machineALaver;
SecheLinge secheLinge;
LaveVaisselle laveVaisselle;
boolean text_sent_tocompany=false;
Bouton addHourButton;
Bouton addMinuteButton;
Bouton addSixHoursButton;
Bouton crashEauButton;
Bouton crashElectriciteButton;
Bouton grosCrashElectriciteButton;
Bouton restoreEauButton;
Bouton restoreElectriciteButton;
Bouton confirmNotificationButton; // Bouton de confirmation de la notification

Bouton turn_on=new Bouton(400,300,90,100,"tel on");
Bouton turn_off=new Bouton(400,390,90,100,"tel off");

Bouton ouvrirVoletButton; // Nouveau bouton pour ouvrir les volets
Bouton fermerVoletButton; // Nouveau bouton pour fermer les volets

Bouton enableAlarmJardinButton; // Bouton pour activer l'alarme du jardin
Bouton enableAlarmPartialButton; // Bouton pour activer l'alarme partielle
Bouton enableAlarmTotalButton; // Bouton pour activer l'alarme totale
Bouton disableAlarmButton; // Bouton pour désactiver l'alarme
Bouton intruJardinButton; // Bouton pour simuler une intrusion dans le jardin
Bouton intruBackButton; // Bouton pour simuler une intrusion à l'arrière
Bouton intruRoofButton; // Bouton pour simuler une intrusion sur le toit

Bouton go_away;
Bouton go_home;
Bouton commandeLV= new Bouton(1360,421,75,30,"laver la vaisselle");
Bouton commandeML= new Bouton(1439,421,75,30,"laver le linge");
Bouton commandeSL= new Bouton(1400,451,75,30,"secher le linge");
Eau_et_electricite eau_et_electricite;
volet volet; // Instance de la classe volet
alarm alarme; // Instance de la classe alarme
intrusion intrusion; // Instance de la classe intrusion
Bouton Desactive_sirene = new Bouton(1368, 352, 95, 30, "Desactiver la sirene");
Bouton tondeuse_avance_1h = new Bouton(1225,905,90,30,"horaire soir +1h");
Bouton tondeuse_avance_5min = new Bouton(1225,875,90,30,"horaire soir +5min");
Bouton tondeuse_recule_1h = new Bouton(1305,905,90,30,"horaire matin -1h");
Bouton tondeuse_recule_5min = new Bouton(1305,875,90,30,"horaire matin-5min");
Bouton tondeuse_avance_1min = new Bouton(1395,905,90,30,"horaire soir+1min");
Bouton tondeuse_recule_1min = new Bouton(1395,875,90,30,"horaire matin-1min");
Bouton clear_message = new Bouton(610,286,90,30,"confirmer messages");
Bouton send_message = new Bouton(610,316,90,30,"nouveau message");


proprio prop; 
Login login;

Bouton bouton_tondre=new Bouton(1035,935,90,30,"tondreh1");
Bouton bouton_tondre2=new Bouton(1035,905,90,30,"tondreh2");
Bouton bouton_tondre3=new Bouton(1035,875,90,30,"tondreh3");
Bouton bouton_pas_tondre=new Bouton(1225,935,90,30,"pas_tondre");
Tondeuse tondeuse;
Bouton bouton_login_tondeuse= new Bouton(1618,360,100,30,"Login tond");

Bouton bouton_meteo_soleil= new Bouton(70,150,90,30,"bonne meteo");
Bouton bouton_meteo_pluie=new Bouton(170,150,90,30,"mauvaise meteo");


ArrayList<String> notifications = new ArrayList<String>();
boolean showNotification = true; // Indique si la notification doit être affichée

Bouton metre_ferie_on=new Bouton(1020,105,90,30,"jour ferier");
Bouton metre_ferie_off=new Bouton(1129,105,110,30,"jour non ferier");
Bouton bouton_login= new Bouton(1620,215,100,30,"");



// Boutons pour le lave-vaisselle
Bouton allumerLV = new Bouton(1000, 764, 90, 30,"allumerLV") ;
Bouton ÉteindreLV = new Bouton(1000, 796, 90 ,30,"ÉteindreLV");
Bouton RemplirLV = new Bouton (1000, 732, 90, 30,"RemplirLV");
Bouton ViderLV = new Bouton (1000, 700, 90, 30,"ViderLV");
Bouton RepriseLV = new Bouton (1000, 828, 90, 30,"RepriseLV");
// Boutons pour la machine à laver
Bouton Allumer = new Bouton(475, 884, 90, 30,"Allumer") ;
Bouton Éteindre = new Bouton(475, 916, 90, 30,"Éteindre") ;
Bouton Remplir = new Bouton(475, 852, 90, 30,"Remplir") ;
Bouton Vider = new Bouton(475, 820, 90, 30,"Vider") ;
Bouton Reprise = new Bouton(475, 948, 90, 30,"Reprise");
// Boutons pour le sèche-linge
Bouton AllumerSL = new Bouton(890, 878, 90, 30,"AllumerSL") ;
Bouton ÉteindreSL = new Bouton(890, 910, 90, 30,"ÉteindreSL") ;
Bouton RemplirSL = new Bouton(890, 846, 90, 30,"RemplirSL") ;
Bouton ViderSL = new Bouton(890, 814, 90, 30,"ViderSL") ;
Bouton RepriseSL = new Bouton(890, 942, 90, 30,"RepriseSL") ;
  

void setup() {
  size(1920, 1080);
  background = loadImage("background.png");

  temps = new Temp();
  
  addHourButton = new Bouton(1040, 210, 75, 30, "Add 1 Hour");
  addMinuteButton = new Bouton(1120, 210, 75, 30, "Add 1 Minute");
  addSixHoursButton = new Bouton(1040, 240, 75, 30, "Add 6 Hours");
  
  crashEauButton = new Bouton(1040, 310, 75, 30, "Crash Eau");
  crashElectriciteButton = new Bouton(1120, 310, 75, 30, "Crash Electricite");
  grosCrashElectriciteButton = new Bouton(1080, 275, 100, 30, "Gros Crash Electricite");
  restoreEauButton = new Bouton(1130, 350, 67, 30, "Restore Eau");
  restoreElectriciteButton = new Bouton(1046, 350, 95, 30, "Restore Electricite");
 
  // Bouton de confirmation de notification
  confirmNotificationButton = new Bouton(865, 170, 75, 30, "Confirm");
  
  // Initialisation de l'objet Eau_et_electricite
  eau_et_electricite = new Eau_et_electricite();
  
  // Initialisation de l'objet volet
  volet = new volet();
  
  // Création des boutons pour ouvrir et fermer les volets
  ouvrirVoletButton = new Bouton(1360, 390, 75, 30, "Ouvrir Volet");
  fermerVoletButton = new Bouton(1439, 390, 75, 30, "Fermer Volet");
  
  // Création des boutons pour gérer l'alarme
  enableAlarmJardinButton = new Bouton(1368, 250, 95, 30, "Enable Alarm Jardin");
  enableAlarmPartialButton = new Bouton(1368, 320, 95, 30, "Enable Alarm Partial");
  enableAlarmTotalButton = new Bouton(1368, 285, 95, 30, "Enable Alarm Total");
  disableAlarmButton = new Bouton(1439, 215, 75, 30, "Disable Alarm");
  
  // Création des boutons pour simuler des intrusions
  intruJardinButton = new Bouton(1359, 180, 75, 30, "Intru Jardin");
  intruBackButton = new Bouton(1359, 215, 75, 30, "Intru Back");
  intruRoofButton = new Bouton(1439, 180, 75, 30, "Intru Roof");
  
  
  go_away = new Bouton(1040, 389, 75, 30, "Prop AWAY ");
  go_home = new Bouton(1120, 389, 75, 30, "Prop HOME ");
  
  
  
  // Initialisation de l'objet alarme
  alarme = new alarm();
  
  // Initialisation de l'objet intrusion
  intrusion = new intrusion();
  
  prop = new proprio();
  
  login=new Login(1570,200,"1234");
  
  
  tondeuse = new Tondeuse();
  
  secheLinge = new SecheLinge("séchelingeVide (1).png", "séchelingePlein (1).png", 750, 885);
  machineALaver = new MachineALaver("machineàlaverVide-removebg-preview.png", "machineàlavpleine-removebg-preview (2).png", 1200, 820);
  laveVaisselle = new LaveVaisselle("lavevaisselleVide.png", "lavevaissellePlein (1).png", 750, 793);
  
  bouton_login.couleur=#FFFFFF;
  bouton_login_tondeuse.couleur=#FFFFFF;
  

  
}

void draw() {
  image(background, 0, 0);
  temps.maj_bouton();

  temps.slow_forward();

  addHourButton.affiche();
  addMinuteButton.affiche();
  addSixHoursButton.affiche();
  
  crashEauButton.affiche();
  crashElectriciteButton.affiche();
  grosCrashElectriciteButton.affiche();
  restoreEauButton.affiche();
  restoreElectriciteButton.affiche();
  
  Desactive_sirene.affiche();
  
  
  go_away.affiche();
  go_home.affiche();
  tondeuse.auto();
  tondeuse.check();
  tondeuse.display();
  text("Login",1620,170);
  text("Login tondeuse",1618,320);
  text("Notifications : ",860,465);
  textSize(15);
  text("Service de gardiennage :  ",640,180);
  tondeuse.login_tondeuse.get_input_from_user();
  login.get_input_from_user();
  login.display();
  
  
  secheLinge.afficherSL();
  machineALaver.afficher();
  laveVaisselle.afficherLV();
  
  
  
  
  // Afficher la notification si showNotification est vrai
  if (showNotification) {
    drawNotifications();
  }
  
  
  // Afficher le bouton de confirmation uniquement si une notification est présente
  if (!notifications.isEmpty()) {
  confirmNotificationButton.affiche();
  }
  
  drawTime(); // Appel de la fonction drawTime pour afficher l'heure
  
  
  // Affichage des boutons pour ouvrir et fermer les volets
  ouvrirVoletButton.affiche();
  fermerVoletButton.affiche();
  
  // Affichage des boutons pour gérer l'alarme
  enableAlarmJardinButton.affiche();
  enableAlarmPartialButton.affiche();
  enableAlarmTotalButton.affiche();
  disableAlarmButton.affiche();
  
  // Affichage des boutons pour simuler des intrusions
  intruJardinButton.affiche();
  intruBackButton.affiche();
  intruRoofButton.affiche();
  
  // Affichage des volets
  volet.display();
  
  // Affichage de l'alarme
  alarme.display();
  
  // Affichage de l'intrusion
  intrusion.display();
  // diplay eau eet elec
  eau_et_electricite.display();
  
  
  prop.display();
  y2=220;
  for (String messag : message.messages){
     fill(0);
     textSize(10);
    text(messag, 7100, y2);
   }
     if (keyPressed && text_tocompany){
     if (key==BACKSPACE){if (message_to_companny.length()>0) {
        message_to_companny=message_to_companny.substring(0, message_to_companny.length()-1);} }
     else if (key==ENTER || key==RETURN){text_tocompany=false;}
     else{message_to_companny=message_to_companny+key;}
     text_sent_tocompany=true;
     }
     if (text_tocompany){fill(0);
     textSize(10);
     text("voulez vous prendre contact\n avec la firme de gardiennage\n veuiller fournir par texto votre adresse et\n lad dater et heure de l'instrusion",630,400);}
     
     
     if (show_text_to_comp){
     fill(0);
     textSize(10);
     text("voulez vous prendre contact\n avec la firme de gardiennage\n veuiller fournir par texto votre adresse et\n lad dater et heure de l'instrusion",630,400);}
  
  if (text_sent_tocompany==true){
    fill(0);
    textSize(10);
    text("voulez vous prendre contact\n avec la firme de gardiennage\n veuiller fournir par texto votre adresse et\n lad dater et heure de l'instrusion",630,400);
    text(message_to_companny,630,450);
    }
  
  
  if(!phone_on){
  rectMode(CORNER);
  fill(0,0,0);
  rect(558,144,164,340,10,10,10,10);
  rect(778,144,164,340,10,10,10,10);
  rect(998,144,164,340,10,10,10,10);
  rect(1318,144,164,340,10,10,10,10);
  rect(1538,144,164,340,10,10,10,10);}
  textSize(15);
}  

String notification;

void mousePressed() {
  if (addHourButton.selectionne()) {
    notification="1 hour added"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  if (addMinuteButton.selectionne()) {
    notification = "1 minute added"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  if (addSixHoursButton.selectionne()) {
    notification = "6 hours added"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  if (crashEauButton.selectionne()) {
    eau_et_electricite.crash_eau(); // Exécute la fonction de crash de l'eau
    notification = "Crash Eau";
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  if (crashElectriciteButton.selectionne()) {
    eau_et_electricite.crash_electricite(); // Exécute la fonction de crash de l'électricité
    notification = "Crash Electricite";
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  if (grosCrashElectriciteButton.selectionne()&&eau_et_electricite.guard_big_crash()) {
    eau_et_electricite.gros_crash_electricite(); // Exécute la fonction de gros crash de l'électricité
    notification = "Gros Crash Electricite";
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  if (restoreEauButton.selectionne()) {
    eau_et_electricite.restore_eau(); // Exécute la fonction de restauration de l'eau
    notification = "Restore Eau";
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  if (restoreElectriciteButton.selectionne()) {
    eau_et_electricite.restore_electricite(); // Exécute la fonction de restauration de l'électricité
    notification = "Restore Electricite";
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton de confirmation est sélectionné
  if (confirmNotificationButton.selectionne() && !notifications.isEmpty()) {
    if (notifications.size() == 1){
      notifications.set(0, " ");
    }
    else {
      // Supprime le premier élément de la liste notifications
      notifications.remove(notifications.size() - 1);
    }
}


  
  // Vérifie si le bouton pour ouvrir les volets est sélectionné
  if (ouvrirVoletButton.selectionne() && volet.guard_volet()) {
    volet.ouvrir_volet(); // Appel de la méthode pour ouvrir les volets
    notification = "Volets ouverts"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton pour fermer les volets est sélectionné
  if (fermerVoletButton.selectionne() && login.login) {
    volet.fermer_volet(); // Appel de la méthode pour fermer les volets
    notification = "Volets fermés"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton pour activer l'alarme du jardin est sélectionné
  if (enableAlarmJardinButton.selectionne()) {
    alarme.activateJardin(); // Appel de la méthode pour activer l'alarme du jardin
    notification = "Alarme Jardin activée"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton pour activer l'alarme partielle est sélectionné
  if (enableAlarmPartialButton.selectionne()) {
    alarme.activatePartial(); // Appel de la méthode pour activer l'alarme partielle
    notification = "Alarme Partielle activée"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton pour activer l'alarme totale est sélectionné
  if (enableAlarmTotalButton.selectionne()) {
    alarme.activateTotal(); // Appel de la méthode pour activer l'alarme totale
    notification = "Alarme Totale activée"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
    volet.fermer_volet();
  }
  
  // Vérifie si le bouton pour désactiver l'alarme est sélectionné
  if (disableAlarmButton.selectionne()) {
    alarme.turnOff(); // Appel de la méthode pour désactiver l'alarme
    notification = "Alarme désactivée"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton pour simuler une intrusion dans le jardin est sélectionné
  if (intruJardinButton.selectionne()) {
    intrusion.intru_Jardin_detect(); // Appel de la méthode pour simuler une intrusion dans le jardin
  }
  
  // Vérifie si le bouton pour simuler une intrusion à l'arrière est sélectionné
  if (intruBackButton.selectionne()) {
    intrusion.intru_Back_detect(); // Appel de la méthode pour simuler une intrusion à l'arrière
  }
  
  // Vérifie si le bouton pour simuler une intrusion sur le toit est sélectionné
  if (intruRoofButton.selectionne()) {
    intrusion.intru_Roof_detect(); // Appel de la méthode pour simuler une intrusion sur le toit
    
  }
  
  if (go_home.selectionne()) {
    prop.go_home(); // Appel de la méthode pour simuler une intrusion sur le toit
    notification = "Prop at home"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  if (go_away.selectionne()) {
    prop.go_away(); // Appel de la méthode pour simuler une intrusion sur le toit
    notification = "Prop away"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  if(metre_ferie_on.selectionne()){
    temps.ferie=true;
    notification = "Jour ferié activé"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  
 if(metre_ferie_off.selectionne()){
   temps.ferie=false;
   notification = "Jour ferié désactivé"; // Met à jour la notification
   notifications.add(notification);
   showNotification = true; // Réactive l'affichage de la notification
 }
 
 if (bouton_tondre.selectionne() && tondeuse.guard_tondre()) {
   tondeuse.tondre(1);
   notification = "Tonte lancée"; // Met à jour la notification
   notifications.add(notification);
   showNotification = true; // Réactive l'affichage de la notification
 }
 if (bouton_tondre2.selectionne() && tondeuse.guard_tondre()) {
   tondeuse.tondre(2);
   notification = "Tonte lancée"; // Met à jour la notification
   notifications.add(notification);
   showNotification = true; // Réactive l'affichage de la notification
 }
 if (bouton_tondre3.selectionne() && tondeuse.guard_tondre()) {
   tondeuse.tondre(3);
   notification = "Tonte lancée"; // Met à jour la notification
   notifications.add(notification);
   showNotification = true; // Réactive l'affichage de la notification
 }
 if(bouton_pas_tondre.selectionne() && tondeuse.guard_off()) {
   tondeuse.off();
   notification = "Tonte arrêtée"; // Met à jour la notification
   notifications.add(notification);
   showNotification = true; // Réactive l'affichage de la notification
 }
 
 
 
  
  if (bouton_login_tondeuse.selectionne()) {
    tondeuse.login_tondeuse.ecrire = true; // Exemple d'action associée au bouton
    notification = "Entrez le mot de passe pour la tondeuse"; // Message de notification
    notifications.add(notification);
    showNotification = true; // Afficher la notification
  }
  
  if (bouton_login.selectionne()) {
    login.ecrire = true; // Exemple d'action associée au bouton
    notification = "Entrez votre mot de passe"; // Message de notification
    notifications.add(notification);
    showNotification = true; // Afficher la notification
  }
  
  if(bouton_meteo_soleil.selectionne()){tondeuse.beau_temp();
  notification = "Mode soleil activé"; // Message de notification
    notifications.add(notification);
    showNotification = true; // Afficher la notification
}//peut ajouter repise ici pour faire auto
  if(bouton_meteo_pluie.selectionne()){
  if (tondeuse.guard_interuption_meteo()){tondeuse.interuption_meteo();}
     tondeuse.mauvais_temp();
     notification = "Mode Pluie activé"; // Message de notification
    notifications.add(notification);
    showNotification = true; // Afficher la notification
   
 }
    

  
    // Gestion des boutons pour le séche linge

    if(commandeSL.selectionne()){
      if (secheLinge.secheLingeEstPlein){
        secheLinge.commande=true;
      }
      else{
        notification = "sèche-linge est vide !"; // Message de notification
        notifications.add(notification);
        showNotification = true;
        }
    }
    if (ViderSL.selectionne() && secheLinge.guard_toggle_pleinSL()) {
      secheLinge.secheLingeEstPlein = false; // Vider pour sèche-linge
    }
      showNotification = true; // Afficher la notification
    if (RemplirSL.selectionne()) {
      showNotification = true; // Afficher la notification
      secheLinge.secheLingeEstPlein=true;
    }
    if (AllumerSL.selectionne() && secheLinge.guard_toggleSL()) {
      secheLinge.toggleAllumeSL(); // Allumé pour sèche-linge
    }
    if (ÉteindreSL.selectionne() && secheLinge.guard_toggle_eteintSL()) {
      secheLinge.secheLingeEstAllume = false; // Éteindre pour sèche-linge
    }
    if (RepriseSL.selectionne() && secheLinge.guard_repriseSL()) {
      secheLinge.repriseSL(); // Appel à la méthode de reprise
      notification = "SecheLinge a repris !"; // Message de notification
      notifications.add(notification);
      showNotification = true; // Afficher la notification
    }
  
  // Gestion des boutons pour la machine à laver
  if(commandeML.selectionne()){
      if (machineALaver.estPlein){
        machineALaver.commande=true;
      }
      else{
        notification = "machine a laver est vide !"; // Message de notification
        notifications.add(notification);
        showNotification = true;
      }
   }   
    if (Vider.selectionne() && machineALaver.guard_toggle_plein()) {
      machineALaver.estPlein = false; // Vider la machine à laver
    } 
    if (Remplir.selectionne() && machineALaver.guard_toggle_plein()) {
      machineALaver.estPlein = true; // Remplir la machine à laver
    } 
    if (Allumer.selectionne() && machineALaver.guard_toggle()) {
      machineALaver.toggleAllume(); // Allumer la machine à laver
    }
    if (Éteindre.selectionne() && machineALaver.guard_toggle_eteint()) {
      machineALaver.estAllume = false; // Éteindre la machine à laver
    }
    if (Reprise.selectionne() && machineALaver.guard_reprise()) {
      machineALaver.reprise(); // Appel à la méthode de reprise
      notification = "Machine a laver a repris !"; // Message de notification
      notifications.add(notification);
      showNotification = true; // Afficher la notification
      
    }


  // Gestion des boutons pour le lave-vaisselle 
  if(commandeLV.selectionne()){
      if (laveVaisselle.estPleinLV){
        laveVaisselle.commande=true;}
      
      else{
          notification = "lave vaisselle est vide !"; // Message de notification
          notifications.add(notification);
          showNotification = true;
      }
    }
    if (ViderLV.selectionne() && laveVaisselle.guard_toggle_pleinLV()) {
      laveVaisselle.estPleinLV = false; // Vider le lave-vaisselle
    }
    if (RemplirLV.selectionne() && laveVaisselle.guard_toggle_pleinLV()) {
      laveVaisselle.estPleinLV = true; // Remplir le lave-vaisselle
    }
    if (allumerLV.selectionne() && laveVaisselle.guard_toggleLV()) {
      laveVaisselle.toggleAllumeLV(); // Allumer le lave-vaisselle
    }
    if (ÉteindreLV.selectionne() && laveVaisselle.guard_toggle_eteintLV()) {
      laveVaisselle.estAllumeLV = false; // Éteindre le lave-vaisselle
    }
    if (RepriseLV.selectionne() && laveVaisselle.guard_repriseLV()) {
      laveVaisselle.repriseLV(); // Appel à la méthode de reprise
      notification = "laveVaisselle a repris !"; // Message de notification
      notifications.add(notification);
      showNotification = true; // Afficher la notification
    }
  
  if (Desactive_sirene.selectionne()) {
    intrusion.desactiv_siren(); // Appel de la méthode pour désactiver l'alarme
    notification = "Sirene désactivée"; // Met à jour la notification
    notifications.add(notification);
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  if(turn_on.selectionne()){phone_on=true;} 
  if(turn_off.selectionne()){phone_on=false;}
  
  if(tondeuse_avance_1h.selectionne()){tondeuse.set_horaire_soir_plus_1h();}
  if(tondeuse_avance_5min.selectionne()){tondeuse.set_horaire_soir_plus_5min();}
  if(tondeuse_recule_1h.selectionne()){tondeuse.set_horaire_matin_moins_1h();}
  if(tondeuse_recule_5min.selectionne()){tondeuse.set_horaire_matin_moins_5min();}
  if(tondeuse_avance_1min.selectionne()){tondeuse.set_horaire_soir_plus_1min();}
  if(tondeuse_recule_1min.selectionne()){tondeuse.set_horaire_matin_moins_1min();}
  if(clear_message.selectionne()){message = new Messages(); show_text_to_comp=true;}
  if(send_message.selectionne()&& show_text_to_comp){text_tocompany=true;}
  
  
  
}

void mouseReleased() {
  addHourButton.relache();
  addMinuteButton.relache();
  addSixHoursButton.relache();
  crashEauButton.relache();
  crashElectriciteButton.relache();
  grosCrashElectriciteButton.relache();
  restoreEauButton.relache();
  restoreElectriciteButton.relache();
  confirmNotificationButton.relache();
  ouvrirVoletButton.relache(); // Relâche le bouton pour ouvrir les volets
  fermerVoletButton.relache(); // Relâche le bouton pour fermer les volets
  enableAlarmJardinButton.relache(); // Relâche le bouton pour activer l'alarme du jardin
  enableAlarmPartialButton.relache(); // Relâche le bouton pour activer l'alarme partielle
  enableAlarmTotalButton.relache(); // Relâche le bouton pour activer l'alarme totale
  disableAlarmButton.relache(); // Relâche le bouton pour désactiver l'alarme
  intruJardinButton.relache(); // Relâche le bouton pour simuler une intrusion dans le jardin
  intruBackButton.relache(); // Relâche le bouton pour simuler une intrusion à l'arrière
  intruRoofButton.relache(); // Relâche le bouton pour simuler une intrusion sur le toit
  go_away.relache();
  go_home.relache();
  
  bouton_pas_tondre.relache();
  bouton_tondre.relache();
  bouton_tondre2.relache();
  bouton_tondre3.relache();
  bouton_login.relache();
  bouton_login_tondeuse.relache();
  
  // Gestion des boutons pour le lave-vaisselle
  allumerLV.relache();
  ÉteindreLV.relache();
  RemplirLV.relache();
  ViderLV.relache();
  RepriseLV.relache();
  // Gestion des boutons pour la machine à laver
  Allumer.relache();
  Éteindre.relache();
  Remplir.relache();
  Vider.relache();
  Reprise.relache();
  // Gestion des boutons pour le séche linge
  AllumerSL.relache();
  ÉteindreSL.relache();
  RemplirSL.relache();
  ViderSL.relache();
  RepriseSL.relache();
  
  bouton_meteo_soleil.relache() ;
  bouton_meteo_pluie.relache() ;
  
  Desactive_sirene.relache();
  turn_on.relache() ;
  turn_off.relache() ;
  commandeSL.relache();
  commandeLV.relache();
  commandeML.relache();
  
  tondeuse_avance_1h.relache();
  tondeuse_avance_5min.relache();
  tondeuse_recule_1h.relache();
  tondeuse_recule_5min.relache();
  tondeuse_avance_1min.relache();
  tondeuse_recule_1min.relache();
  clear_message.relache();
  send_message.relache();
}

{

  }
void drawTime() {
  fill(0); // Couleur noire pour le texte de l'heure
  textSize(25); // Taille du texte
  textAlign(CENTER, CENTER); // Alignement au centre
  String timeLabel = nf(temps.jour, 2) + ":" + nf(temps.heure, 2) + ":" + nf(temps.minute, 2); // Formatage de l'heure
  text(timeLabel, 1080, 170); // Affichage de l'heure au centre de l'écran
}


void drawNotifications() {
  fill(0); // Couleur blanche pour le texte de la notification
  textSize(15); // Taille du texte
  textAlign(CENTER, CENTER); // Alignement au centre
  int y = 220; // Position verticale initiale pour afficher les notifications
  for (String notification : notifications) {
    text(notification, 860, y); // Affichage de la notification à la position spécifiée
    y += 20; // Augmentation de la position verticale pour la prochaine notification
  }
 
}
