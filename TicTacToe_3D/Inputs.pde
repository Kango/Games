

// get the inputs 


void keyPressed() {
  if (key == CODED) {
    // keyCode auswerten 
    switch (keyCode) { 
    case 112: 
      // F1: Help
      HelpMsgBox();
      break; 
    default: 
      // do nothing 
      break;
    } // switch
  } else {   
    // not key == CODED 
    background(0);
    if (key == 'c') {    
      // background(0);
    } else
    {
      // nothing
    }
  }
}

// ==========================================================

void mouseReleased() 
  // Mausknopf losgelassen
{
  boolean done = false; 
  // Wenn linke Taste  
  if  (mouseButton == LEFT) {
    // Alle Buttons durchgehen

    for (int i=0; i<btnLength; i++) {
      rectBt[i].basecolor = col1;  
      // Wenn Schaltfläche gedrückt 
      if (rectBt[i].pressed()) {  
        done = true; 

        if ( i == 1 ) {
          TextAdd("Neu");
          println("Neu");
          for (int n = 0; n < 3; n++) {
            for (int j = 0; j < 3; j = j+1) {
              for (int k = 0; k < 3; k = k+1) { 
                myArray[n][j][k] = 1;
              }
            }
          }
          GameField();
        } else if ( i == 2) {
          TextAdd("Verlassen");
          println("Verlassen");  // Verlassen 
          exit();
        } else {
          // do nothing
        }
      }
    }
  }

  if (done != true) {
    mouseReleasedBoard () ;
  }
}

// ==========================================================

void mouseReleasedBoard () {
  // mouse evaluate. 
  // Check what's been pressed by the mouse.

  boolean done = false; 

  // Wenn linke Taste UND camera not mouse controlled
  if ((mouseButton == LEFT) && 
    (camIsMouseControlled==false)) {  
    // by Quark: http://www.lagers.org.uk/s3d4p/index.html
    Shape3D picked = Shape3D.pickShape(this, mouseX, mouseY);
    if (picked != null) {
      done = true; 
      MakeHumanMove(picked.tagNo);
    }
  }
} // mouseClicked