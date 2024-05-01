PImage background;
PFont font;

MachineALaver machineALaver;
LaveVaisselle laveVaisselle;
SecheLinge secheLinge;

public void setup() {
  size(1920, 1080);
  background = loadImage("background.png");

  
  secheLinge = new SecheLinge("séchelingeVide (1).png", "séchelingePlein (1).png", 750, 885);
  machineALaver = new MachineALaver("machineàlaverVide-removebg-preview.png", "machineàlavpleine-removebg-preview (2).png", 1200, 820);
  laveVaisselle = new LaveVaisselle("lavevaisselleVide.png", "lavevaissellePlein (1).png", 750, 793);
  
  font = createFont("Arial", 16, true); 
  frameRate(30);
}

Temp temp=new Temp();
Eau_et_electricite eau_et_electricite=new Eau_et_electricite();

void draw() {
  image(background, 0, 0);
  
  secheLinge.afficherSL();
  machineALaver.afficher();
  laveVaisselle.afficherLV();
  
  temp.display();
  temp.slow_forward();
  
  drawButtons();
 
}

void drawButtons() {
  fill(255);
  // Boutons pour le sèche-linge
  rect(845, 820, 90, 30); // Bouton vider
  rect(845, 852, 90, 30); // Bouton remplir
  rect(845, 884, 90, 30); // Bouton allumer
  rect(845, 916, 90, 30); // Bouton éteindre
  // Boutons pour la machine à laver
  rect(475, 820, 90, 30); // Bouton vider machine à laver
  rect(475, 852, 90, 30); // Bouton remplir machine à laver
  rect(475, 884, 90, 30); // Bouton allumer machine à laver
  rect(475, 916, 90, 30); // Bouton éteindre machine à laver
  // Boutons pour le lave-vaisselle
  rect(950, 700, 90, 30); // Bouton vider lave-vaisselle
  rect(950, 732, 90, 30); // Bouton remplir lave-vaisselle
  rect(950, 764, 90, 30); // Bouton allumer lave-vaisselle
  rect(950, 796, 90, 30); // Bouton éteindre lave-vaisselle
  
  fill(0);
  textFont(font, 16);
  
  // Labels pour le sèche-linge
  text("Vider", 870, 840);
  text("Remplir", 870, 872);
  text("Allumer", 870, 904);
  text("Éteindre", 870, 936);
  // Labels pour la machine à laver
  text("Vider", 500, 840);
  text("Remplir", 500, 872);
  text("Allumer", 500, 904);
  text("Éteindre", 500, 936);
  // Labels pour le lave-vaisselle
  text("ViderLV", 968, 720);
  text("RemplirLV", 960, 752);
  text("AllumerLV", 960, 784);
  text("ÉteindreLV", 960, 816);
}


void mousePressed() {
  // Gestion des boutons pour le séche linge
    if (mouseX > 845 && mouseX < 935) {
        if (mouseY > 820 && mouseY < 850) {
            secheLinge.secheLingeEstPlein = false; // Vider pour sèche-linge
        } else if (mouseY > 852 && mouseY < 882) {
            secheLinge.secheLingeEstPlein= true;// Remplir pour sèche-linge
        } else if (mouseY > 884 && mouseY < 914) {
            secheLinge.secheLingeEstAllume = true; // Allumé pour sèche-linge
        } else if (mouseY > 916 && mouseY < 946) {
            secheLinge.secheLingeEstAllume = false;// Éteindre pour sèche-linge
        }
    }
  
    // Gestion des boutons pour la machine à laver
  if (mouseX > 475 && mouseX < 565) { 
    if (mouseY > 820 && mouseY < 850) {
      machineALaver.estPlein = false; // Vider la machine à laver
    } else if (mouseY > 852 && mouseY < 882) {
      machineALaver.estPlein = true; // Remplir la machine à laver
    } else if (mouseY > 884 && mouseY < 914) {
      machineALaver.estAllume = true; // Allumer la machine à laver
    } else if (mouseY > 916 && mouseY < 946) {
      machineALaver.estAllume = false; // Éteindre la machine à laver
    }
  }
// Gestion des boutons pour le lave-vaisselle
if (mouseX > 950 && mouseX < 1040) { 
  if (mouseY > 700 && mouseY < 730) {
    laveVaisselle.estPleinLV = false; // Vider le lave-vaisselle
  } else if (mouseY > 732 && mouseY < 762) {
    laveVaisselle.estPleinLV = true; // Remplir le lave-vaisselle
  } else if (mouseY > 764 && mouseY < 794) {
    laveVaisselle.estAllumeLV = true; // Allumer le lave-vaisselle
  } else if (mouseY > 796 && mouseY < 826) {
    laveVaisselle.estAllumeLV = false; // Éteindre le lave-vaisselle
  }
}

}
