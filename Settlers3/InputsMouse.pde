

void mouseMoved() {

  // store time since last mouse moved
  timeSinceLastMouseMoved=millis();
} //func

void mousePressed() {

  // (depending on state)

  // mouse pressed 

  // store time since last mouse moved / pressed  
  timeSinceLastMouseMoved = millis();

  boolean done=false;
  for (int i=0; i<btnLengthInMainMenu; i++) {
    if (rectButtons.get(i).over() && !done) {
      done = true;
      doCommandMouse(i); // very important function 
      break;
    } // if
  } // for

  if (!done) {
    switch (placing) {

    case placingstreet: 
      // the hexagons      
      for (int i = 0; i < hexagons.length; i++) {
        if (hexagons[i].checkStreetPlacement ())
          return;
      } // for
      break;

    case placingvillage: 
      // the hexagons      
      for (int i = 0; i < hexagons.length; i++) {
        if (hexagons[i].checkVillagePlacement())
          return;
      } // for
      break;

    case placingcity: 
      // the hexagons      
      for (int i = 0; i < hexagons.length; i++) {
        if (hexagons[i].checkCityPlacement())
          return;
      } // for
      break;

    case placingThief:
     // the hexagons      
      for (int i = 0; i < hexagons.length; i++) {
        if (hexagons[i].checkThiefPlacement())
          return;
      } // for
      break;
    }//switch
  }//if ! done
  //
}//func 

void doCommandMouse(int commandNumber) {
  switch (commandNumber) {
  case 0:
    showBuildingCosts=!showBuildingCosts;
    break;
    
    case 1:
      // next player (space bar)
      dice_roll();
    whoseMoveIsIt++;
    if (whoseMoveIsIt>3) 
      whoseMoveIsIt=0;
    // close the placing state
    placing = placingNothing;
    break;

  default:
    println("Unidentified button command in doCommandMouse "+ commandNumber);
    exit();
    break;
  }//switch
}
//