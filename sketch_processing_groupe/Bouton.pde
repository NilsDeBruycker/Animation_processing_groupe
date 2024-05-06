public class Bouton {
  int cx, cy;
  int largeur;
  int hauteur;
  String blabel;
  color couleur;
  color c_nonClickable = #F08080;
  color c_Clickable = #98FB98;
  color c_default = c_nonClickable;
  boolean dessus = false;
  boolean clique = false;

  Bouton(int xp, int yp, int lgp, int htp, String bl) {
    cx = xp;
    cy = yp;
    largeur = lgp;
    hauteur = htp;
    blabel = bl;
    couleur = #000066;
  }

  void maj_souris() {
    if ((mouseX >= cx - largeur / 2) && (mouseX <= cx + largeur / 2) && (mouseY >= cy - hauteur / 2) && (mouseY <= cy + hauteur / 2)) {
      dessus = true;
    } else {
      dessus = false;
    }
  }

  boolean selectionne() {
    if (dessus) {
      clique = true;
      if (blabel.equals("Add 1 Hour")) {
        temps.forward(0, 1, 0); // Ajoutez 1 heure en utilisant la classe Temp
      } else if (blabel.equals("Add 1 Minute")) {
        temps.forward(0, 0, 1); // Ajoutez 1 minute en utilisant la classe Temp
      } else if (blabel.equals("Add 6 Hours")) {
        temps.forward(0, 6, 0); // Ajoutez 6 heures en utilisant la classe Temp
      }
      return true;
    } else {
      return false;
    }
  }
  
  void majcouleur ( boolean s ) {
// s v r a i s i evenement s e l e c t i o n n a b l e
if ( s ) {couleur = c_Clickable ;
} else { couleur = c_nonClickable ;
}
}

  void relache() {
    clique = false;
  }

  void affiche() {
    maj_souris();
    pushStyle();
    rectMode(CENTER);
    stroke(0);
    if (dessus) {
    fill(100); // Couleur grise lorsque le bouton est survolé
  } else {
    fill(couleur); // Couleur bleue par défaut
  }
    rect(cx, cy, largeur, hauteur);
    fill(255);
    textSize(11);
    textAlign(CENTER, CENTER);
    text(blabel, cx, cy);
    popStyle();
  }
}
