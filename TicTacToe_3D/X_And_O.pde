

// paint the Xs and Os 

void paintX () {
  // diagonal 
  // Length 
  final int Len1 = 60; 

  // red 
  fill(color(222, 2, 2));

  // Lines? 
  // stroke (111); 
  noStroke();

  //pushMatrix();
  //PVector MyPVector = new PVector( 410.0, 710.0, 220.0 );
  // MyPVector =  GetValuePVector (i,j);
  //translate ( MyPVector.x, MyPVector.y, MyPVector.z );

  pushMatrix();
  rotateX(radians(90));
  rotateY(radians(45));
  rotateZ(radians(45));  
  box (Len1, 5, 5);
  popMatrix();

  pushMatrix();
  rotateX(radians(-90));
  rotateY(radians(45));  
  rotateZ(radians(45));
  box (Len1, 5, 5);  
  popMatrix();  

  pushMatrix();
  rotateX(radians(90));
  rotateY(-radians(45));
  rotateZ(radians(45));  
  box (Len1, 5, 5);
  popMatrix();

  pushMatrix();
  rotateX(radians(-90));
  rotateY(-radians(45));  
  rotateZ(radians(45));
  box (Len1, 5, 5);  
  popMatrix();  

  noStroke();
  //popMatrix();
}

void paintX_OLD () {

  // diagonal  

  int col1 = 103; 
  int col2 = 11;   

  fill(color(222, 2, 2));
  stroke (111) ;
  //pushMatrix();
  rotateX(radians(90));
  rotateY(radians(45));
  box (5, 35, 35);
  rotateY(radians(90));
  box (5, 35, 35);  
  noStroke();
  //popMatrix();
}

void paintO () {
  // all defs see void setup()
  toroid.draw();
}