//
//  Scrabble
//  6th April 2017

// main game board: number of cells 
final int max1=15;

// colors as consts
final color GRAY = color(111); 
final color GREEN = color(0, 255, 0); 
final color RED = color(255, 0, 0);
final color YELLOW = color(#FEFF15);

// 2D Array of class 'Cell': 
// main game board 
Cell[][] mainGrid  = new Cell[max1][max1]; // empty Array

// these are the letters the 2 players hold on their hand / have before them 
Cell[] letterStackLeft    = new Cell[8]; 
Cell[] letterStackRight   = new Cell[8]; 

// are we dragging a letter from letterStack? 
boolean hold=false; // yes/no
int holding=0; // which letter of letterStacks are we dragging?  
// (this is for both letterStacks / players)

// 2 Buttons for 2 players
Button button0, button1; 

// which player (left or right one)
int whichPlayersMove = 0;  // 0 OR 1 

// this is the heap of ALL letters
String allLetters; 
// from which pos in the heap are we drawing new letters? 
int allLettersPosition=0;

// some other vars 
final int DrawLetters=0;  
final int Phase1=1;
final int Phase2=2;

int stateInputLeft=DrawLetters;
int stateInputRight=DrawLetters; 

// player scores 
int pointsLeft, pointsRight;

// the score of the letters (how much is one letter worth)
HashMap<String, Integer>  hashMapPointsOfLetter = new HashMap<String, Integer> ();  

// ---------------------------------------------------

void setup () {
  size (920, 940);

  // generate Main Grid
  generateMainGrid(); 

  // the letters to draw from 
  generateAllLetters(); 
  defineScoreForAllLetters();

  // letterStack of one player (left)
  for (int i=0; i<8; i++) {
    letterStackLeft[i] = 
      new Cell (40*i+20, height-80, color(#F0E2B3), false);
  }

  // letterStack (right side)
  for (int i=0; i<8; i++) {
    letterStackRight[i] = 
      new Cell (40*i+580, height-80, color(#F0E2B3), false);
  }

  // Button init 
  button0 = new Button ( "Draw Letters", 172, height-120, GREEN);  
  button1 = new Button ( "Draw Letters", width-172, height-120, GRAY);
}

void draw () {
  background (111);

  // buttons
  button0.display(); 
  button1.display(); 

  // main game board 
  for (int x=0; x<max1; x++) {
    for (int y=0; y<max1; y++) {
      mainGrid[x][y].display();
    }
  }

  // when we drag one letter 
  draggingALetter(); 

  // letters letterStack left 
  for (int i=0; i<8; i++) {
    letterStackLeft[i].display();
  }

  // letters letterStack right 
  for (int i=0; i<8; i++) {
    letterStackRight[i].display();
  }

  // Lines letterStack
  showLinesAroundLetterStack( letterStackLeft, 0 ); // 0 says: letterStack Left 

  // Lines letterStack
  showLinesAroundLetterStack( letterStackRight, 1 ); // 1 means: letterStack Right

  // display quantity remaining letters in the Heap  (upper right corner)
  fill(255);
  text(allLetters.length() - allLettersPosition, width-66, 66);

  // points players 
  fill(255);
  text(pointsLeft, 30, height-120); 
  text(pointsRight, width - 30, height-120);
}
//