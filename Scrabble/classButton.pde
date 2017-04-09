

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
    fill(colorButton);
    textSize(18); 
    textAlign(CENTER); 
    text(text1, x, y);
  }

  boolean mouseOver() {
    // think of a rect around the buttons: 
    return mouseX>x-190 &&
      mouseY>y-30&&
      mouseX<x+210 &&
      mouseY<y+30;
  }// sub routine
  //
}// class 
// 