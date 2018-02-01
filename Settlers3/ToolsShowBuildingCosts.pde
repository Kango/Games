
void showBuildingCosts() {

  float xBase= rectButtons.get(0).x+
    rectButtons.get(0).sizeX+10;
  float yBase=  rectButtons.get(0).y-200;

  fill(111); 
  stroke(255);
  rect(xBase, yBase, 400, 400);

  fill(  color(0, 255, 0));
  textAlign(CENTER);
  textSize(24);
  text( "Building Costs", 
    xBase+200, yBase+26);
  textAlign(LEFT); // reset

  // -----------------------------------------------------

  fill( 0 );
  textSize(20);
  text( "Street                         0 Winning Points", 
    xBase+5, yBase+26+27);
  textAlign(LEFT); // reset

  // tree 
  image(imgs.get(14), xBase+45, yBase+26+27);  // #16

  textSize(14);
  fill(colRedBrick);
  text( "Bricks", 
    xBase+45*2, 
    yBase+26+27+21);

  // -----------------------------------------------------

  fill( 0 );
  textSize(20);
  text( "Village                        1 Winning Points", 
    xBase+5, 
    yBase+26+27+55);
  textAlign(LEFT); // reset

  // tree
  image(imgs.get(14), xBase+45, yBase+26+30+55);  // #16

  image(imgs.get(9), xBase+45+45, 
    yBase+26+30+55     ); // sheep 

  textSize(14);
  fill(colRedBrick);
  text( "Bricks", 
    xBase+45*3, 
    yBase+26+30+55+21);

  textSize(12);
  fill(colYellow);
  text( "Grain", 
    xBase+45*4, 
    yBase+26+30+55+21);

  // -----------------------------------------------------

  fill( 0 );
  textSize(20);
  text( "City                            2 Winning Points", 
    xBase+5, 
    yBase+26+27+110);
  textAlign(LEFT); // reset

  textSize(12);
  fill(colYellow);
  text( "Grain", 
    xBase+45*2, 
    yBase+26+27+110+21);
  textSize(12);
  text( "Grain", 
    xBase+45, 
    yBase+26+27+110+21);

  textSize(12);
  fill(222);
  text( "Ore", 
    xBase+45*3, 
    yBase+26+27+110+21);

  textSize(12);
  text( "Ore", 
    xBase+45*4, 
    yBase+26+27+110+21);

  textSize(12);
  text( "Ore", 
    xBase+45*5, 
    yBase+26+27+110+21);

  // -----------------------------------------------------

  fill( 0 );
  textSize(20);
  text( "Development               ? Winning Points", 
    xBase+5, 
    yBase+26+27+55*3);
  textAlign(LEFT); // reset

  textSize(12);
  fill(colYellow);
  text( "Grain", 
    xBase+45*2, 
    yBase+26+27+55*3+27  );

  textSize(12);
  fill(222);
  text( "Ore", 
    xBase+45*3, 
    yBase+26+27+55*3+27  );

  image(imgs.get(9), xBase+45, 
    yBase+26+27+55*3      ); // sheep

  //----------------------------------------
  fill( 0 );
  textSize(13);
  text( "Longest Street - 2 Winning Points\n"
    +"Biggest knight force  - 2 Winning Points.", 
    xBase+5, yBase+26+27+280);
  textAlign(LEFT); // reset
}//func 
//