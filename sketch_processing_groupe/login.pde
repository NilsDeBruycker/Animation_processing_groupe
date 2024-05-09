public class Login{
  boolean login;
  String password;
  String user_input;
  int X;
  int Y;
  boolean ecrire;
  
  Login(int x,int y,String Password){login=false;X=x;Y=y;user_input="";password=Password;}
  
  void enter_password(){if (user_input.equals(password)){login=true;ecrire=false;}}

  
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
       else if (key==ENTER || key==RETURN){enter_password();user_input="";ecrire=false;}
       else{user_input=user_input+key;}
       
    }
  }

}
