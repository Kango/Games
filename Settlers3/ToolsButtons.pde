


// command buttons on the screen 
// functions and classes 

// -----------------------------------------------------------------------------------------
// Init Buttons

void setupButtons() {

  // for the command-buttons on the right side of the screen
  int CmdButtonsX = width-70; 
  int CmdButtonsAbstand = 60; 
  int j = 0;

  // ---------------------------------------------

  // Init Buttons top left command bar
  for (int x=0; x < btnLengthInMainMenu; x++) {    
    // Using a multiple of x means the buttons aren't all on top of each other (and 20 is the distance to the left screen border)
    int xPos =  10; 
    rectButtons.add(new RectButton(xPos, height/2, 210, 52, col1, col2, true, "commandBarMain", 0, "", "", null, x));
  } // for

  int i;

  // -------------

  i=0; 
  rectButtons.get(i).ToolTipText =  "Show card with the list of building costs";
  rectButtons.get(i).Text = "Show Building Costs";
  rectButtons.get(i).btnImage = null;

  rectButtons.get(i).basecolor = color(0, 255, 0); //green
  rectButtons.get(i).highlightcolor = color(0, 255, 0); //green
  rectButtons.get(i).currentcolor = color(0, 255, 0); //green

  i=1; 
  rectButtons.get(i).ToolTipText =  "Next Player";
  rectButtons.get(i).Text = "";
  rectButtons.get(i).btnImage = null;
  rectButtons.get(i).setPosition( 0, 279, 240, 110 );

  rectButtons.get(i).basecolor = color(0, 255, 0); //green
  rectButtons.get(i).highlightcolor = color(0, 255, 0); //green
  rectButtons.get(i).currentcolor = color(0, 255, 0); //green
  rectButtons.get(i).Exists = false;
}//func 

void showButtons() { 
  // show buttons 

  for (RectButton btn : rectButtons) {
    btn.update();
    btn.display();
  }
  // buttons 
  for (RectButton btn : rectButtons) {
    btn.toolTip();
  }

  // for tool tip
  // getDataToDecideIfToolTipText();
} // func 