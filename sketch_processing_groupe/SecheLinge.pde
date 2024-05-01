class SecheLinge {
    PImage secheLingeVide;
    PImage secheLingePlein;
    boolean secheLingeEstPlein = false; 
    boolean secheLingeEstAllume = false; 

    int posXSL; // Position X du sèche-linge
    int posYSL; // Position Y du sèche-linge

    SecheLinge(String vide, String plein, int x, int y) {
        this.secheLingeVide = loadImage(vide);
        this.secheLingePlein = loadImage(plein);
        this.posXSL = x;
        this.posYSL = y;
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

    void toggleAllumeSL() {
        secheLingeEstAllume = !secheLingeEstAllume;
    }
}
