
// mouse

void mousePressed() {

  if (state==startScreen) {
    state=normalGame; 
    return;
  }//if

  // check 2 buttons 
  if ( button0.mouseOver() &&  whichPlayersMove == 0  ) {
    placeLetterOnMainGrid(letterStack1, whichPlayersMove);
    // fill up stones   
    fillUpLetterStack (letterStack1);
    if (stateInputLeft==Phase2||stateInputLeft==DrawLetters) {
      whichPlayersMove = 1; // change player
      button0.colorButton=BLACK;
      button1.colorButton=GREEN;
      stateInputLeft=Phase1;
      button0.text1="Finish move";
    } else 
    {
      stateInputLeft=Phase2;
      button0.text1="Move OK";
    }
    return; // hard exit
  } else if ( button1.mouseOver() && whichPlayersMove == 1 ) {
    placeLetterOnMainGrid(letterStack2, whichPlayersMove);
    // fill up stones
    fillUpLetterStack(letterStack2);
    if (stateInputRight==Phase2||stateInputRight==DrawLetters) {
      whichPlayersMove = 0; // change player
      button0.colorButton=GREEN;
      button1.colorButton=BLACK;
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
    testLetterStackAgainstMouse(letterStack1);
  } else if ( whichPlayersMove == 1 ) {
    testLetterStackAgainstMouse(letterStack2);
  } //else
}// func 

void mouseReleased() {

  // end of drag and drop 

  hold=false;

  if ( whichPlayersMove == 0 ) {
    placeLetterOnMainGridTest(letterStack1);
  }//if
  else if ( whichPlayersMove == 1 ) {
    placeLetterOnMainGridTest(letterStack2);
  }//else
}//sub routine
//