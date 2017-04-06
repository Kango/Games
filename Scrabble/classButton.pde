

class Button {
  
  // 2 green buttons for the players

  String text1;
  float x, y; 
  color farbe; 

  // constr
  Button(String textTemp, 
    float xTemp, float yTemp, 
    color farbeTemp) {
    text1 = textTemp;
    x     = xTemp;
    y     = yTemp;
    farbe = farbeTemp;
  }

  void display() {
    fill(farbe);
    textSize(18); 
    text(text1, x, y);
  }

  boolean mouseOver() {
    // ein gedachter Kasten um die Button
    return mouseX>x-190 &&
      mouseY>y-30&&
      mouseX<x+210 &&
      mouseY<y+30;
  }// sub routine
  //
}// class 
// 