

PImage getPicture(String[] name, 
  color playerColor ) {

  int rows = name.length;
  int cols = name[0].length(); // should all be the same length

  // int nbrPixels = rows * cols;

  PGraphics img = createGraphics(cols, rows);

  img.beginDraw();
  img.loadPixels();

  int p = 0;
  for (int i=0; i < rows; i++) {
    for (int j=0; j < cols; j++) {

      char getChar = name[i].charAt(j); 

      int idx = pchar.indexOf(getChar);

      // if it's not transparent color (the background color in the texts)
      if (getChar != '7') {
        // start adding this pixel
        if (getChar == '8') 
          img.pixels[p] = playerColor;
        else
          img.pixels[p] = colorPalette[idx];
      }        

      //img.pixels[p+1] = palette[idx];
      // noStroke();
      // fill ( palette[idx] );
      //img.rect(i, j, 2, 2);
      p++;
    }
  }
  img.updatePixels();
  img.endDraw();

  return img.copy();
}

void makeAllPictures() {

  makePicture(test1, colorPalette);
  makePicture(city, colorPalette);

  makePicture(village, colorPalette);
  makePicture(village2, colorPalette);

  makePicture(Sheep1, colorPalette);
  makePicture(Sheep3, colorPalette);

  makePicture(Sheep4, colorPalette);
  makePicture(SheepBestes, colorPalette);

  makePicture(Sheep7, colorPalette);
  makePicture(Sheep8, colorPalette);

  makePicture(twoSheepsAboveEachOther, colorPalette);
  makePicture(twoSheepsAboveEachOther2, colorPalette);

  makePicture(goat1, colorPalette);
  makePicture(tree1, colorPalette);

  makePicture(tree3, colorPalette);
  makePicture(tree4, colorPalette);

  makePicture(tree7, colorPalette);
  makePicture(Sonne, colorPalette);

  println ("number of images : "
    +imgs.size());
}

void makePicture(String[] name, int[] palette) {

  int rows = name.length;
  int cols = name[0].length(); // should all be the same length
  int nbrPixels = rows * cols;

  PGraphics img = createGraphics(cols, rows);

  img.beginDraw();
  img.loadPixels();

  int p = 0;
  for (int i=0; i < rows; i++) {
    for (int j=0; j < cols; j++) {

      char getChar = name[i].charAt(j); 

      int idx = pchar.indexOf(getChar);

      if (getChar != '7') 
        img.pixels[p] = palette[idx];
      //img.pixels[p+1] = palette[idx];
      noStroke();
      // fill ( palette[idx] );
      //img.rect(i, j, 2, 2);
      p++;
    }
  }
  img.updatePixels();
  img.endDraw();
  imgs.add(img);
}

void createPalette(int alphaColor) {

  colorPalette = new int[16];

  for (int i = 0; i < colorPalette.length; i++) {
    switch(i) {
    case 0:
      colorPalette[i] = color (0, 0, 0);
      break; 
    case 1:
      colorPalette[i] = color (0, 0, 255);
      break;
    case 2:
      colorPalette[i] = color (0, 255, 0);
      break;
    case 3:
      colorPalette[i] = color (0, 255, 255); // color (244, 22, 245);
      break;
    case 4:
      colorPalette[i] = color (255, 0, 0);
      break;
    case 5:
      colorPalette[i] = color (111) ; // color (255, 0, 255) ;
      break;
    case 6:
      // brown
      colorPalette[i] = color (234, 152, 28);
      break;
    case 7:
      colorPalette[i] = color (120, 116, 124);
      break;
    case 8:
      colorPalette[i] = color (181, 176, 185) ;
      break;
    case 9:
      colorPalette[i] = color (80, 184, 247);// lightblue=9;
      break;
    case 10:
      colorPalette[i] = color (153, 245, 148);// lightgreen=10;
      break;
    case 11:
      colorPalette[i] = color (235, 30, 2);// lightcyan=11;
      break;
    case 12:
      colorPalette[i] = color (235, 30, 2);// 
      break;
    case 13:
      colorPalette[i] = color (0, 255, 0);
      break;
    case 14:
      colorPalette[i] = color (0, 255, 0);
      break;
    case 15:
      // colorPalette[i] = color (255, 0, 2); // RED 
      colorPalette[i] = color (255); // WHITE
      // colorPalette[i] = color (111); // GRAY
      break;

    default:
      // colorPalette[i] = color (255, 0, 2);
      println("Unknown Color.  ");
      exit(); 
      break;
    }

    // Make this one transparent
    // colorPalette[alphaColor] &= 0x00ffffff;
  }
}
//