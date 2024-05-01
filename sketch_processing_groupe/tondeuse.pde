class Tondeuse{
  int[][] horaire;  //[soir[heure,minute],matin[heure,minute]]
  int mot_de_passe=4321;
  int[]heure_de_fin; //[jour heure,minute]
  boolean on;
  int rectangles_herbe_Y;
  Tondeuse(){
    heure_de_fin[0]=0;
    heure_de_fin[1]=0;
    heure_de_fin[2]=0;
    on=false;
    horaire[0][0]=21;
    horaire[0][0]=0;
    horaire[1][0]=8;
    horaire[1][1]=0;
    
    rectangles_herbe_Y=920;
  }
  
  
  boolean guard_tondre(int mdp_user){return (mdp_user==mot_de_passe)&&on==true;}
    
  void tondre(int niveau_de_tonte){
    on=true;
    if (temp.heure<horaire[1][0] )//horaire normal
    {
      heure_de_fin[1]=horaire[0][0]+4;
      heure_de_fin[2]=horaire[0][0];
    }
    else if(temp.heure<horaire[0][0]-4||(temp.heure==horaire[0][0]-4&&temp.minute<=horaire[0][1])){
      heure_de_fin[1]=temp.heure+4;
      heure_de_fin[2]=temp.minute;
    }
    else if(temp.heure<horaire[0][0]){
      heure_de_fin[0]= temp.jour+1;
      heure_de_fin[1]=horaire[1][0]+(horaire[0][1]-temp.heure-(60-temp.minute+horaire[0][1])/60);
      heure_de_fin[2]=(temp.minute+horaire[1][1])%60;
      rectangles_herbe_Y=920+niveau_de_tonte*10;
  }
    
  }
 void display_rectangles(){
     rect(0,rectangles_herbe_Y,900,25);
     rect(835,rectangles_herbe_Y,900,25);
 }
}
