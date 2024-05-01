class LaveVaisselle {
  PImage imageVideLV;
  PImage imagePleinLV;
  boolean estPleinLV = false;
  boolean estAllumeLV = false;

  int xLV;
  int yLV;

  LaveVaisselle(String vide, String plein, int x, int y) {
    this.imageVideLV = loadImage("lavevaisselleVide.png");
    this.imagePleinLV = loadImage("lavevaissellePlein (1).png");
    this.xLV = x;
    this.yLV = y;
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

  void toggleAllumeLV() {
    estAllumeLV = !estAllumeLV;
  }
}
