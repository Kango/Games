

void generateMainGrid() {

  // fill 2D array with a standard nested for-loop:
  // main game board  
  for (int x=0; x<max1; x++) {
    for (int y=0; y<max1; y++) {
      mainGrid[x][y] = new Cell (40*x+12, y*40+12, GREEN, true);
    }
  }

  /*
  // set special cells in the field above 
   mainGrid[0][0].cellColor=RED;
   mainGrid[max1-1][0].cellColor=RED;
   mainGrid[0][max1-1].cellColor=RED;
   mainGrid[max1-1][max1-1].cellColor=RED;
   */

  int middle = int((max1-1)/2);
  mainGrid[middle][middle].setStar();
  mainGrid[middle][middle].cellColor=color(#F0B3A7);
}
//