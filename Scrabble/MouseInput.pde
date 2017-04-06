
// mouse

void mousePressed() {

  // check 2 buttons 
  if ( button0.mouseOver() &&  whichPlayersMove == 0  ) {
    placeLetterOnMainGrid(letterStackLeft, pointsLeft);
    // fill up stones   
    steineErgaenzen (letterStackLeft);
    if (stateInputLeft==Phase2||stateInputLeft==DrawLetters) {
      whichPlayersMove = 1; // change player
      button0.farbe=GRAY;
      button1.farbe=GREEN;
      stateInputLeft=Phase1;
      button0.text1="Finish move";
    } else 
    {
      stateInputLeft=Phase2;
      button0.text1="Move OK";
    }
    return; // hard exit
  } else if ( button1.mouseOver() && whichPlayersMove == 1 ) {
    placeLetterOnMainGrid(letterStackRight, pointsRight);
   // fill up stones
    steineErgaenzen(letterStackRight);
    if (stateInputRight==Phase2||stateInputRight==DrawLetters) {
      whichPlayersMove = 0; // change player
      button0.farbe=GREEN;
      button1.farbe=GRAY;
      stateInputRight=Phase1;
      button1.text1="Finish move";
    } else 
    {
      stateInputRight=Phase2;
      button1.text1="Move OK";
    }
    return; // hard exit
  }

  // ------------------------------------

  // check stones in letterStack against mouse 
  // (begin of drag and drop) 
  if ( whichPlayersMove == 0 ) {
    testLetterStackAgainstMouse(letterStackLeft);
  } else if ( whichPlayersMove == 1 ) {
    testLetterStackAgainstMouse(letterStackRight);
  } //else
}// func 

void mouseReleased() {

  // end of drag and drop 

  hold=false;

  if ( whichPlayersMove == 0 ) {
    placeLetterOnMainGridTest(letterStackLeft);
  }//if
  else if ( whichPlayersMove == 1 ) {
    placeLetterOnMainGridTest(letterStackRight);
  }//else
}//sub routine
//