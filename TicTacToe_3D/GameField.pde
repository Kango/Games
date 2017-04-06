


void GameField() {

  // draw depending from Type of GameField

  if (record) {
    beginRaw("superCAD.ObjFile", "output.obj");
  }

  iBox=0;

  switch(letterGameFieldType) {
  case 'A': 
    //GameField2();
    break;
  case 'N': 
    GameField3();
    break;
  case 'C': 
    //GameField1();
    break;    
  case 'S': 
    //GameField4();
    break;    
  case 'B': 
    //GameField5();
    break;        
  case 'D': 
    break;        
  default:             // Default executes if the case labels
    println("None *****************");   // don't match the switch parameter
    break;
  } // switch

  if (record) {
    endRaw();
    record = false;
  }
} // GameField

// ----------------------------------------------------------------------------------------------------------------------

void GameField3() {
  // with spheres & boxes
  for (int n = 0; n < 3; n++ ) {
    for (int j = 0; j < 3; j = j+1) {
      for (int k = 0; k < 3; k = k+1) {

        if (myArray[n][j][k] == constFeldExistiertNicht) { 
          // field does not exist 
          // do nothing
        }
        else if (myArray[n][j][k] == constFeldLeer) {
          // field empty
          stroke(10,10,10);
          noFill();
          fill(204, 102, 0);           
          OneField(n,j,k);
        }
        else if (myArray[n][j][k] == constFeldBelegtO) { 
          // field full Letter O
          fill(204, 102, 0);           
          OneField(n,j,k);
          fill(204, 102, 0); 
          OneSphere(n,j,k);
        }  
        else if (myArray[n][j][k] == constFeldBelegtX) { 
          // field full - Letter X
          fill(204, 102, 0);           
          OneField(n,j,k);
          fill(204, 102, 0); 
          OneLetterX(n,j,k);
        }          
        else { 
          // Fehler
          println("Fehler 3 bei Feldstatus 0,1,2:  " + myArray[j][k]);
          // Abbruch
          exit();
        }
      }
    }
  }
}

// ---------------------------------------------------------------------------------

void OneField ( int z1, int x1, int y1) {
  // Box: Shape3D
  float X_Add = 420; 
  float Y_Add = 670; 
  float Z_Add = 5; 

  float resultX = x1 * 150 +  X_Add;
  float resultY = z1 *  58 +  Y_Add;
  float resultZ = y1 * 155 +  Z_Add;

  // Help for setSize(float width, float height, float depth) 
  boxBoard[iBox].setSize(80, 5, 80); 
  boxBoard[iBox].moveTo(resultX, resultY, resultZ);  
  boxBoard[iBox].tagNo = iBox;
  boxBoard[iBox].draw();
  iBox++; 

}

// Tools ---------------------------------------------

void InitBoxes () {
  // boxes = fields of the board 
  for (int i=0; i<27;i++) {
    boxBoard[i] = new Box( this, 40, 5, 40 );
  }
}

void OneSphere ( int z1, int x1, int y1) {
  // (sphere or) toroid

  noStroke();
  fill(4, 102, 2);
  float X_Add = 420; 
  float Y_Add = 650; // 717 
  float Z_Add = 2; 


  float resultX = x1 * 150 +  X_Add;
  float resultY = z1 *  58 +  Y_Add;
  float resultZ = y1 * 160 +  Z_Add;

  translate( resultX, resultY, resultZ); 

  paintO () ; 
  translate(-(  resultX), -(  resultY), -( resultZ)); 
  stroke(0,0,0);
}

void OneLetterX ( int z1, int x1, int y1) {

  float X_Add = 420; 
  float Y_Add = 650; 
  float Z_Add = 2; 

  float resultX = x1 * 150 +  X_Add;
  float resultY = z1 *  58 +  Y_Add;
  float resultZ = y1 * 160 +  Z_Add;

  pushMatrix();

  translate(  resultX,   resultY,   resultZ); 
  fill(234, 2, 2);
  paintX () ;
  translate(  -resultX,   -resultY,   -resultZ);
  popMatrix();
}