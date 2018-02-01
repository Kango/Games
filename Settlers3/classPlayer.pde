


class Player {

  // the big field with player properties  
  float x, y; 
  float w, h; 

  String name=""; 

  color col; 
  int colID;
  int ID; 

  PImage imgVillage=null, 
    imgCity=null; 

  float yourTurnX, yourTurnY;

  //constr
  Player(float x_, float y_, 
    float w_, float h_, 
    String name_, 
    color col_, 
    int colID_, 
    int ID_) {

    x=x_;
    y=y_;

    w=w_;
    h=h_;

    name = name_;

    col = col_;
    colID = colID_; 
    ID=ID_;    

    switch (colID) {
      //
    case intRed:
      imgVillage=gameArt.villageRed.copy();
      imgCity=gameArt.cityRed.copy();
      yourTurnX=x+w+10;
      yourTurnY=y+h+10;
      break;

    case intGreen:
      imgVillage=gameArt.villageGreen.copy();
      imgCity=gameArt.cityGreen.copy();
      yourTurnX=x-10;
      yourTurnY=y+h+40;
      break;

    case intBlue:
      imgVillage=gameArt.villageBlue.copy();
      imgCity=gameArt.cityBlue.copy();
      yourTurnX=x-10;
      yourTurnY=y-10;
      break;

    case intYellow:
      imgVillage=gameArt.villageYellow.copy();
      imgCity=gameArt.cityYellow.copy();
      yourTurnX=x+w+10;
      yourTurnY=y-10;
      break;

    default:
      println("colID Error 2061: "+colID );
      exit();
      break;
    }//switch 
    //
  }//constr

  void display() {

    stroke(col);
    fill(160); 
    rect(x, y, w, h);

    stroke(col);
    noFill(); 
    rect(x+4, y+4, w-8, h-8);

    textAlign(CENTER); // center
    textSize (33);
    fill(col);
    text(name, x+w/2, y+h-22 );
    text(name, x+w/2-1, y+h-22-1 );
    text(name, x+w/2+1, y+h-22+1 );
    textAlign(LEFT); // reset

    image(imgVillage, x+16, y+23);
    image(imgCity, x+52, y+23);
  } // method

  void displayMyTurn() {
    fill(col); 
    textSize (33);
    text("Your Turn", yourTurnX, yourTurnY);
  }

  //
}//class
//