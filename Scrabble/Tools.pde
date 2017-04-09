
// minor tools 

void checkGameOver() {

  int conditionsCounter = 0; 

  if (allLettersPosition >= allLetters.length()) {
    conditionsCounter++;
  }

  if (isLetterStackEmpty(letterStackLeft)) {
    conditionsCounter++;
  }

  if (isLetterStackEmpty(letterStackRight)) {
    conditionsCounter++;
  }

  if (conditionsCounter>=3) 
    state=gameOver;
}//func 

boolean isLetterStackEmpty (Cell[] letterStack) {
  // 
  for (int i=0; i<8; i++) {
    if (letterStack[i].exist) {
      return false;
    }
  }//for 
  // all were not existing: 
  return true;
}

void showLetterStacks() {

  // letters letterStack left 
  for (int i=0; i<8; i++) {
    letterStackLeft[i].display();
  }

  // letters letterStack right 
  for (int i=0; i<8; i++) {
    letterStackRight[i].display();
  }

  // Lines letterStack
  showLinesAroundLetterStack( letterStackLeft, 0 ); // 0 says: letterStack Left 

  // Lines letterStack
  showLinesAroundLetterStack( letterStackRight, 1 ); // 1 means: letterStack Right
}

void showMinorStuff() {

  // display quantity remaining letters in the Heap  (upper right corner)
  fill(255);
  text(allLetters.length() - allLettersPosition, width-66, 66);

  // display points players 
  fill(255);
  text(pointsLeft, 30, height-120); 
  text(pointsRight, width - 30, height-120);

  // display score tables 
  for (int i = 0; i<scoreTables.length; i++) {  
    scoreTables[i].display();
  }//for
}

void showLinesAroundLetterStack( Cell[] c, int leftLine   ) {

  // lines

  if ( whichPlayersMove == leftLine ) 
    stroke (GREEN); 
  else 
  stroke(GRAY); 

  strokeWeight(3); 
  line(
    c[0].xOriginal-3, 
    c[0].yOriginal-3, 
    c[7].xOriginal + c[7].diameter+3, 
    c[7].yOriginal-3); 

  line(
    c[0].xOriginal-3, 
    c[0].yOriginal + c[7].diameter+3, 
    c[7].xOriginal + c[7].diameter+3, 
    c[7].yOriginal + c[7].diameter+3); 

  //reset
  strokeWeight(1);
}

void draggingALetter() {

  // while dragging

  if (hold) {
    if ( whichPlayersMove == 0 ) {
      letterStackLeft[holding].x=mouseX;
      letterStackLeft[holding].y=mouseY;
    } else if ( whichPlayersMove == 1 ) {
      letterStackRight[holding].x=mouseX;
      letterStackRight[holding].y=mouseY;
    }

    if ( whichPlayersMove == 0 ) {
      placeLetterOnMainGridTest(letterStackLeft);
    }//if
    else if ( whichPlayersMove == 1 ) {
      placeLetterOnMainGridTest(letterStackRight);
    }//else
  }// if hold
}
//