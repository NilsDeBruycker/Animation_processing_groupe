public class inputs{
  boolean login;
  String user_input;
  int X;
  int Y;
  boolean ecrire;
  
  inputs(int x,int y){login=false;X=x;Y=y;user_input="";}

  
  void display(){
      if (login==false){
        fill(255,255,255);
        rect(X,Y,100,30);
        fill(0,0,0);
        text(user_input,X,Y);
      }
  }
  void get_input_from_user(){
     if (keyPressed && ecrire){
       if (key==BACKSPACE){if (user_input.length()>0) {
        user_input=user_input.substring(0, user_input.length()-1);} }
       else if (key==ENTER || key==RETURN){user_input="";ecrire=false;}
       else{user_input=user_input+key;}
       
    }
  }

}
