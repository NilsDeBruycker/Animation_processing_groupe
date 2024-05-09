class Tondeuse{
  int[][] horaire;  //[soir[heure,minute],matin[heure,minute]]
  String mot_de_passe="4321";
  Temp heure_de_fin; //[jour heure,minute]
  boolean on;
  int rectangles_herbe_Y;
  PImage visuel;
  int X;
  int Y;
  boolean sens;
  Login login_tondeuse;
  boolean meteo;
  PImage meteo_visuel;//true = beau false = moche/pluie
  int temp_restant_a_interuption;
  Tondeuse(){
    
    heure_de_fin= new Temp();
    on=false;
    horaire=new int[2][2];
    horaire[0][0]=21;
    horaire[0][1]=0;
    horaire[1][0]=8;
    horaire[1][1]=0;
    
    X=1035;
    Y=945;
    
    rectangles_herbe_Y=990;
    sens=true;
    
    login_tondeuse= new Login(1568,345,"4321");
    
    temp_restant_a_interuption=0;
    
    visuel=loadImage("tondeuse.png");
    meteo=true;
    meteo_visuel=loadImage("soleil.png");
  }
  void set_horaire_soir_plus_1h(){
    if (horaire[0][0]<20 ||(horaire[0][0]==20 && horaire[0][1]==0)){
        horaire[0][0]+=1;}
      
    else {
      horaire[0][0]=horaire[1][0]+4;
      horaire[0][1]=horaire[1][1]; 
    }
  }
  
  void set_horaire_soir_plus_5min(){
    if (horaire[0][0]<20 ||(horaire[0][0]==20 && (horaire[0][1]+5)/60<=0)){
        horaire[0][1]+=(horaire[0][1]+5)%60;}
      
    else {
      horaire[0][0]=horaire[1][0]+4;
      horaire[0][1]=horaire[1][1];
    }
  }
  
  void set_horaire_matin_moins_1h(){
    if (horaire[1][0]>8){
        horaire[0][0]-=1;}
      
    else {
      horaire[0][0]=horaire[1][0]+4;
      horaire[0][1]=horaire[1][1]; 
    }
  }
  
  void set_horaire_matin_moins_5min(){
    if (horaire[1][0]>8 ||(horaire[0][1]==8 && horaire[1][1]>=5)){
        horaire[1][1]=(((horaire[1][1]-5)%60)+60)%60;}
      
    else {
      horaire[1][0]=horaire[0][0]-4;
      horaire[1][1]=horaire[0][1];
    }
  }
  void set_horaire_soir_plus_1min(){
    if (horaire[0][0]<20 ||(horaire[0][0]==20 && (horaire[0][1]+1)/60<=0)){
        horaire[0][1]+=(horaire[0][1]+1)%60;}
      
    else {
      horaire[0][0]=horaire[1][0]+4;
      horaire[0][1]=horaire[1][1];
    }
  }
  void set_horaire_matin_moins_1min(){
    if (horaire[1][0]>8 ||(horaire[0][1]==8 && horaire[1][1]>=1)){
        horaire[1][1]=(((horaire[1][1]-1)%60)+60)%60;}
      
    else {
      horaire[1][0]=horaire[0][0]-4;
      horaire[1][1]=horaire[0][1];
    }
  } 
  void beau_temp(){meteo=true;meteo_visuel=loadImage("soleil.png");}
  void mauvais_temp(){meteo=false;meteo_visuel= loadImage("pluie.png");}
  //void mauvais temp()
  boolean guard_tondre(){return (login_tondeuse.login && eau_et_electricite.electricite && meteo&&!on);}
    
  void tondre(int niveau_de_tonte){
    
    if (temps.heure<horaire[1][0] || (temps.heure==horaire[1][0] && temps.minute<=horaire[1][1]) || temps.heure>horaire[0][0]||(temps.heure==horaire[0][0]&&temps.minute>horaire[0][1]))//horaire si pd nuit comence matin peut etre supp plus tard
    {
      on=true;
      rectangles_herbe_Y=990+niveau_de_tonte*5;
      if (temps.heure>horaire[0][0] ||(temps.heure==horaire[0][0] && temps.minute<=horaire[0][1])){heure_de_fin.jour=temps.jour+1;}
      else{heure_de_fin.jour=temps.jour;}//si avant minuit doit metre heure_de_fin.jour au jour suivant
      heure_de_fin.heure=horaire[1][0]+4;
      heure_de_fin.minute=horaire[1][0];
    }
    else if(temps.heure>horaire[1][0]||(temps.heure==horaire[1][0]&&temps.minute>=horaire[1][1]) &&(temps.heure<horaire[0][0]-4||(temps.heure==horaire[0][0]-4&&temps.minute<=horaire[0][1]))){//si normal
      on=true;
      rectangles_herbe_Y=990+niveau_de_tonte*5;
      heure_de_fin.jour=temps.jour;
      heure_de_fin.heure=temps.heure+4;
      heure_de_fin.minute=temps.minute;
    }
    else if(temps.heure<horaire[0][0]){// si tard
      on=true;
      rectangles_herbe_Y=990+niveau_de_tonte*5;
      heure_de_fin.jour= temps.jour+1;
      heure_de_fin.heure=horaire[1][0]+4-(horaire[0][1]-temps.heure-(60-temps.minute+horaire[0][1])/60);
      heure_de_fin.minute=(((temps.minute+horaire[1][1]-(60-temps.minute+horaire[0][1]))%60)+60)%60;
  }
  
    
  }
 
 void display(){
     fill(255,255,255);
     noStroke();
     rect(835,rectangles_herbe_Y,900,25);
     image(visuel,X,Y,visuel.width/2,visuel.height/2);
     login_tondeuse.display();
     fill(0);
     text("horaire matin"+horaire[1][0]+":"+horaire[1][1]+" soir"+horaire[0][0]+":"+horaire[0][1],950,970);
     stroke(0);
     
 
 image(meteo_visuel,0,0,100,100) ;
  }
  
  void check(){
    if (on && (temps.heure>horaire[1][0]||(temps.heure==horaire[1][0]&&temps.minute>=horaire[1][1]) &&(temps.heure<horaire[0][0]-4||(temps.heure==horaire[0][0]-4&&temps.minute<=horaire[0][1])))){
        if (X<1235&&sens){X=X+5;}
        else if (X==1235&&sens){sens=false;}
        else if(X>835&&!sens){X=X-5;}
        else if(X==835){sens=true;}
    }
  }
 void auto(){
   if (guard_reprise()){reprise();}
   if (guard_off()){off();}
   if(guard_interuption_meteo()){interuption_meteo();}
 
 }
 boolean guard_interuption_meteo(){return !meteo&&on;}
 
 void interuption_meteo(){
   if (((heure_de_fin.heure-horaire[1][0])*60+heure_de_fin.minute-horaire[1][1])<=240){//si faisait un saut vers le lendemain
         temp_restant_a_interuption=((heure_de_fin.heure-horaire[1][0])*60+heure_de_fin.minute-horaire[1][1])+((horaire[0][0]-temps.heure)*60+horaire[1][1]-temps.minute);
       }   
   else{temp_restant_a_interuption=(heure_de_fin.heure-temps.heure)*60+heure_de_fin.minute-temps.minute;} 
   on=false;
 }
 
 boolean guard_reprise(){
 Temp date_fin_temporaire=new Temp();
 date_fin_temporaire.heure=temps.heure+(temp_restant_a_interuption/60);
 date_fin_temporaire.minute=(temps.minute+temp_restant_a_interuption)%60;
 return!(temp_restant_a_interuption>=0&&!on&&meteo&&eau_et_electricite.electricite);}
 
 
 void reprise(){
   if (temps.heure<horaire[1][0] ||(temps.heure==horaire[1][0] && temps.minute<=horaire[1][1]) || temps.heure>horaire[0][0]||(temps.heure==horaire[0][0]&&temps.minute>horaire[0][1]))//horaire si pd nuit comence matin peut etre supp plus tard
    {
      on=true;
      if (temps.heure>horaire[0][0] ||(temps.heure==horaire[0][0] && temps.minute<=horaire[0][1])){heure_de_fin.jour=temps.jour+1;}
      else{heure_de_fin.jour=temps.jour;}
      heure_de_fin.heure=horaire[1][0]+ temp_restant_a_interuption/60;
      heure_de_fin.minute=horaire[1][0]+ temp_restant_a_interuption%60;
    }
    else if(temps.heure>horaire[1][0]||(temps.heure==horaire[1][0]&&temps.minute>=horaire[1][1]) &&(temps.heure<horaire[0][0]-4||(temps.heure==horaire[0][0]-4&&temps.minute<=horaire[0][1]))){//si normal
      on=true;
      heure_de_fin.jour=temps.jour;
      heure_de_fin.heure=temps.heure+temp_restant_a_interuption/60;
      heure_de_fin.minute=temps.minute+temp_restant_a_interuption%60;
    }
    else if(temps.heure<horaire[0][0]){// si tard
      on=true;
      heure_de_fin.jour= temps.jour+1;
      heure_de_fin.heure=horaire[1][0]+(temp_restant_a_interuption/60)-(horaire[0][1]-temps.heure-(60-temps.minute+horaire[0][1])/60);
      heure_de_fin.minute=(((temps.minute+horaire[1][1]+temp_restant_a_interuption-(60-temps.minute+horaire[0][1]))%60)+60)%60;
  }
 
 }
 boolean guard_off(){return(tondeuse.login_tondeuse.login && on && (heure_de_fin.jour<temps.jour||(heure_de_fin.jour==temps.jour&&(heure_de_fin.heure<temps.heure||(heure_de_fin.heure==temps.heure && heure_de_fin.minute<temps.minute)))));}
 void off(){
   on=false;
   heure_de_fin.jour=0;
   heure_de_fin.heure=0;
   heure_de_fin.minute=0;
   
 
 }
    
}
