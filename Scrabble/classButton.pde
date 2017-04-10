

class Button {

  // 2 green buttons for the players

  float x, y; 
  String text1;
  color colorButton; 

  // constr
  Button(String textTemp, 
    float xTemp, float yTemp, 
    color colorButtonTemp) {
    text1 = textTemp;
    x     = xTemp;
    y     = yTemp;
    colorButton = colorButtonTemp;
  }

  void display() {
    if (colorButton != BLACK) {
      pushStyle();
      strokeWeight(2);
      stroke(255);
      fill(BLACK);
      rectMode(CENTER);
      rect(x, y, 300, 40, 5);
      fill(colorButton);
      textSize(22); 
      textAlign(CENTER); 
      text(text1, x, y + 5);
      popStyle();
    }
  }

  boolean mouseOver() {
    // think of a rect around the buttons: 
    return mouseX>x-140 &&
      mouseY>y-20&&
      mouseX<x+160 &&
      mouseY<y+20;
  }// sub routine
  //
}// class 
// 