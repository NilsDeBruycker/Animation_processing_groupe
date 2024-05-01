class MachineALaver {
  PImage imageVide;
  PImage imagePlein;
  boolean estPlein = false;
  boolean estAllume = false;

  // Coordonnées de base pour le placement de la machine et des boutons
  int x;
  int y;

  MachineALaver(String vide, String plein, int x, int y) {
    this.imageVide = loadImage("machinealaverVide-removebg-preview.png");
    this.imagePlein = loadImage("machineàlavpleine-removebg-preview (2).png");
    this.x = x;
    this.y = y;
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

  void toggleAllume() {
    estAllume = !estAllume;
  }
}
