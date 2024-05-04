public class alarm {
  boolean jardin;
  boolean partial;
  boolean total;
  PImage coneG;
  PImage coneD;
  
  int x_back;
  int y_front;
  int y_back;
  int x_front;
  int x_roof;
  int y_roof;

  alarm() {
    jardin = false;
    partial = false;
    total = false;
    coneG = loadImage("conegauche.png");
    coneD = loadImage("conedroit.png");
    x_back = 0;
    y_front = 0;
    y_back = 0;
    x_front = 0;
    x_roof = 0;
    y_roof = 0;
  }

  void activateJardin() {
    jardin = true;
    partial = false;
    total = false;
    x_front = 480;
    y_front = 940;
    y_back = 0;
    x_roof = 0;
    y_roof = 0;
  }

  void activatePartial() {
    jardin = true;
    partial = true;
    total = false;
    x_back = 860;
    y_back = 940;
    y_front = 940;
    x_front=480;
    x_roof = 0;
    y_roof = 0;
  }

  void activateTotal() {
    jardin = false;
    partial = false;
    total = true;
    x_back = 860;
    y_back = 940;
    y_front = 940;
    x_front=480;
    x_roof = 670;
    y_roof = 530;
    
  }

  void turnOff() {
    jardin = false;
    partial = false;
    total = false;
    x_back = 0;
    y_front = 0;
    y_back = 0;
    x_front = 0;
    x_roof = 0;
    y_roof = 0;
  }

  public boolean isJardin() {
    return jardin;
  }

  public boolean isPartial() {
    return partial;
  }

  public boolean isTotal() {
    return total;
  }

  void display() {
    if (isJardin()) {
      image(coneD, x_front, y_front, coneD.width/4, coneD.height/4);}
   if (isPartial() && isJardin()) {
        image(coneG, x_back, y_back, coneG.width/4, coneG.height/4);
        image(coneD, x_front, y_front, coneD.width/4, coneD.height/4);
      }
    if (isTotal()) {
          image(coneD, x_roof, y_roof, coneD.width/4, coneD.height/4);
          image(coneG, x_back, y_back, coneG.width/4, coneG.height/4);
          image(coneD, x_front, y_front, coneD.width/4, coneD.height/4);
        }
      
    
  
}
}
