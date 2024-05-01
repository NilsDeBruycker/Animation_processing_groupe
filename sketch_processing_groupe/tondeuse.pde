class Tondeuse{
  int[][] horaire;  //[soir[heure,minute],matin[heure,minute]]
  int mot_de_passe=4321;
  Temp heure_de_fin; //[jour heure,minute]
  boolean on;
  int rectangles_herbe_Y;
  PImage visuel;
  int X;
  int Y;
  Tondeuse(){
    
    heure_de_fin= new Temp();
    on=false;
    horaire=new int[2][2];
    horaire[0][0]=21;
    horaire[0][1]=0;
    horaire[1][0]=8;
    horaire[1][1]=0;
    
    rectangles_herbe_Y=920;
    visuel=loadImage("tondeuse.png");
  }
  
  
  boolean guard_tondre(int mdp_user){return (mdp_user==mot_de_passe);}
    
  void tondre(int niveau_de_tonte){
    on=true;
    if (temp.heure<horaire[1][0] )//horaire sui pd nuit comence matin peut etre supp plus tard
    {
      heure_de_fin.jour=temp.jour;
      heure_de_fin.heure=horaire[0][0]+4;
      heure_de_fin.minute=horaire[0][0];
    }
    else if(temp.heure<horaire[0][0]-4||(temp.heure==horaire[0][0]-4&&temp.minute<=horaire[0][1])){//si normal
      heure_de_fin.jour=temp.jour;
      heure_de_fin.heure=temp.heure+4;
      heure_de_fin.minute=temp.minute;
    }
    else if(temp.heure<horaire[0][0]){// si tard
      heure_de_fin.jour= temp.jour+1;
      heure_de_fin.heure=horaire[1][0]+(horaire[0][1]-temp.heure-(60-temp.minute+horaire[0][1])/60);
      heure_de_fin.minute=(temp.minute+horaire[1][1])%60;
  }
  rectangles_herbe_Y=920+niveau_de_tonte*10;
    
  }
 void display(){
     rect(1235,rectangles_herbe_Y,300,25);
     rect(835,rectangles_herbe_Y,200,25);
     image(visuel,1035,825,visuel.width/2,visuel.height/2);
     if (on) {text("je tond",950,970);
}
 }
 
 boolean guard_off(){return(heure_de_fin.jour<temp.jour||(heure_de_fin.jour==temp.jour&&(heure_de_fin.heure<temp.heure||(heure_de_fin.heure==temp.heure && heure_de_fin.minute<temp.minute))));}
 void off(){
   on=false;
   heure_de_fin.jour=0;
   heure_de_fin.heure=0;
   heure_de_fin.minute=0;
 
 }
    
}
