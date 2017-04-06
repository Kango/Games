


// Tools for MsgBox. 

void MsgBox( String Msg, String Titel ) {

  // Messages 
  // is bad, but works better with noLoop() before and loop() after. 

  //if (!(status==statusComputerMove)) {
  noLoop();
  javax.swing.JOptionPane.showMessageDialog 
    ( null, Msg, Titel, javax.swing.JOptionPane.INFORMATION_MESSAGE );
  loop(); 
  mousePressed = false; 
  mouseButton = -1;   
  //}
}

int MsgBoxAsk( String Msg, String Titel ) {

  // Messages: Ask 
  // is bad, but works better with noLoop() before and loop() after. 
  int answer=0; 

  noLoop();
  answer = javax.swing.JOptionPane.showConfirmDialog 
    ( null, Msg, Titel, javax.swing.JOptionPane.YES_NO_OPTION,  
  javax.swing.JOptionPane.QUESTION_MESSAGE );
  loop(); 
  return (answer);
}