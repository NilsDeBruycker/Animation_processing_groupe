public class Login{
  boolean login;
  String password="1234";
  
  Login(){login=false;}
  
  void enter_pasword(String user_input){if (user_input.equals(password)){login=true;}}
}
