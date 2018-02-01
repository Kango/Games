
// one hexagon 

class Hexagon {

  float x, y;
  color strokeColor; // 
  PVector[] corners = new PVector[6];
  PVector center=new PVector();
  float angle=0.0;
  int landType; 

  int numberValue=-1; 

  ArrayList<Tree> trees = new ArrayList();

  // these are streets. They are denoted per edge (-1 = empty / no street).
  // If not -1, the number is the player color / ID.  
  int[] hasStreet = {
    -1, -1, -1, -1, -1, -1
    //0, 1, 0, 3, 2, 0
  }; 

  int[] hasVillage = {
    -1, -1, -1, -1, -1, -1
    //0, 1, 0, 3, 2, 0
  }; 

  int[] hasCity = {
    -1, -1, -1, -1, -1, -1
    //0, 1, 0, 3, 2, 0
  }; 

  boolean hasThief = false;

  // constructor 
  Hexagon( float xtemp, float ytemp, 
    int landTypetemp ) {
    // constr 
    x=xtemp;
    y=ytemp;
    landType=landTypetemp;
    if (landType==desert)
      hasThief=true; 
    makeForest(); 

    // define the array
    for (int i = 0; i < 6; i++) {
      corners[i] = new PVector();
    }

    //Set the points based on theta with a radius of 100
    float theta   = radians(30);
    float radius1 = 105; 

    // for rotation
    for (int i = 0; i < 6; i++) {
      theta += TWO_PI/6.0;
      corners[i].x =0+ cos(theta)*radius1;
      corners[i].y =0+ sin(theta)*radius1;
      center.x+=corners[i].x ;
      center.y+=corners[i].y ;
    }//for
    //
    // average of 6 points = center 
    center.x/=6;
    center.y/=6;

    if (landType!=desert) {
      numberValue =  chips[numberValueIndex];
      numberValueIndex++;
    }//if
  }// constr 

  void makeForest() {

    // gets called from the constr

    color[] colorForest={
      color(#31A010), 
      color(#289B06), 
      color(#2B8B0E), 
      color(#2B8B0D)};

    for (int i = 0; i < 60; i++) { 
      float x1=random(-66, 66); 
      float y1=random(-66, 66); 
      trees.add(new Tree(x1, y1, 
        colorForest[int(random(colorForest.length))], 
        random(10, 22)));
    }
  }//method

  //-----------------------------------------------------------
  // display things

  void display() {

    pushMatrix();
    translate(x, y);
    setColor(); 
    stroke(111); 

    // Draw the hexagon using the points
    beginShape();
    setTexture();
    for (int i = 0; i < 6; i++) {
      vertex(corners[i].x, corners[i].y);
    }
    endShape();

    setDecoration(); 

    if (landType!=desert) {
      fill(0);//black
      if (numberValue==6||numberValue==8)
        fill(255, 0, 0); //red
      // this signifies the text size per number plate (chip)
      // 0 means does not occur (e.g. 0 and 1 can not be a result of the dice)
      int[]textSizeList= { 0, 0, 10, 11, 14, 14, 17, 0, 17, 17, 17, 16, 10 }; 
      textSize(textSizeList[numberValue]);  
      text(numberValue, center.x+30, center.y+30);
    }

    popMatrix();
    //
  } // method

  void  displayStreets() {

    // display streets 

    pushMatrix();
    translate(x, y);
    setColor(); 
    stroke(111); 

    for ( int i=0; i<hasStreet.length; i++ ) {

      int currentStreet=hasStreet[i];

      if (currentStreet>-1) {

        stroke(colorPlayers[currentStreet]);

        int[] listOfPairs1 ={ 0, 1, 2, 3, 4, 5 };
        int[] listOfPairs2 ={ 1, 2, 3, 4, 5, 0 };
        int i1=listOfPairs1[i];
        int i2=listOfPairs2[i];

        strokeWeight(6.5);

        lineStreet(corners[i1].x, corners[i1].y, 
          corners[i2].x, corners[i2].y);

        strokeWeight(1); // reset
      } //if
    }//for

    popMatrix();
  }//method

  void lineStreet(float h1x, float h1y, 
    float h2x, float h2y) {

    // draw street shorter than the edge 
    PVector from = new PVector (
      lerp(h1x, h2x, .2), 
      lerp(h1y, h2y, .2)
      );

    PVector to = new PVector (
      lerp(h1x, h2x, .8), 
      lerp(h1y, h2y, .8)
      );

    line(from.x, from.y, 
      to.x, to.y);
  }//func 

  void  displayVillages() {

    // display villages

    pushMatrix();
    translate(x, y);
    setColor(); 
    stroke(111); 

    for ( int i=0; i<hasVillage.length; i++ ) {

      int currentVillage=hasVillage[i];

      if (currentVillage>-1) {

        stroke(colorPlayers[currentVillage]);
        imageMode(CENTER);

        image(players.get(currentVillage).imgVillage, corners[i].x, corners[i].y);

        imageMode(CORNER); // reset to normal 

        strokeWeight(1); // reset
      } //if
    }//for

    popMatrix();
  }//method

  void  displayCitys() {

    // display villages

    pushMatrix();
    translate(x, y);
    setColor(); 
    stroke(111); 

    for ( int i=0; i<hasCity.length; i++ ) {

      int currentCity=hasCity[i];

      if (currentCity>-1) {

        stroke(colorPlayers[currentCity]);
        imageMode(CENTER);

        image(players.get(currentCity).imgCity, corners[i].x, corners[i].y);

        imageMode(CORNER); // reset to normal 

        strokeWeight(1); // reset
      } //if
    }//for

    popMatrix();
  }//method

  //-----------------------------------------------------------
  // check placements 

  boolean checkStreetPlacement () {

    for ( int i=0; i<6; i++ ) {

      int[] listOfPairs1 ={ 0, 1, 2, 3, 4, 5 };
      int[] listOfPairs2 ={ 1, 2, 3, 4, 5, 0 };
      int i1=listOfPairs1[i];
      int i2=listOfPairs2[i];

      if (nearStreetCenter(corners[i1].x, corners[i1].y, 
        corners[i2].x, corners[i2].y) 
        && hasStreet[i]==-1
        ) {
        hasStreet[i]=whoseMoveIsIt;
        return true;
      }
    }//for
    return false;
  }

  boolean nearStreetCenter(float h1x, float h1y, 
    float h2x, float h2y) {

    PVector center = new PVector (
      lerp(h1x, h2x, .5), 
      lerp(h1y, h2y, .5)
      );
    return dist(mouseX, mouseY, 
      x + center.x, y + center.y)<22;
  }//func 

  boolean checkVillagePlacement() {
    for ( int i=0; i<6; i++ ) {

      if (dist(mouseX, mouseY, x + corners[i].x, y + corners[i].y) < 22  
        && hasCity[i]==-1
        && hasVillage[i]==-1
        ) {
        hasVillage[i]=whoseMoveIsIt;
        return true;
      }//if
    } // for
    return false;
  }//method

  boolean checkCityPlacement() {
    for ( int i=0; i<6; i++ ) {

      if (dist(mouseX, mouseY, x + corners[i].x, y + corners[i].y) < 22  
        && hasCity[i]==-1
        && hasVillage[i]==-1
        ) {
        hasCity[i]=whoseMoveIsIt;
        return true;
      }//if
    } // for
    return false;
  }//method

  boolean checkThiefPlacement() {
    if (dist(mouseX, mouseY, x + center.x, y + center.y) < 22) {
      // reset: set all thieves OFF
      for (int i = 0; i < hexagons.length; i++) { 
        hexagons[i].hasThief=false;
      }
      // set this thief ON
      hasThief=true;
      return true;
    }//if
    return false;
  }//method

  // --------------------------------------------
  // Minor methods 

  void setTexture() {
    switch(landType) {

    case desert:      
      break;

    case forest:
      //texture(textureForest); 
      break;

    case pasture:
      break;

    case mountain:
      break;

    case hills:
      break;

    case fields:
      break;

    default:
      println ("error 203: unknown land type: "+landType);
      exit();
      fill(0); 
      break;
    } // switch
  }// method

  void setDecoration() {
    switch(landType) {

    case desert:

      // sun
      fill(#FFFF64);
      stroke(#FFFF64);

      ellipse(-50, -40, 30, 30); 

      float r1=30;
      float r2=20; 

      for (int i = -40; i < 160; i+=20) {

        float x1=cos(radians(i)) * r1-50;
        float y1=sin(radians(i)) * r1-40;

        float x2=cos(radians(i)) * r2-50;
        float y2=sin(radians(i)) * r2-40;

        line(x1, y1, x2, y2);
      }

      break;

    case forest:
      for (Tree t : trees) 
        t.display(); 
      image(imgs.get(14), 0, 0);  // #16
      break;

    case pasture:
      // fill(#74FA84);
      pushMatrix();
      grass ();
      translate (-33, -33);
      grass ();
      translate (-22, 55);
      grass ();
      popMatrix();

      pushMatrix();
      scale(2.4);
      image(imgs.get(9), 0, 0); // sheep 
      popMatrix();
      break;

    case mountain:
      //  fill(#869588);
      break;

    case hills:
      // fill(#C18412);
      break;

    case fields:
      fill(#D8C918);
      break;

    default:
      println ("unknown land type: "+landType);
      exit();
      fill(0); 
      break;
    } // switch

    if (hasThief) {
      fill(0); 
      textSize(13);
      textAlign(CENTER, CENTER); 
      text("Thief", center.x, center.y);
      textAlign(LEFT);
    }//if
    //
  }// method

  void setColor() {

    switch(landType) {

    case desert:
      fill(#FAE630);
      break;

    case forest:
      fill(#1EC933);
      break;

    case pasture:
      fill(#74FA84);
      break;

    case mountain:
      fill(#869588);
      break;

    case hills:
      fill(#C18412);
      break;

    case fields:
      fill(#D8C918);
      break;

    default:
      println ("unknown land type: "+landType);
      exit();
      fill(0); 
      break;
    } // switch
  }// method
  //
}
//