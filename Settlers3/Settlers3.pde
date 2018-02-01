
// Settlers 

// To do:

// fight overlapping of hexagons. 
// The edges (streets) and corners (citys, villages) of different
// hexagons overlap. This has to be fought to avoid that e.g. 2 streets 
// can be placed on the same edge (or 2 villages/cities on the same corner). 
// On the other hand, e.g. with villages and cities, all 3 neighboring 
// hexagons must have the city stored as their item so they can distribute the 
// goods (when the dice meets their number). 
// Hence a village/city has to be stored 3 times (every hexagon that owns a corner, but it has to
// be shown only once).

// Game logic and so on. A lot. 


// list of hexagons = the map 
Hexagon [] hexagons = new Hexagon[19] ;

// list of players 
ArrayList<Player> players = new ArrayList(); 

// resources (brick, lumber, wool, grain, and ore), represented by resource cards: 

// land type
final int desert   = 0; // -> none   | decoration: palm tree
final int forest   = 1; // -> Wood   | decoration: tree, cottage
final int pasture  = 2; // -> Wool   | decoration: sheep
final int mountain = 3; // -> Ore
final int hills    = 4; // -> bricks
final int fields   = 5; // -> grain  | decoration: half full during harvest 

// this list reflects how many land types cards there are of every land time 
int[] landTypesList = {
  desert, 
  forest, forest, forest, forest, 
  pasture, pasture, pasture, pasture, 
  mountain, mountain, mountain, 
  hills, hills, hills, 
  fields, fields, fields, fields
};

// image for forest 
PImage textureForest; 

// the Grass
final int numberOfStraws = 55; 
PVector [] straws = new PVector[numberOfStraws];

// some data for the image lists of sheeps and trees 
int[] colorPalette = new int[16];

String pchar = "0123456789ABCDEF";

GameArt gameArt; 

ArrayList<PGraphics> imgs = new ArrayList<PGraphics>();

// the int IDs for player cols. 
final int intRed    = 0;
final int intGreen  = 1;
final int intBlue   = 2;
final int intYellow = 3;

// the corresponding colors (for the int IDs for player cols):  
color[] colorPlayers = { 
  color(255, 0, 0), 
  color(0, 255, 0), 
  color(0, 0, 255), 
  color(255, 241, 5), 
};

// whose plaxer's turn 
int whoseMoveIsIt = 0; 

// show the card with the Building Costs yes/no 
boolean showBuildingCosts;

// when placing streets with the mouse, this is the selector what gets placed 
final int placingstreet=0;
final int placingvillage=1;
final int placingcity=2;
final int placingThief=3;
final int placingNothing=4;

int placing = placingNothing; // current placement 

// Text from placing ID values 
String[] placeText={
  "Placing Street (click on a side)", 
  "Placing Village (click on a corner)", 
  "Placing City (click on a corner)", 
  "Placing Thief (click on a center)", 
  "Click s, v, c or t to start placing street, village, city or thief"
}; 

// For the screen Buttons -------------------------------------

// for debugging and making new buttons set to true; 
// standard is false 
final boolean showButtonsForDebugging = false;  

// the buttons: 
ArrayList<RectButton> rectButtons  = new ArrayList(); 
int btnLengthInMainMenu=2; 

// colors for Buttons et al. 
final color col1        = color(111); // #ff0000;
final color col2        = color(0);   // #ffff00;
final color col3        = color(0);   // #000000;
final color colYellow   = color(244, 244, 44);
final color colRedBrick = color(244, 15, 30);
final color colDarkGray = color(111);

// for the tool tip text  
int timeSinceLastMouseMoved;  // store time since last mouse moved / pressed

// for the buttons 
boolean locked;

// The two Dice --------------------------------------------------------------
// by TfGuy44

/***  Constants  ***/
final int NUM_SIDES = 6;  // Sides on the dice
final int NUM_DICE  = 2;  // The number of dice used

/***  Variables  ***/
int[] rolls = new int[NUM_DICE]; // array to store 2 dice results

// The numbers on the Chips ----------------------------------------------------
// /number plate (chip))
// A – 5, B – 2, C – 6, D – 3, E – 8, F – 10, G – 9, H – 12, i – 11, J – 4, K – 8, L – 10, M – 9, N – 4, O – 5, P – 6, Q – 3, R - 11
// number plates:
int[] chips = { 5, 2, 6, 3, 8, 10, 9, 12, 11, 4, 8, 10, 9, 4, 5, 6, 3, 11 }; 
int numberValueIndex = 0;

// --------------------------------------------------------------------------

void setup() {

  size(1400, 960);

  background(#3064FA); // blue - sea 

  createPalette(15);
  makeAllPictures();
  gameArt = new GameArt(); 

  initHexagons();
  initGrass(); 
  textureForest = loadImage("t1.jpg"); // ("forest1.png");
  setupButtons();
  dice_roll();

  // Init Player --------- 

  // player tile size 
  float pw=200;
  float ph=200;

  // PLAYER COLORS 
  color red     = color(255, 0, 0);
  color green   = color(0, 255, 0);
  color blue    = color(0, 0, 255);
  color yellow  = color(255, 241, 5);

  // init players and their display field on the screen 
  players.add ( new Player (3, 3, pw, ph, "John", red, intRed, 0)); // left upper corner 
  players.add ( new Player (width-10-pw, 3, pw, ph, "Ann", green, intGreen, 1)); // right upper corner  
  players.add ( new Player (width-10-pw, height-10-ph, pw, ph, "Paul", blue, intBlue, 2)); // lower right corner 
  players.add ( new Player (3, height-10-ph, pw, ph, "Tom", yellow, intYellow, 3)); // lower left corner 
  //
} // func 

void draw() {
  background(#3064FA); // blue - sea 

  // show the hexagons
  showHexagons();

  // show players 
  for (Player currentPlayer : players) {
    currentPlayer.display();
  } // for

  // show player's turn 
  players.get(whoseMoveIsIt).displayMyTurn();

  // the command area on the left side
  showCommandArea();
  //
} // func 
//