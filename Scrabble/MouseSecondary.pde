
// secondary mouse : called by mouse functions ----------

void testLetterStackAgainstMouse(Cell[] letterStack) {
  for (int i=0; i<8; i++) {
    if (letterStack[i].mouseOver()) {
      hold = true; 
      holding = i;
      return; // hard quit
    }
  }
} 

void steineErgaenzen (Cell[] letterStack) {
  // fill up the stones on letter stack
  for (int i=0; i<8; i++) {
    if (!letterStack[i].exist) {
      letterStack[i].exist=true;
      if (allLettersPosition < allLetters.length()) {
        letterStack[i].cellLetter = allLetters.charAt(allLettersPosition); 
        allLettersPosition++;
      }
      letterStack[i].setBackToOriginalPosition();
    }
  }
}

void placeLetterOnMainGrid(Cell[] letterStack, int whichPlayersMove) {

  // with the mouse we lay a letter to the main grid above

  for (int iLetterStack=0; iLetterStack<8; iLetterStack++) {

    for (int i2=0; i2<max1; i2++) {
      for (int i=0; i<max1; i++) {

        if ( mainGrid[i2][i].near(letterStack[iLetterStack]) ) {
          mainGrid[i2][i].copyFrom(letterStack[iLetterStack]); // copy

          int value1 = hashMapPointsOfLetter.get(letterStack[iLetterStack].cellLetter+"");
          println (letterStack[iLetterStack].cellLetter+ ": "+value1);
          if (whichPlayersMove==0) 
            pointsLeft += value1;
          else pointsRight += value1;
          //
          letterStack[iLetterStack].exist = false;
          letterStack[iLetterStack].docked = false; 
          // return;
        }// if
      }
    }
  }
} // func

void placeLetterOnMainGridTest(Cell[] letterStack) {

  // with the mouse we lay a letter to the main grid
  // above (test)

  letterStack[holding].docked=false; 

  for (int i2=0; i2<max1; i2++) {
    for (int i=0; i<max1; i++) {

      if ( mainGrid[i2][i].near(letterStack[holding]) ) {
        //  mainGrid[i2][i].copyFrom(letterStack[holding]); // copy
        letterStack[holding].docked = true;
        return;
      }// if
    }
  }
} // func
//