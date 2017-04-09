//
//  Scrabble
//  Version 9th April 2017

// colors as consts
final color GRAY = color(111); 
final color GREEN = color(0, 255, 0); 
final color RED = color(255, 0, 0);
final color YELLOW = color(#FEFF15);

// main game board: number of cells 
final int max1=15;

// 2D Array of class 'Cell': 
// main game board 
Cell[][] mainGrid  = new Cell[max1][max1]; // empty Array

final int normalGame = 0; 
final int gameOver = 1; 
int state=normalGame; 

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

// some other vars: a state system for the players   
final int DrawLetters=0;  
final int Phase1=1;
final int Phase2=2;

int stateInputLeft  = DrawLetters;
int stateInputRight = DrawLetters; 

// player scores 
int pointsLeft, pointsRight;

// the score of the letters (how much is one letter worth)
HashMap<String, Integer>  hashMapPointsOfLetter = new HashMap<String, Integer> ();  

// for showing the table of results 
String scoreTable=""; 
ScoreTable[] scoreTables = new ScoreTable[2]; 

// ----------------------------------------------------------------

void setup () {
  size (920, 940);
  textSize(22); 

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

  // ScoreTable init
  scoreTables[0]=new ScoreTable(20, 250, 100, 320, 0); 
  scoreTables[1]=new ScoreTable(width-120, 250, 100, 320, 1);

  background (90);
}

void draw () {
  background (90);

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

  // show both letter stacks below
  showLetterStacks();

  // show Minor Stuff on the screen 
  showMinorStuff();

  // Game over? 
  checkGameOver();

  // display message
  if (state == gameOver) {
    //
    fill(RED);
    text ( "Game Over", width/2, height-133 );
  }
  //
}//func 
//