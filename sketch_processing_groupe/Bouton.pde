class Bouton {
int cx , cy ; // p o s i t i o n du c e n t r e du bouton
int largeur ;
int hauteur ;
String blabel ;
color couleur ;
color c_nonClickable = #F08080 ;
color c_Clickable = #98FB98 ;
color c_default = c_nonClickable ;
boolean dessus = false ;
boolean clique = false ;

Bouton ( int xp , int yp , int lgp , int htp , String bl ) {
cx = xp ; cy = yp ;
largeur = lgp ;
hauteur = htp ;
blabel = bl ;
couleur = c_default;
}
  void maj_souris ( ) {
  int rmouseX = mouseX;
  int rmouseY = mouseY;//supr peut etre les -
  
  if ( ( rmouseX >= cx-largeur/2)
  && ( rmouseX <= cx+largeur/2) &&
  ( rmouseY >= cy-hauteur/2)
  && ( rmouseY <= cy+hauteur/ 2 ) ) {
  dessus = true ;
  } else {
  dessus = false ;

}

}
boolean selectionne ( ) {
if ( dessus == true ) {
clique = true ;
println( "bouton selectionne" ) ;
return true ;
} else {
println( "bouton non selectionne" ) ;
return false;
}
}

void relache ( ) {
clique = false ;
}

void majcouleur ( boolean s ) {
// s v r a i s i evenement s e l e c t i o n n a b l e
if ( s ) {couleur = c_Clickable ;
} else { couleur = c_nonClickable ;
}
}

void affiche ( ) {
pushStyle ( ) ;
rectMode (CENTER ) ;
stroke ( 0 ) ;
fill ( couleur ) ;
rect( cx , cy , largeur , hauteur ) ;
fill ( 0 ) ;
textSize(16) ;
textAlign (CENTER, CENTER ) ;
text ( blabel, cx, cy ) ;
popStyle () ;
}

}
