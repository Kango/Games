
// TextArea

void TextAdd (String Text1) {
  textMode(SHAPE);
  myTextarea.setText ( myTextarea.stringValue() +  "\n" + Text1 );
}

void TextAreaInit () {
  textMode(SHAPE);
  controlP5 = new ControlP5(this);
  textSize(32) ;
  myTextarea = controlP5.addTextarea(
    "label1", 
    "Welcome to TicTacToe 3D", 
    width-310, height-270, 300, 260);
  //  controlP5.addSlider("changeWidth",0,200,100,100,20,100,9);
  //  controlP5.addSlider("changeHeight",0,200,100,100,60,100,9);
  myTextarea.setColor(0xff0000);
  myTextarea.setColorForeground(0xffff0000);
  myTextarea.setLineHeight(14);
  textSize(32) ;
  textMode(MODEL);
}