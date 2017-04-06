

// Tic tac Toe 
// myArray is defined in tab StartField

// Credits: shapes3D & peasyCam & ControlP5

// Titel 
final String SpielTitel = "3D Tic Tac Toe"; 
final float numVersion = 0.1;

// imports --------------------

// import processing.opengl.*;

// shapes3D
import shapes3d.*;
import shapes3d.animation.*;
import shapes3d.utils.*;

/*** ControlP5 TextArea.
 * by andreas schlegel, 2009  */
import controlP5.*;

/** PeasyCam **/
import peasy.*;

// end of imports 
// --------------------------------------------------------

ControlP5 controlP5;
Textarea myTextarea;

PFont font;

int constStatusFeld_O = 0;
int constStatusFeld_X = 1;

int constFeldExistiertNicht = 0; 
int constFeldLeer = 1; 
int constFeldBelegtX = 2; 
int constFeldBelegtO = 3; 

// für Buttons 
int btnLength = 3;
RectButton[] rectBt = new RectButton[ btnLength ];
boolean locked;

color col1 = #ff0000;
color col2 = #ffff00;

// boxes (Shape3D)
Box[] boxBoard = new Box[27];
int iBox=0;

String cadSoftware, ext;
boolean record = false;

PeasyCam cam;
CameraState MyState; 

// Flag to show whether cam is Mouse controlled
boolean camIsMouseControlled = false; 

float x1 = 400;
float y1 = 400;

float fillValX = 2.9;  
float fillValY = height/2.0;
float CameraAngleAdd = 1; 

//  only 'N' is in use
char letterGameFieldType = 'N'; 

int status = constStatusFeld_X; 

Toroid toroid;

// --------------------------------------------------------------------

void setup()
{ 
  size(900, 700, P3D);
  cam = new PeasyCam(this, 1400);
  setCameraBeginning(); 

  println("Start");
  background(0);
  noSmooth();
  stroke(226); 
  stroke(256, 0, 0);
  lights();
  noFill();
  // The font 
  font = createFont("Eureka-90.vlw", 20); 
  textFont(font); 
  // defines status for Input of Moves
  status = constStatusFeld_X; 
  SetupButtons();
  //  EingabeStockwerk = 3; 
  // rectBt[3].basecolor = 233;  

  InitBoxes ();
  iBox=0;

  TextAreaInit ();
  background(0);

  // Help for Toroid(PApplet app, int nbrTubeSegments, int nbrLengthSegments) 
  toroid = new Toroid(this, 20, 30);
  // Help  for setRadius(float tubeX, float tubeY, float ring) 
  // Set the tube radii as well as the ring radius.
  toroid.setRadius(7, 7, 18);
  toroid.rotateToX(radians(45));
  toroid.fill(color(2, 222, 2));  
  toroid.moveTo(new PVector(0, 0, 0));
  // toroid.setTexture("donut.png");

  NeuesSpiel();
} // Ende von setup

// -----------------------------------------------------------------------------------------

void draw()
{ 
  background(0);

  // Add lights at the beginning
  // of draw() to keep them persistent 
  lights();
  directionalLight(51, 102, 126, -1, 1, 1);
  directionalLight(51, 102, 126, -1, -1, -1);

  cam.beginHUD();

  // in 1D (eindim.) Array 
  for (int i=0; i<btnLength; i++) {
    if (rectBt[i].Exists) {
      rectBt[i].display();
      rectBt[i].update();
    }
  }  

  textAlign(CENTER);
  textMode(MODEL);
  textSize(19) ;
  text("TicTacToe 3D", (width / 2)-30, (33));

  textSize(32) ;
  controlP5.draw();
  textMode(MODEL);
  cam.endHUD();   
  GameField();
} // draw 