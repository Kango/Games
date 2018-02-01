

void keyPressed() {

  if (key==ESC) {
    // close the display of the building costs card 
    showBuildingCosts=false;  
    // close the placing state
    placing = placingNothing;
    // kill Escape 
    key=0;
  } else if (key=='x') {
    // quit 
    exit();
  } else if (key==' ') {
    doCommandMouse(1);
  } else if (key=='b') {
    // display of the building costs card On/Off
    showBuildingCosts=!showBuildingCosts;
  }

  // -------------------------------
  // start placing mode  
  else if (key=='s') {
    //
    placing = placingstreet;
  }//else if 
  else if (key=='v') {
    //
    placing = placingvillage;
  }//else if 
  else if (key=='c') {
    //
    placing = placingcity;
  }//else if
    else if (key=='t') {
    //
    placing = placingThief;
  }//else if
  //
} //func 
//