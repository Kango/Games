
// provides some images for the player properties 

class GameArt {

  PImage villageGreen;
  PImage villageRed;
  PImage villageYellow;
  PImage villageBlue;

  PImage cityGreen;
  PImage cityRed;
  PImage cityYellow;
  PImage cityBlue;

  //constr 
  GameArt() {
    
    // init 

    // PLAYER COLORS 
    color red     = color(255, 0, 0);
    color green   = color(0, 255, 0);
    color blue    = color(0, 0, 255);
    color yellow  = color(255, 241, 5);

    villageGreen= getPicture(village, green);
    villageRed= getPicture(village, red);
    villageYellow= getPicture(village, yellow);
    villageBlue= getPicture(village, blue);  

    cityGreen= getPicture(city, green);
    cityRed= getPicture(city, red);
    cityYellow= getPicture(city, yellow);
    cityBlue= getPicture(city, blue);
  }//constr
  // 
}//class
//