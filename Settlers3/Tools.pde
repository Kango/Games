
// Tools in general 

void showHexagons() {

  // show the hexagons

  // don't unify these for-loops, streets etc. must be drawn later after the hexagons 

  for (int i = 0; i < hexagons.length; i++) {
    hexagons[i].display() ;
  } // for

  for (int i = 0; i < hexagons.length; i++) {
    hexagons[i].displayStreets() ;
    hexagons[i].displayVillages();
    hexagons[i].displayCitys();
  } // for
} // func 

void showCommandArea() {

  // the command area on the left side

  // The rectangle around the command area on the left side
  fill(222); 
  rect(0, 252, 
    240, 440); 

  // buttons 
  showButtons();

  if (showBuildingCosts) {
    showBuildingCosts();
  }//if

  fill(0);
  textSize(19);
  if (placing != placingNothing) {
    fill(players.get(whoseMoveIsIt).col);
  } else {
    textSize(13);
  }
  textAlign(CENTER);
  text(placeText[placing], 29, height/2+80, 150, 300);


  fill(0);
  textSize(18);
  text("Next Player", 29, 330, 150, 300);
  textAlign(LEFT);

  int d=0; 
  die_draw( d, rolls[d] );
  d=1; 
  die_draw( d, rolls[d] );
} // func 

void initHexagons() {
  int i = 0; 
  // 
  int x = 0;
  int y = 100;
  int yAdd = 154;

  landTypesList = shuffleArray(landTypesList);
  chips=shuffleArray(chips);

  for ( i = 0; i < 3; i++) {
    hexagons[i] = new Hexagon ((x+1)*182+190+90+110, y+90, landTypesList[i]); // 
    x++;
  } // for
  //
  x=0;
  y+=yAdd;
  for ( i = 3; i < 7; i++) {
    hexagons[i] = new Hexagon ((x+1)*182+190+0+110, y+90, landTypesList[i]);
    x++;
  } // for
  x=0;
  y+=yAdd;
  for ( i = 7; i < 12; i++) {
    hexagons[i] = new Hexagon ((x)*182+190+90+110, y+90, landTypesList[i]); // 
    x++;
  } // for
  x=0;
  y+=yAdd;
  for ( i = 12; i < 12+4; i++) {
    hexagons[i] = new Hexagon ((x)*182+190+180+110, y+90, landTypesList[i]);
    x++;
  } // for
  x=0;
  y+=yAdd;
  for ( i = 12+4; i < 19; i++) {
    hexagons[i] = new Hexagon ((x)*182+190+270+110, y+90, landTypesList[i]);
    x++;
  } // for
  // --------------------------------------
  //  for (i = 0; i < hexagons.length; i++) {
  //  hexagons[i].y -= 0;
  // }
}// func 

int[] shuffleArray (int[] arr) {

  int idx = arr.length;
  while (idx > 1) {
    int rnd = int ( random(idx) ) ;

    int tmp = arr[--idx];
    arr[idx] = arr[rnd];
    arr[rnd] = tmp;
  }
  return arr;
} // func
//