
// the 2 rects for the score tables 

class ScoreTable {

  float x, y, w, h; 
  String text=""; 
  boolean isActive = false; 

  int timeStart=0; 

  int playerItBelongsTo = -1;  

  // constr
  ScoreTable ( float x_, float y_, 
    float w_, float h_, 
    int playerItBelongsTo_) {

    x=x_;
    y=y_;

    w=w_;
    h=h_;

    playerItBelongsTo=playerItBelongsTo_;
  } // constr 

  void setText(String t1) {
    text=t1; 
    timeStart=millis();
  }

  void display() {

    // display box and text 

    if (!isActive) 
      return; 

    // when it's empty, we don't want it to show at all
    if (text.equals(""))
      return; 

    // light green 
    fill( 139, 240, 75 );
    stroke(0); 
    rect(x, y, w, h); 

    textSize(16);
    textAlign(LEFT, TOP);
    fill(0); 
    text(text, x+7, y+7);

    textAlign(CENTER, CENTER);
    textSize(22);

    if (millis()-timeStart > 10000 && 
    whichPlayersMove!=playerItBelongsTo) {
      // set it inactive
      text="";
      isActive=false;
    } else {
      // empty
    }//else 
    //
  }//method 
  //
}// class 
//