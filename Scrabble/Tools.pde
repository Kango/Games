
// minor tools 

void showWelcomeScreen() {

  String text1="Welcome to Scrabble";
  String text2="Welcome";

  Cell[] letterWelcome = new Cell[text1.length()]; 
  Cell[] letterWelcome2 = new Cell[text2.length()];

  // define 
  for (int i=0; i<text1.length(); i++) {
    letterWelcome[i] = 
      new Cell (40*i + 80, 280, color(#F0E2B3), true);
    letterWelcome[i].cellLetter = text1.charAt(i);
  }

  // define 
  for (int i=0; i<text2.length(); i++) {
    letterWelcome2[i] = 
      new Cell (40*1 + 80, i*40+280-(1*40), color(#F0E2B3), true);
    letterWelcome2[i].cellLetter = text2.charAt(i);
  }

  // display I 
  for (int i=0; i<text1.length(); i++) {
    letterWelcome[i].display();
  }

  // display II 
  for (int i=0; i<text2.length(); i++) {
    letterWelcome2[i].display();
  }

  // further text
  fill(255);
  textAlign(LEFT);
  textSize(22); 
  text("Two players make their moves alternating.\n"
    +"At the beginning click 'Draw Letters' to get 8 letters.\n"
    +"To make a move drag the letters from your 8 letter stack\n"
    +"to the big main field left. When you placed your word\n"
    +"click 'Finish move' and 'Move OK'.\n\n"
    +"You receive new letters so you have 8 letters again.\n"
    +"Now it's your friend's move.\n\n", 280+40, 422);
} //func 

void checkGameOver() {

  int conditionsCounter = 0; 

  if (allLettersPosition >= allLetters.length()) {
    conditionsCounter++;
  }

  if (isLetterStackEmpty(letterStack1)) {
    conditionsCounter++;
  }

  if (isLetterStackEmpty(letterStack2)) {
    conditionsCounter++;
  }

  if (conditionsCounter>=3) 
    state=gameOver;
}//func 

boolean isLetterStackEmpty (Cell[] letterStack) {
  // this is for game over checks 
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
    letterStack1[i].display();
  }

  // letters letterStack right 
  for (int i=0; i<8; i++) {
    letterStack2[i].display();
  }

  // Lines letterStack
  showLinesAroundLetterStack( letterStack1, 0 ); // 0 says: letterStack Left 

  // Lines letterStack
  showLinesAroundLetterStack( letterStack2, 1 ); // 1 means: letterStack Right
}

void initScoreTable() { 
  // ScoreTable init
  int widthScoreTable = 100;
  int heightScoreTable = 280;

  float xpos = letterStack1[0].xOriginal-3; 
  scoreTables[0]=new ScoreTable( xpos, 400, widthScoreTable, heightScoreTable, 0);

  xpos = letterStack1[7].xOriginal + letterStack1[7].diameter+3 - widthScoreTable; 
  scoreTables[1]=new ScoreTable( xpos, 400, widthScoreTable, heightScoreTable, 1);
}// func 

void showMinorStuff() {

  // display quantity remaining letters in the Heap  (upper right corner)
  fill(255);
  textSize(16);
  text("Letters left\non the Heap\n"
    +str(allLetters.length() - allLettersPosition), 
    width-66, 66);
  textSize(26);

  // display points players 
  fill(255);
  text("Player 1: " + pointsLeft, 1150, height-160); 
  text("Player 2: " + pointsRight, 1150, height-120);

  // display score tables 
  for (int i = 0; i<scoreTables.length; i++) {  
    scoreTables[i].display();
  }//for
}// func 

// --------------------------------------------------------------

void showLinesAroundLetterStack( Cell[] c, int leftLine   ) {

  // lines

  if ( whichPlayersMove == leftLine ) 
    stroke (GREEN); 
  else 
  stroke(144); // I modified this CR 

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
      letterStack1[holding].x=mouseX;
      letterStack1[holding].y=mouseY;
    } else if ( whichPlayersMove == 1 ) {
      letterStack2[holding].x=mouseX;
      letterStack2[holding].y=mouseY;
    }

    if ( whichPlayersMove == 0 ) {
      placeLetterOnMainGridTest(letterStack1);
    }//if
    else if ( whichPlayersMove == 1 ) {
      placeLetterOnMainGridTest(letterStack2);
    }//else
  }// if hold
}
//