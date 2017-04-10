//
//  Scrabble
//  Version 10th April 2017
//
//  By @Chrisir
//
//  Modifications and English by @Lord_of_the_Galaxy
//

// GERMAN or ENGLISH?
public static final boolean German = false;

// colors as consts
final color BLACK = color(0); 
final color GREEN = color(0, 255, 0); 
final color RED = color(255, 0, 0);
final color YELLOW = color(#FEFF15);

// main game board: number of cells 
final int max1=15;

// 2D Array of class 'Cell': 
// main game board 
Cell[][] mainGrid  = new Cell[max1][max1]; // empty Array

final int normalGame  = 0; 
final int gameOver    = 1; 
final int startScreen = 2; 
int state = startScreen; 

// these are the letters the 2 players hold on their hand / have before them 
Cell[] letterStack1   = new Cell[8]; 
Cell[] letterStack2   = new Cell[8]; 

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

// the score of the letters (how much is one letter worth) German/ ENGLISH
HashMap<String, Integer>  pointsOfLetter = new HashMap<String, Integer> ();  

// for showing the table of results 
String scoreTable=""; // its content
ScoreTable[] scoreTables = new ScoreTable[2]; 

// ----------------------------------------------------------------

void setup () {
  size (1280, 720);
  textSize(22); 

  // generate Main Grid
  generateMainGrid(); 

  // the letters to draw from 
  generateAllLetters(); 
  defineScoreForAllLetters();

  // letterStack of one player (left)
  for (int i=0; i<8; i++) {
    letterStack1[i] = 
      new Cell (40*i + 680, 80, color(#F0E2B3), false);
  }

  // letterStack (right side)
  for (int i=0; i<8; i++) {
    letterStack2[i] = 
      new Cell (40*i+ 680, 280, color(#F0E2B3), false);
  }

  // Button init 
  button0 = new Button ( "Draw Letters", 840, 160, GREEN);  
  button1 = new Button ( "Draw Letters", 840, 360, BLACK);

  // ScoreTable init
  initScoreTable(); 

  background (0);
}

void draw () {
  background (0);

  if (state==startScreen) {
    showWelcomeScreen();
  } else if (state==normalGame||state == gameOver) {
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
  }

  // no else here -----------

  // display message
  if (state == gameOver) {
    //
    fill(RED);
    text ( "Game Over", width/2, height-29 );
    noFill();
    stroke(RED); 
    strokeWeight(3); 
    rect(3, 3, width-6, height-6);
    strokeWeight(3);
  }
  //
}//func 
//