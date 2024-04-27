public class Eau_et_electricite{
  boolean eau;
  boolean electricite;
  Temp date_crash_electricite;
  
  Eau_et_electricite(){
  eau=true;
  electricite=true;
  date_crash_electricite=new Temp();
  }
  void crash_eau(){eau=false;}
  
  void crash_electricite(){
  electricite=false; 
  date_crash_electricite.jour=temp.jour;
  date_crash_electricite.heure=temp.heure;
  date_crash_electricite.minute=temp.minute;
  }
  
  boolean guard_big_crash(){
    return(date_crash_electricite.jour<temp.jour||(date_crash_electricite.jour==temp.jour&&(date_crash_electricite.heure<temp.heure||(date_crash_electricite.heure==temp.heure && date_crash_electricite.minute<temp.minute))));
  }
  
  void gros_crash_electricite(){electricite=false;}
  
  void restore_eau(){eau=true;}
  
  void restore_electicite(){electricite=true;}
}
