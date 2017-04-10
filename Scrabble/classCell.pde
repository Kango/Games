
//

class Cell {

  // this is for letters in the main grid / game board AND
  // on the letter stacks of the 2 player below  

  // Attributs

  float x;
  float y;

  float xOriginal;
  float yOriginal;

  float diameter;

  color cellColor;   

  char cellLetter = ' '; // letter

  // a stone put down on the grid is temporarily non existing 
  boolean exist=true; 

  // docked on grid? 
  boolean docked = false; 

  // star field in the center 
  final int NORMAL = 0; // no star 
  final int STAR   = 1; // star
  int type = NORMAL;

  // constructor of 'Cell'
  Cell (float theX, float theY, 
    color theColor, 
    boolean theExist) {

    x = theX;
    y = theY;

    xOriginal=x;
    yOriginal=y;

    diameter = 40;
    cellColor=theColor;

    exist=theExist;
  } // constructor

  void display() {
    if (!exist)
      return; 

    fill(cellColor); 
    stroke(0); 
    if (docked) {
      strokeWeight(2); 
      stroke(YELLOW);
    }
    rect (x, y, diameter, diameter);
    strokeWeight(1); 

    // text 
    fill(0);
    textSize(26);
    textAlign(CENTER, CENTER);
    text(cellLetter, x+20, y+20);

    // STAR 
    if (type==STAR && cellLetter == ' ') { 
      star(x+diameter/2, y+diameter/2);
    }
  }// sub routine

  boolean mouseOver() {
    return mouseX>x &&
      mouseY>y&&
      mouseX<x+diameter &&
      mouseY<y+diameter;
  }

  void setBackToOriginalPosition() {
    x=xOriginal;
    y=yOriginal;
  }

  boolean near(Cell other) {
    float distToOther = dist(x, y, 
      other.x, other.y); 
    return distToOther < 18; // or 29 threshold
  }

  void copyFrom(Cell other) {
    cellLetter = other.cellLetter; // copy
    cellColor  = other.cellColor;
  }

  // for the center star ------

  void setStar() {
    type=STAR;
  }

  void star(float x, float y) {

    float f=3.9; 

    pushMatrix();
    translate(x, y);
    rotate(-.29);
    starHelper(0, 0, 
      30/f, 70/f, 
      5); 
    popMatrix();
  }

  void starHelper(float x, float y, 
    float radius1, float radius2, 
    int npoints) {

    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;

    fill(0);
    noStroke(); 
    beginShape();

    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
  //
}//class 
//