
// tools for calculating the score 

void calculateScore(ArrayList<PVectorInt> listOfIndexes) {

  // depending on how many letters where placed 

  scoreTable=""; 

  if (listOfIndexes.size()==0) {
    // no letters -  this occurs on start up (OK) 
    println ("zero");
    return;
  } else if (listOfIndexes.size()==1) {
    // one letter 
    println ("one");
    normalScoring(listOfIndexes, true);
  } else if (listOfIndexes.size()>1 && listOfIndexes.size()<=8) {
    // many letters
    normalScoring(listOfIndexes, false);
  } else if (listOfIndexes.size()>8) {
    // too many letters : error 
    println("too many letters : Error 29");
  }//
}//func

void normalScoring (ArrayList<PVectorInt> listOfIndexes, boolean oneLetter) {

  // many letters

  PVectorInt currentPV2 = null; 

  PVectorInt currentPV1 = listOfIndexes.get(0);
  if (!oneLetter) {
    currentPV2 = listOfIndexes.get(1);
  }
  boolean done = true; 
  if ((currentPV2!=null && currentPV1.x!=currentPV2.x && currentPV1.y==currentPV2.y) || oneLetter) {
    // horizontally ----->
    int xStart = minArrayX(listOfIndexes);
    int xEnd   = maxArrayX(listOfIndexes);
    xStart = extendHorizontallyLeft(xStart, currentPV1);
    xEnd = extendHorizontallyRight(xEnd, currentPV1);
    if (oneLetter&&xStart==xEnd)
      done = false; 
    if (done) {
      for (int i=xStart; i <= xEnd; i++) {
        int value1 = pointsOfLetter.get(mainGrid[i][currentPV1.y].cellLetter+"");
        scoreTableAdd( mainGrid[i][currentPV1.y].cellLetter, value1 ) ;
        addScore ( value1, whichPlayersMove );
      }
    }
  } 

  if ((currentPV2!=null && currentPV1.x==currentPV2.x && currentPV1.y!=currentPV2.y) || oneLetter&&!done) {
    // vertically   |
    int yStart = minArrayY(listOfIndexes);
    int yEnd   = maxArrayY(listOfIndexes);
    yStart = extendVerticallyUp(yStart, currentPV1);
    yEnd = extendVerticallyDown(yEnd, currentPV1);
    for (int i=yStart; i <= yEnd; i++) {
      int value1 = pointsOfLetter.get(mainGrid[currentPV1.x][i].cellLetter+"");
      scoreTableAdd(mainGrid[currentPV1.x][i].cellLetter, value1);
      addScore ( value1, whichPlayersMove );
    }
  } else { 
    // int value1 = pointsOfLetter.get(letterStack[iLetterStack].cellLetter+"");
    // println (letterStack[iLetterStack].cellLetter+ ": "+value1);
    println ("Error 84");
  }
}

void scoreTableAdd(char letter, int value) {
  if (letter==' ')
    return;

  scoreTable += letter + ": "+value + "\n";
}

// ------------------------------

int extendHorizontallyLeft(int start, PVectorInt currentPV1) {
  // left
  int result=start;
  if (mainGrid[result-1][currentPV1.y].cellLetter==' ') { 
    return start;
  }

  while (mainGrid[result][currentPV1.y].cellLetter!=' ') {
    result--;
  }
  return result+1;
}

int extendHorizontallyRight(int end, PVectorInt currentPV1) {
  // right
  int result=end;

  if (!isOK(new PVectorInt(result+1, currentPV1.y)))
    return end;

  if (mainGrid[result+1][currentPV1.y].cellLetter==' ') { 
    return end;
  }

  while (mainGrid[result][currentPV1.y].cellLetter!=' ') {
    result++;
  }
  return result-1;
}

int extendVerticallyUp(int start, PVectorInt currentPV1) {
  // up
  int result=start;
  if (mainGrid[currentPV1.x][result-1].cellLetter==' ') { 
    return start;
  }

  while (mainGrid[currentPV1.x][result].cellLetter!=' ') {
    result--;
  }
  return result;
}

int extendVerticallyDown(int end, PVectorInt currentPV1) {
  // dn
  int result=end;
  if (mainGrid[currentPV1.x][result+1].cellLetter==' ') { 
    return end;
  }

  while (mainGrid[currentPV1.x][result].cellLetter!=' ') {
    result++;
  }
  return result;
}

// ------------------------------

int neighbourLetter(PVectorInt currentPVOriginal) {
  //
  int value1=0;

  //copy
  PVectorInt currentPV = new PVectorInt (currentPVOriginal.x, currentPVOriginal.y); 
  currentPV.x--;
  if ( isOK(currentPV) ) {
    if (mainGrid[currentPV.x][currentPV.y].cellLetter!=' ') {
      value1 += pointsOfLetter.get(mainGrid[currentPV.x][currentPV.y].cellLetter+"");
      scoreTableAdd ( mainGrid[currentPV.x][currentPV.y].cellLetter, value1 );
    }
  }

  currentPV = new PVectorInt (currentPVOriginal.x, currentPVOriginal.y);
  currentPV.x++;
  if ( isOK(currentPV) ) {
    if (mainGrid[currentPV.x][currentPV.y].cellLetter!=' ') {
      value1 += pointsOfLetter.get(mainGrid[currentPV.x][currentPV.y].cellLetter+"");
      println (mainGrid[currentPV.x][currentPV.y].cellLetter+ ": "+value1);
    }
  }

  // ---

  currentPV = new PVectorInt (currentPVOriginal.x, currentPVOriginal.y); 
  currentPV.y--;
  if ( isOK(currentPV) ) {
    if (mainGrid[currentPV.x][currentPV.y].cellLetter!=' ') {
      value1 += pointsOfLetter.get(mainGrid[currentPV.x][currentPV.y].cellLetter+"");
      println (mainGrid[currentPV.x][currentPV.y].cellLetter+ ": "+value1);
    }
  }

  currentPV = new PVectorInt (currentPVOriginal.x, currentPVOriginal.y);
  currentPV.y++;
  if ( isOK(currentPV) ) {
    if (mainGrid[currentPV.x][currentPV.y].cellLetter!=' ') {
      value1 += pointsOfLetter.get(mainGrid[currentPV.x][currentPV.y].cellLetter+"");
      println (mainGrid[currentPV.x][currentPV.y].cellLetter+ ": "+value1);
    }
  }

  return value1;
}// func  

boolean isOK(PVectorInt currentPV) {
  // inside boundaries ? 
  return currentPV.x>=0 && currentPV.x<max1 && 
    currentPV.y>=0 && currentPV.y<max1;
}

void addScore(int value1, int whichPlayersMove) {

  // just adds to score

  if (whichPlayersMove==0) 
    pointsLeft += value1;
  else if (whichPlayersMove==1) 
    pointsRight += value1;
  else {
    // error
    println ("received a player index not 0 or 1 : error 137");
    exit();
  }//else
}//

// ------------------------------
// for minor functions for min and max 

int minArrayX(ArrayList<PVectorInt> listOfIndexes) {
  // func for X 
  int result = 1000; 
  for (PVectorInt  currentPV : listOfIndexes) {
    if (currentPV.x<=result) {
      result = currentPV.x;
    }
  }
  return result;
}//func 

int minArrayY(ArrayList<PVectorInt> listOfIndexes) {
  // func for Y 
  int result = 1000; 
  for (PVectorInt  currentPV : listOfIndexes) {
    if (currentPV.y<=result) {
      result = currentPV.y;
    }
  }
  return result;
}//func 


int maxArrayX(ArrayList<PVectorInt> listOfIndexes) {
  // func for X 
  int result = -1000; 
  for (PVectorInt  currentPV : listOfIndexes) {
    if (currentPV.x>=result) {
      result = currentPV.x;
    }
  }
  return result;
}//func 

int maxArrayY(ArrayList<PVectorInt> listOfIndexes) {
  // func for Y 
  int result = -1000; 
  for (PVectorInt  currentPV : listOfIndexes) {
    if (currentPV.y>=result) {
      result = currentPV.y;
    }
  }
  return result;
}//func 
//