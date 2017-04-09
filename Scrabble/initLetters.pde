

void generateAllLetters() {

  // By addition we get a long string of ALL letters. This is our HEAP.   
  // From that String the players draw their 8 letters and later the other letters.

  allLetters =
    generateXLetters("A", 5)+
    generateXLetters("Ä", 1)+
    generateXLetters("B", 2)+
    generateXLetters("C", 2)+
    generateXLetters("D", 6)+
    generateXLetters("E", 15)+
    generateXLetters("F", 3)+
    generateXLetters("G", 3)+
    generateXLetters("H", 5)+
    generateXLetters("I", 9)+
    generateXLetters("J", 1)+
    generateXLetters("K", 2)+
    generateXLetters("L", 4)+
    generateXLetters("M", 4)+
    generateXLetters("N", 10)+
    generateXLetters("O", 4)+
    generateXLetters("Ö", 1)+
    generateXLetters("P", 1)+
    generateXLetters("Q", 1)+
    generateXLetters("R", 7)+
    generateXLetters("S", 8)+
    generateXLetters("T", 5)+
    generateXLetters("U", 6)+
    generateXLetters("Ü", 1)+
    generateXLetters("V", 1)+
    generateXLetters("W", 2)+
    generateXLetters("X", 1)+
    generateXLetters("Y", 1)+
    generateXLetters("Z", 2)+
    generateXLetters(" ", 2); 
  //
  //  println(allLetters);

  // for testing the end of game: 
  // allLetters = generateXLetters("A", 2);

  allLetters =  shuffleArray ( allLetters.toCharArray() );

  // println(allLetters);
}

void defineScoreForAllLetters() {

  // letters.

  defineValuePoints("A", 1);
  defineValuePoints("Ä", 6);
  defineValuePoints("B", 3);
  defineValuePoints("C", 4);
  defineValuePoints("D", 1);
  defineValuePoints("E", 1);
  defineValuePoints("F", 4);
  defineValuePoints("G", 2);
  defineValuePoints("H", 2);
  defineValuePoints("I", 1);
  defineValuePoints("J", 6);
  defineValuePoints("K", 4);
  defineValuePoints("L", 2);
  defineValuePoints("M", 3);
  defineValuePoints("N", 1);
  defineValuePoints("O", 2);
  defineValuePoints("Ö", 8);
  defineValuePoints("P", 4);
  defineValuePoints("Q", 10);
  defineValuePoints("R", 1);
  defineValuePoints("S", 1);
  defineValuePoints("T", 1);
  defineValuePoints("U", 1);
  defineValuePoints("Ü", 6);
  defineValuePoints("V", 6);
  defineValuePoints("W", 3);
  defineValuePoints("X", 8);
  defineValuePoints("Y", 10);
  defineValuePoints("Z", 3);
  defineValuePoints(" ", 0); 
  //

  // Using an enhanced loop to interate over each entry
  // requires an import iirc 
  //for (Map.Entry me : hashMapPointsOfLetter.entrySet()) {
  //  print(me.getKey() + " is ");
  //  println(me.getValue());
  //}

  // We can also access values by their key
  int val = hashMapPointsOfLetter.get("Ü");
  println("Ü is " + val);

  //  println(allLetters);
  // println(allLetters);
}

//
//    1 Punkt: E (15), N (9), S (7), I (6), R (6), T (6), U (6), A (5), D (4)
//    2 Punkte: H (4), G (3), L (3), O (3)
//    3 Punkte: M (4), B (2), W (1), Z (1)
//    4 Punkte: C (2), F (2), K (2), P (1)
//    6 Punkte: Ä (1), J (1), Ü (1), V (1)
//    8 Punkte: Ö (1), X (1)
//    10 Punkte: Q (1), Y (1)
//    0 Punkte: Joker/Blanko (2)
//
//
//

void defineValuePoints( String letter, int value) {
  // Putting key-value pairs in the HashMap
  hashMapPointsOfLetter.put(letter, value);
}

String generateXLetters(String buchst1, int quantity) {
  // returns a String consisting of "quantity" times 
  // the letter "buchst1". 
  // example: A,3 returns AAA
  String result="";
  for (int i=0; i<quantity; i++) {
    result += buchst1;
  }
  return result;
}

String shuffleArray (char[] arr) {

  // Randomizes the order of the elements of an array. Implements
  // http : // Bost.Ocks.org/mike/shuffle/ 
  // Fisher-Yates Shuffle Algorithm

  int idx = arr.length;

  while (idx > 1) {

    int rnd = int ( random(idx) ) ;

    // swap 
    char tmp = arr[--idx];
    arr[idx] = arr[rnd];
    arr[rnd] = tmp;
  }

  String joined = new String(arr);

  return joined;
}//sub routine
//