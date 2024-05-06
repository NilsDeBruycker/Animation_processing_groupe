import processing.core.PApplet;
import processing.core.PImage;

PImage background;

Temp temps;

MachineALaver machineALaver;
SecheLinge secheLinge;
LaveVaisselle laveVaisselle;

Bouton addHourButton;
Bouton addMinuteButton;
Bouton addSixHoursButton;
Bouton crashEauButton;
Bouton crashElectriciteButton;
Bouton grosCrashElectriciteButton;
Bouton restoreEauButton;
Bouton restoreElectriciteButton;
Bouton confirmNotificationButton; // Bouton de confirmation de la notification

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

Eau_et_electricite eau_et_electricite;
volet volet; // Instance de la classe volet
alarm alarme; // Instance de la classe alarme
intrusion intrusion; // Instance de la classe intrusion
proprio prop; 
Login login;

Bouton bouton_tondre=new Bouton(1035,935,90,30,"tondre");
Bouton bouton_pas_tondre=new Bouton(1225,935,90,30,"pas_tondre");
Tondeuse tondeuse;
Bouton bouton_login_tondeuse= new Bouton(1618,227,100,30,"Login tond");

String notification = ""; // Variable pour stocker la notification
boolean showNotification = true; // Indique si la notification doit être affichée

Bouton metre_ferie_on=new Bouton(150,150,90,30,"jour ferier");
Bouton metre_ferie_off=new Bouton(150,180,110,30,"jour non ferier");
Bouton bouton_login= new Bouton(1620,180,100,30,"");

void setup() {
  size(1920, 1080);
  background = loadImage("background.png");

  temps = new Temp();
  
  addHourButton = new Bouton(1040, 210, 75, 30, "Add 1 Hour");
  addMinuteButton = new Bouton(1120, 210, 75, 30, "Add 1 Minute");
  addSixHoursButton = new Bouton(1040, 240, 75, 30, "Add 6 Hours");
  
  crashEauButton = new Bouton(1040, 310, 75, 30, "Crash Eau");
  crashElectriciteButton = new Bouton(1120, 310, 75, 30, "Crash Electricite");
  grosCrashElectriciteButton = new Bouton(1040, 350, 100, 30, "Gros Crash Electricite");
  restoreEauButton = new Bouton(1130, 350, 67, 30, "Restore Eau");
  restoreElectriciteButton = new Bouton(1050, 390, 95, 30, "Restore Electricite");
  
  // Bouton de confirmation de notification
  confirmNotificationButton = new Bouton(1120, 240, 75, 30, "Confirm");
  
  // Initialisation de l'objet Eau_et_electricite
  eau_et_electricite = new Eau_et_electricite();
  
  // Initialisation de l'objet volet
  volet = new volet();
  
  // Création des boutons pour ouvrir et fermer les volets
  ouvrirVoletButton = new Bouton(1040, 430, 75, 30, "Ouvrir Volet");
  fermerVoletButton = new Bouton(1120, 430, 75, 30, "Fermer Volet");
  
  // Création des boutons pour gérer l'alarme
  enableAlarmJardinButton = new Bouton(1368, 250, 95, 30, "Enable Alarm Jardin");
  enableAlarmPartialButton = new Bouton(1368, 320, 95, 30, "Enable Alarm Partial");
  enableAlarmTotalButton = new Bouton(1368, 285, 95, 30, "Enable Alarm Total");
  disableAlarmButton = new Bouton(1439, 215, 75, 30, "Disable Alarm");
  
  // Création des boutons pour simuler des intrusions
  intruJardinButton = new Bouton(1359, 180, 75, 30, "Intru Jardin");
  intruBackButton = new Bouton(1359, 215, 75, 30, "Intru Back");
  intruRoofButton = new Bouton(1439, 180, 75, 30, "Intru Roof");
  
  go_away = new Bouton(1360, 356, 75, 30, "Go AWAY ");
  go_home = new Bouton(1439, 356, 75, 30, "Go HOME ");
  
  machineALaver = new MachineALaver("machineàlaverVide-removebg-preview.png", "machineàlavpleine-removebg-preview (2).png", 1200, 820);
  laveVaisselle = new LaveVaisselle("lavevaisselleVide.png", "lavevaissellePlein (1).png", 750, 793);
  
  
  // Initialisation de l'objet alarme
  alarme = new alarm();
  
  // Initialisation de l'objet intrusion
  intrusion = new intrusion();
  
  prop = new proprio();
  
  login=new Login(1570,165,"1234");
  tondeuse = new Tondeuse();
  
  bouton_login.couleur=#FFFFFF;
  bouton_login_tondeuse.couleur=#FFFFFF;
  
  secheLinge = new SecheLinge("séchelingeVide (1).png", "séchelingePlein (1).png", 750, 885);
  laveVaisselle = new LaveVaisselle("lavevaisselleVide.png", "lavevaissellePlein (1).png", 750, 793);
  
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
  
  
  go_away.affiche();
  go_home.affiche();
  
  tondeuse.check();
  tondeuse.display();
  tondeuse.login_tondeuse.get_input_from_user();
  login.get_input_from_user();
  login.display();
  secheLinge.afficherSL();
  machineALaver.afficher();
  laveVaisselle.afficherLV();
  
  
  
  
  // Afficher la notification si showNotification est vrai
  if (showNotification) {
    drawNotification();
  }
  
  drawTime(); // Appel de la fonction drawTime pour afficher l'heure
  
  // Afficher le bouton de confirmation uniquement si une notification est présente
  if (!notification.equals("")) {
    confirmNotificationButton.affiche();
  }
  
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
  
}  

void mousePressed() {
  if (addHourButton.selectionne()) {
    notification = "1 hour added"; // Met à jour la notification
    showNotification = true; // Réactive l'affichage de la notification
  }
  if (addMinuteButton.selectionne()) {
    notification = "1 minute added"; // Met à jour la notification
    showNotification = true; // Réactive l'affichage de la notification
  }
  if (addSixHoursButton.selectionne()) {
    notification = "6 hours added"; // Met à jour la notification
    showNotification = true; // Réactive l'affichage de la notification
  }
  if (crashEauButton.selectionne()) {
    eau_et_electricite.crash_eau(); // Exécute la fonction de crash de l'eau
    notification = "Crash Eau";
    showNotification = true; // Réactive l'affichage de la notification
  }
  if (crashElectriciteButton.selectionne()) {
    eau_et_electricite.crash_electricite(); // Exécute la fonction de crash de l'électricité
    notification = "Crash Electricite";
    showNotification = true; // Réactive l'affichage de la notification
  }
  if (grosCrashElectriciteButton.selectionne()) {
    eau_et_electricite.gros_crash_electricite(); // Exécute la fonction de gros crash de l'électricité
    notification = "Gros Crash Electricite";
    showNotification = true; // Réactive l'affichage de la notification
  }
  if (restoreEauButton.selectionne()) {
    eau_et_electricite.restore_eau(); // Exécute la fonction de restauration de l'eau
    notification = "Restore Eau";
    showNotification = true; // Réactive l'affichage de la notification
  }
  if (restoreElectriciteButton.selectionne()) {
    eau_et_electricite.restore_electricite(); // Exécute la fonction de restauration de l'électricité
    notification = "Restore Electricite";
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton de confirmation est sélectionné
  if (confirmNotificationButton.selectionne()) {
    // Désactive temporairement l'affichage de la notification
    showNotification = false;
  } 
  
  // Vérifie si le bouton pour ouvrir les volets est sélectionné
  if (ouvrirVoletButton.selectionne()) {
    volet.ouvrir_volet(); // Appel de la méthode pour ouvrir les volets
    notification = "Volets ouverts"; // Met à jour la notification
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton pour fermer les volets est sélectionné
  if (fermerVoletButton.selectionne()) {
    volet.fermer_volet(); // Appel de la méthode pour fermer les volets
    notification = "Volets fermés"; // Met à jour la notification
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton pour activer l'alarme du jardin est sélectionné
  if (enableAlarmJardinButton.selectionne()) {
    alarme.activateJardin(); // Appel de la méthode pour activer l'alarme du jardin
    notification = "Alarme Jardin activée"; // Met à jour la notification
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton pour activer l'alarme partielle est sélectionné
  if (enableAlarmPartialButton.selectionne()) {
    alarme.activatePartial(); // Appel de la méthode pour activer l'alarme partielle
    notification = "Alarme Partielle activée"; // Met à jour la notification
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton pour activer l'alarme totale est sélectionné
  if (enableAlarmTotalButton.selectionne()) {
    alarme.activateTotal(); // Appel de la méthode pour activer l'alarme totale
    notification = "Alarme Totale activée"; // Met à jour la notification
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton pour désactiver l'alarme est sélectionné
  if (disableAlarmButton.selectionne()) {
    alarme.turnOff(); // Appel de la méthode pour désactiver l'alarme
    notification = "Alarme désactivée"; // Met à jour la notification
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton pour simuler une intrusion dans le jardin est sélectionné
  if (intruJardinButton.selectionne()) {
    intrusion.intru_Jardin_detect(); // Appel de la méthode pour simuler une intrusion dans le jardin
    notification = "Intrusion Jardin détectée"; // Met à jour la notification
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton pour simuler une intrusion à l'arrière est sélectionné
  if (intruBackButton.selectionne()) {
    intrusion.intru_Back_detect(); // Appel de la méthode pour simuler une intrusion à l'arrière
    notification = "Intrusion Arrière détectée"; // Met à jour la notification
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  // Vérifie si le bouton pour simuler une intrusion sur le toit est sélectionné
  if (intruRoofButton.selectionne()) {
    intrusion.intru_Roof_detect(); // Appel de la méthode pour simuler une intrusion sur le toit
    notification = "Intrusion Toit détectée"; // Met à jour la notification
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  if (go_home.selectionne()) {
    prop.go_home(); // Appel de la méthode pour simuler une intrusion sur le toit
    notification = "Prop at home"; // Met à jour la notification
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  if (go_away.selectionne()) {
    prop.go_away(); // Appel de la méthode pour simuler une intrusion sur le toit
    notification = "Prop at home"; // Met à jour la notification
    showNotification = true; // Réactive l'affichage de la notification
  }
  
  if(metre_ferie_on.selectionne()){temps.ferie=true;}
 if(metre_ferie_off.selectionne()){temps.ferie=false;}
 
 if (bouton_tondre.selectionne()&&tondeuse.guard_tondre()){tondeuse.tondre(1);}
 if(bouton_pas_tondre.selectionne()&&tondeuse.guard_off()){tondeuse.off();}
 if(bouton_login.selectionne()){login.ecrire=true;}
 if(bouton_login_tondeuse.selectionne()){tondeuse.login_tondeuse.ecrire=true;}
  
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
  bouton_login.relache();
  bouton_login_tondeuse.relache();
}

void drawTime() {
  fill(0); // Couleur noire pour le texte de l'heure
  textSize(25); // Taille du texte
  textAlign(CENTER, CENTER); // Alignement au centre
  String timeLabel = nf(temps.jour, 2) + ":" + nf(temps.heure, 2) + ":" + nf(temps.minute, 2); // Formatage de l'heure
  text(timeLabel, 1080, 170); // Affichage de l'heure au centre de l'écran
}

void drawNotification() {
  fill(0); // Couleur blanche pour le texte de la notification
  textSize(17); // Taille du texte
  textAlign(CENTER, CENTER); // Alignement au centre
  text(notification, 1082, 280); // Affichage de la notification en haut de l'écran
}
