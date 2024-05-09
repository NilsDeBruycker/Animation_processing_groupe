public class Messages{
  ArrayList<String> messages;
  Temp date_derniere_intru_detecte;
  String type_derniere_intru;
  Temp date_pour_refresh;
  boolean recu;
  
  Messages(){
  date_derniere_intru_detecte= new Temp();
  date_pour_refresh= new Temp();
  messages=new ArrayList<String>();
  type_derniere_intru="";
  recu=false;
  }
  boolean guard_refresh(){return((temps.minute-date_derniere_intru_detecte.minute)>=5||(temps.minute-date_derniere_intru_detecte.minute)<=-5)&&!phone_on && recu &&!(date_pour_refresh.jour==0 && date_pour_refresh.heure==0 && date_pour_refresh.minute==0);}
  void refresh(){
    int temp_depuis_dernier_refresh=((date_pour_refresh.heure-temps.heure)*60+date_pour_refresh.minute-temps.minute);
    fill(0);
    textSize(15);
    for(int i=0;i<temp_depuis_dernier_refresh;i+=5){
    messages.add("intrusion de par"+type_derniere_intru+" le" +date_derniere_intru_detecte.jour+"a"+date_derniere_intru_detecte.heure+":"+date_derniere_intru_detecte.minute);}
    date_pour_refresh.jour=temps.jour;
    date_pour_refresh.heure=temps.heure;
    date_pour_refresh.minute=temps.minute;
    if (phone_on){recu=true;}
  }
  void register_new_intrusion(){
      fill(0);
      textSize(15);
      date_derniere_intru_detecte.jour=temps.jour;
      date_derniere_intru_detecte.heure=temps.heure;
      date_derniere_intru_detecte.minute=temps.minute;
      if (date_pour_refresh.jour==0 && date_pour_refresh.heure==0 && date_pour_refresh.minute==0){
        date_pour_refresh.jour=temps.jour;
        date_pour_refresh.heure=temps.heure;
        date_pour_refresh.minute=temps.minute;
      }
      if (intrusion.back){type_derniere_intru="la venue";}
      if (intrusion.jard){type_derniere_intru="le jardin";}
      if (intrusion.roof){type_derniere_intru="le toit";}
      messages.add("intrusion de par"+type_derniere_intru+" le" +date_derniere_intru_detecte.jour+"a"+date_derniere_intru_detecte.heure+":"+date_derniere_intru_detecte.minute);
      if(phone_on){recu=true;}
    }
}
