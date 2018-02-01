
// the Grass

void initGrass() {
  for (int i = 0; i < numberOfStraws; i = i+1) {
    straws[i] = new PVector ( random (-14, 14), random (-14, 14) );
  }
}

void grass () {
  stroke(0, 253, 2);

  for (int i = 0; i < numberOfStraws; i = i+1) {
    GrassOne(straws[i].x, straws[i].y);
  }

  GrassOne( 21, 21 );  
  GrassOne( 11, 33 );    
  GrassOne( 21, -22 );      
  GrassOne( -21, 21 );  
  GrassOne( -11, 33 );    
  GrassOne( -21, -22 );   
  GrassOne( 21, -21 );  
  GrassOne( 11, -33 );    
  GrassOne( 21, 22 );      
  GrassOne( -18, - 24 );  
  GrassOne( -17, -30 );    
  GrassOne( -19, -12 );   
  GrassOne( -8, - 4 );  
  GrassOne( -7, -3 );    
  GrassOne( -9, -7 );
}

void GrassOne (float X1, float Y1) {
  stroke (43, 170, 15);
  line (X1, Y1, X1, Y1-4);
}
//