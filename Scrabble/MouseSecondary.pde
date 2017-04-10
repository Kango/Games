
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

void fillUpLetterStack (Cell[] letterStack) {
  // fill up the stones on letter stack
  for (int i=0; i<8; i++) {
    if (!letterStack[i].exist) {
      letterStack[i].exist=true;
      // we try to replace the letter from Heap
      if (allLettersPosition < allLetters.length()) {
        // get from Heap
        letterStack[i].cellLetter = allLetters.charAt(allLettersPosition); 
        allLettersPosition++; // increase pos in heap
      } else {
        // no letter in Heap left, set exist to false in letter stack 
        letterStack[i].exist=false;
      }
      letterStack[i].setBackToOriginalPosition();
    }//if
    else {
      letterStack[i].setBackToOriginalPosition();
    }//else
  }//for
}//func 

void placeLetterOnMainGridTest(Cell[] letterStack) {

  // place letters temporarily so the player can still move them 

  // with the mouse we lay a letter to the main grid
  // above (player can lay this temporarily)

  letterStack[holding].docked=false; 

  for (int i2=0; i2<max1; i2++) {
    for (int i=0; i<max1; i++) {

      if ( mainGrid[i2][i].near(letterStack[holding]) ) {
        letterStack[holding].docked = true;
        return;
      }// if
    }
  }
} // func

void placeLetterOnMainGrid(Cell[] letterStack, int whichPlayersMove) {

  // place letters finally for good 

  // with the mouse we lay a letter to the main grid above

  // ArrayList holds the positions on the main grid as x,y for all placed letters
  ArrayList<PVectorInt> listOfIndexes = new ArrayList();  

  // compare each letter from player to entire grid

  for (int iLetterStack=0; iLetterStack<8; iLetterStack++) {

    // compare each letter from player to entire grid 
    for (int i2=0; i2<max1; i2++) {
      for (int i=0; i<max1; i++) {

        if ( mainGrid[i2][i].near(letterStack[iLetterStack]) ) {

          mainGrid[i2][i].copyFrom(letterStack[iLetterStack]); // copy

          // add to list of main grid positions 
          listOfIndexes.add(new PVectorInt(i2, i)); 

          //remove from letterStack 
          letterStack[iLetterStack].exist = false;
          letterStack[iLetterStack].docked = false; 
          // return;
        } // if
      } // for
    } // for
  } // for 

  // all letters are put to the grid;
  // now calculate the score 
  calculateScore(listOfIndexes);  // calculate score   

  // set score table 
  if (whichPlayersMove==0) {
    scoreTables[0].isActive=true; 
    if (scoreTable.length()>0)
      scoreTables[0].setText(scoreTable);
  } else if (whichPlayersMove==1) {
    scoreTables[1].isActive=true;
    if (scoreTable.length()>0)
      scoreTables[1].setText(scoreTable);
  } else {
    println ("Error 91");
    exit();
  }//else 
  //
} // func
//