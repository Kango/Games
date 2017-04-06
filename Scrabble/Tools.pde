

void showLinesAroundLetterStack( Cell[] c, int linkeLine   ) {

  // lines

  if ( whichPlayersMove == linkeLine ) 
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