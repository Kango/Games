


void initGrid() {
  for (int i = 0; i < 15; i++) {
    for (int j = 0; j < 15; j++) {
      grid[i][j] = new Cell(i, j); // set all cells to type default
    }
  }
  setSpecialTypes();
}

void setSpecialTypes() {

  // source http://bazaar.launchpad.net/~guillaumemiranda/javascrabble/gandalf/view/head:/src/principale/Plateau.java

  grid[7][7].setType(gridStar);

  // case  motcomptetriple
  grid[0][0].setType(gridmotcomptetriple);
  grid[14][14].setType(gridmotcomptetriple);
  grid[14][0].setType(gridmotcomptetriple);
  grid[0][14].setType(gridmotcomptetriple);
  grid[0][7].setType(gridmotcomptetriple);
  grid[7][0].setType(gridmotcomptetriple);
  grid[14][7].setType(gridmotcomptetriple);
  grid[7][14].setType(gridmotcomptetriple);

  // case motcomptedouble
  grid[1][1].setType(gridmotcomptedouble);
  grid[2][2].setType(gridmotcomptedouble);
  grid[3][3].setType(gridmotcomptedouble);
  grid[4][4].setType(gridmotcomptedouble);
  grid[10][10].setType(gridmotcomptedouble);
  grid[11][11].setType(gridmotcomptedouble);
  grid[12][12].setType(gridmotcomptedouble);
  grid[13][13].setType(gridmotcomptedouble);
  grid[13][1].setType(gridmotcomptedouble);
  grid[12][2].setType(gridmotcomptedouble);
  grid[11][3].setType(gridmotcomptedouble);
  grid[10][4].setType(gridmotcomptedouble);
  grid[4][10].setType(gridmotcomptedouble);
  grid[3][11].setType(gridmotcomptedouble);
  grid[2][12].setType(gridmotcomptedouble);
  grid[1][13].setType(gridmotcomptedouble);

  // case lettrecomptedouble
  grid[3][0].setType(gridlettrecomptedouble);
  grid[11][7].setType(gridlettrecomptedouble);
  grid[7][11].setType(gridlettrecomptedouble);
  grid[6][12].setType(gridlettrecomptedouble);
  grid[8][12].setType(gridlettrecomptedouble);
  grid[12][8].setType(gridlettrecomptedouble);
  grid[12][6].setType(gridlettrecomptedouble);
  grid[2][6].setType(gridlettrecomptedouble);
  grid[2][8].setType(gridlettrecomptedouble);
  grid[3][7].setType(gridlettrecomptedouble);
  grid[7][4].setType(gridlettrecomptedouble);
  grid[8][3].setType(gridlettrecomptedouble);
  grid[6][3].setType(gridlettrecomptedouble);
  grid[14][11].setType(gridlettrecomptedouble);
  grid[11][14].setType(gridlettrecomptedouble);
  grid[14][3].setType(gridlettrecomptedouble);
  grid[3][14].setType(gridlettrecomptedouble);
  grid[0][11].setType(gridlettrecomptedouble);
  grid[11][0].setType(gridlettrecomptedouble);
  grid[6][6].setType(gridlettrecomptedouble);
  grid[6][8].setType(gridlettrecomptedouble);
  grid[8][6].setType(gridlettrecomptedouble);
  grid[8][8].setType(gridlettrecomptedouble);
  grid[0][3].setType(gridlettrecomptedouble);

  // case lettrecomptetriple
  grid[5][1].setType(gridlettrecomptetriple);
  grid[13][9].setType(gridlettrecomptetriple);
  grid[9][13].setType(gridlettrecomptetriple);
  grid[5][13].setType(gridlettrecomptetriple);
  grid[13][5].setType(gridlettrecomptetriple);
  grid[9][9].setType(gridlettrecomptetriple);
  grid[5][5].setType(gridlettrecomptetriple);
  grid[5][9].setType(gridlettrecomptetriple);
  grid[9][5].setType(gridlettrecomptetriple);
  grid[9][1].setType(gridlettrecomptetriple);
  grid[1][9].setType(gridlettrecomptetriple);
  grid[1][5].setType(gridlettrecomptetriple);
}// func
//