
// human move and tools

void MakeHumanMove(int pickedTagNo) {
  // get the Input of the human move.
  // pickedTagNo ist the TagNo of the 
  // picked field. It's from 0 to 26.
  MakeAMove(pickedTagNo);
}

void MakeAMove( int Field ) {
  int etage1=-1; 
  int Value2D=-1;
  // The Fields are enumeratd 0 to 26 by Shapes3D.
  // The number of the clicked field needs now to 
  // be converted to [Etage][x][y].

  // First get Etage. Value2D represents always 0..8 
  // no matter which Etage. Value2D gets converted to 
  // x,y within one Etage. 
  if (Field>=0&&Field<=8) {
    etage1=0;
    Value2D= Field;
  }
  else if (Field>8&&Field<=17) {
    etage1=1;
    Value2D= Field-9;
  }
  else if (Field>17&&Field<=26) {
    etage1=2;
    Value2D= Field-18;
  } 
  else {
    println("Error30++++++++++++++++++++++++++++++++");
    //exit();
  }
  // if found: 
  if (etage1>-1 && Value2D>-1) {
    MakeAMoveHelper (  etage1, Value2D );
  }
}

void MakeAMoveHelper ( int etage1, int Field ) {

  if (Field == 0) {    

    if (myArray [etage1][0][0] == constFeldLeer) {
      if (status == constStatusFeld_X) {
        myArray [etage1][0][0] = constFeldBelegtX;
        status = constStatusFeld_O;
      } 
      else {
        myArray [etage1][0][0] = constFeldBelegtO;       
        status = constStatusFeld_X;
      }
    }
  }
  else if (Field == 1) {    
    if (myArray [etage1][0][1] == constFeldLeer) {
      if (status == constStatusFeld_X) {
        myArray [etage1][0][1] = constFeldBelegtX;
        status = constStatusFeld_O;
      } 
      else {
        myArray [etage1][0][1] = constFeldBelegtO;       
        status = constStatusFeld_X;
      }
    }
  }   
  else if (Field == 2) {    
    if (myArray [etage1][0][2] == constFeldLeer) {
      if (status == constStatusFeld_X) {
        myArray [etage1][0][2] = constFeldBelegtX;
        status = constStatusFeld_O;
      } 
      else {
        myArray [etage1][0][2] = constFeldBelegtO;       
        status = constStatusFeld_X;
      }
    }
  }      
  else if (Field == 3) {    
    if (myArray [etage1][1][0] == constFeldLeer) {
      if (status == constStatusFeld_X) {
        myArray [etage1][1][0] = constFeldBelegtX;
        status = constStatusFeld_O;
      } 
      else {
        myArray [etage1][1][0] = constFeldBelegtO;       
        status = constStatusFeld_X;
      }
    }
  }          
  else if (Field == 4) {    
    if (myArray [etage1][1][1] == constFeldLeer) {
      if (status == constStatusFeld_X) {
        myArray [etage1][1][1] = constFeldBelegtX;
        status = constStatusFeld_O;
      } 
      else {
        myArray [etage1][1][1] = constFeldBelegtO;       
        status = constStatusFeld_X;
      }
    }
  }              
  else if (Field == 5) {    
    if (myArray [etage1][1][2] == constFeldLeer) {
      if (status == constStatusFeld_X) {
        myArray [etage1][1][2] = constFeldBelegtX;
        status = constStatusFeld_O;
      } 
      else {
        myArray [etage1][1][2] = constFeldBelegtO;       
        status = constStatusFeld_X;
      }
    }
  }              
  else if (Field == 6) {    
    if (myArray [etage1][2][0] == constFeldLeer) {
      if (status == constStatusFeld_X) {
        myArray [etage1][2][0] = constFeldBelegtX;
        status = constStatusFeld_O;
      } 
      else {
        myArray [etage1][2][0] = constFeldBelegtO;       
        status = constStatusFeld_X;
      }
    }
  }              
  else if (Field == 7) {    
    if (myArray [etage1][2][1] == constFeldLeer) {
      if (status == constStatusFeld_X) {
        myArray [etage1][2][1] = constFeldBelegtX;
        status = constStatusFeld_O;
      } 
      else {
        myArray [etage1][2][1] = constFeldBelegtO;       
        status = constStatusFeld_X;
      }
    }
  }              
  else if (Field == 8) {    
    if (myArray [etage1][2][2] == constFeldLeer) {
      if (status == constStatusFeld_X) {
        myArray [etage1][2][2] = constFeldBelegtX;
        status = constStatusFeld_O;
      } 
      else {
        myArray [etage1][2][2] = constFeldBelegtO;       
        status = constStatusFeld_X;
      }
    }
  }
}