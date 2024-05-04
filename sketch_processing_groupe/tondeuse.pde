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
    
    rectangles_herbe_Y=920;
    sens=true;
    
    login_tondeuse= new Login(1235,1000,"4321");
    
    visuel=loadImage("tondeuse.png");
  }
  
  
  boolean guard_tondre(){return (login_tondeuse.login && login.login && on==false);}
    
  void tondre(int niveau_de_tonte){
    
    if (temp.heure<horaire[1][0] || temp.heure>horaire[0][0]||(temp.heure==horaire[0][0]&&temp.minute>horaire[0][1]))//horaire si pd nuit comence matin peut etre supp plus tard
    {
      on=true;
      rectangles_herbe_Y=920+niveau_de_tonte*10;
      heure_de_fin.jour=temp.jour;
      heure_de_fin.heure=horaire[1][0]+4;
      heure_de_fin.minute=horaire[1][0];
    }
    else if(temp.heure>horaire[1][0]||(temp.heure==horaire[1][0]&&temp.minute>=horaire[1][1]) &&(temp.heure<horaire[0][0]-4||(temp.heure==horaire[0][0]-4&&temp.minute<=horaire[0][1]))){//si normal
      on=true;
      rectangles_herbe_Y=920+niveau_de_tonte*10;
      heure_de_fin.jour=temp.jour;
      heure_de_fin.heure=temp.heure+4;
      heure_de_fin.minute=temp.minute;
    }
    else if(temp.heure<horaire[0][0]){// si tard
      on=true;
      rectangles_herbe_Y=920+niveau_de_tonte*10;
      heure_de_fin.jour= temp.jour+1;
      heure_de_fin.heure=horaire[1][0]+(horaire[0][1]-temp.heure-(60-temp.minute+horaire[0][1])/60);
      heure_de_fin.minute=(temp.minute+horaire[1][1])%60;
  }
  
    
  }
 void display(){
     rect(1235,rectangles_herbe_Y,300,25);
     rect(835,rectangles_herbe_Y,200,25);
     image(visuel,X,Y,visuel.width/2,visuel.height/2);
     login_tondeuse.display();
     if (on&&!(temp.heure<horaire[0][0]-4||(temp.heure==horaire[0][0]-4&&temp.minute<=horaire[0][1]))) {text("je tond",950,970);}
  }
  
  void check(){
    if (on && (temp.heure>horaire[1][0]||(temp.heure==horaire[1][0]&&temp.minute>=horaire[1][1]) &&(temp.heure<horaire[0][0]-4||(temp.heure==horaire[0][0]-4&&temp.minute<=horaire[0][1])))){
        if (X<1235&&sens){X=X+5;}
        else if (X==1235&&sens){sens=false;}
        else if(X>835&&!sens){X=X-5;}
        else if(X==835){sens=true;}
    }
  }
 
 boolean guard_off(){return(login.login && on && (heure_de_fin.jour<temp.jour||(heure_de_fin.jour==temp.jour&&(heure_de_fin.heure<temp.heure||(heure_de_fin.heure==temp.heure && heure_de_fin.minute<temp.minute)))));}
 void off(){
   on=false;
   heure_de_fin.jour=0;
   heure_de_fin.heure=0;
   heure_de_fin.minute=0;
   
 
 }
    
}
