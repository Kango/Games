

// Dice; by TfGuy44

void dice_roll() {
  for (int i=0; i < NUM_DICE; i++) {
    rolls[i]=1 + int(random(NUM_SIDES));
  }
}

void die_draw(int position, int value) {
  /*   Draw one die in the canvas.
   *   position - must be 0..NUM_DICE-1, indicating which die is being drawn
   *   value - must be 1..6, the amount showing on that die
   */
  final float X_SPACING = 46;  //   (float)width/NUM_DICE; //X spacing of the dice
  final float DIE_SIZE = X_SPACING*0.8; //width and height of one die
  final float X_LEFT_DIE = 59; //;X_SPACING*0.1; //left side of the leftmost die
  final float Y_OFFSET = 0; // X_SPACING*0.15; //slight Y offset of the odd-numbered ones
  final float Y_POSITION = 290; // height-DIE_SIZE-Y_OFFSET; //Y coordinate of most dice
  final float PIP_OFFSET = DIE_SIZE/3.5; //Distance from centre to pips, and between pips
  final float PIP_DIAM = DIE_SIZE/5; //Diameter of the pips (dots)

  //From the constants above, and which die it is, find its top left corner
  float dieX = X_LEFT_DIE+position*X_SPACING;
  float dieY = Y_POSITION-Y_OFFSET*(position%2);

  //1.Draw a red square with a black outline
  stroke(0); //Black outline
  fill(255, 0, 0); //Red fill
  rect(dieX, dieY, DIE_SIZE, DIE_SIZE);

  //2.Draw the pips (dots)
  fill(255); //White dots
  stroke(255); //White outline

  //The centre dot (if the value is odd)
  if (1 == value%2) {
    ellipse(dieX+DIE_SIZE/2, dieY+DIE_SIZE/2, PIP_DIAM, PIP_DIAM);
  }

  //The top-left and bottom-right dots (if the value is more than 1)
  if (value>1) {
    ellipse(dieX+DIE_SIZE/2-PIP_OFFSET, 
      dieY+DIE_SIZE/2+PIP_OFFSET, PIP_DIAM, PIP_DIAM);
    ellipse(dieX+DIE_SIZE/2+PIP_OFFSET, 
      dieY+DIE_SIZE/2-PIP_OFFSET, PIP_DIAM, PIP_DIAM);
  }

  //The bottom-left and top-right dots (if the value is more than 3)
  if (value>3) {
    ellipse(dieX+DIE_SIZE/2+PIP_OFFSET, 
      dieY+DIE_SIZE/2+PIP_OFFSET, PIP_DIAM, PIP_DIAM);
    ellipse(dieX+DIE_SIZE/2-PIP_OFFSET, 
      dieY+DIE_SIZE/2-PIP_OFFSET, PIP_DIAM, PIP_DIAM);
  }

  //The left and right dots (only if the value is 6)
  if (value==6) {
    ellipse(dieX+DIE_SIZE/2-PIP_OFFSET, 
      dieY+DIE_SIZE/2, PIP_DIAM, PIP_DIAM);
    ellipse(dieX+DIE_SIZE/2+PIP_OFFSET, 
      dieY+DIE_SIZE/2, PIP_DIAM, PIP_DIAM);
  }
}
//