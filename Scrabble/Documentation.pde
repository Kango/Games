//
// SEE https://en.wikipedia.org/wiki/Scrabble
// 
// Definitions : 
// Scrabble is a game for 2 players. No AI. 
//
// two players play each other: player left (0) and player (right).
// A HEAP (allLetters) holds all letters. Both take letters from the heap and hold
// 8 on their hand (called letterStack). 

// They can place letter with the mouse (drag drop) on the game board ("mainGrid").
// Afterwards the need to confirm by clicking a button. 

// They can place the letters also ***below the board to test out words.
// Be careful to not place near the button though.  


//
// GERMAN Scrabble Points / Score  
// (Number of stones in brackets).
// https://de.wikipedia.org/wiki/Scrabble
//
//    1 Punkt: E (15), N (9), S (7), I (6), R (6), T (6), U (6), A (5), D (4)
//    2 Punkte: H (4), G (3), L (3), O (3)
//    3 Punkte: M (4), B (2), W (1), Z (1)
//    4 Punkte: C (2), F (2), K (2), P (1)
//    6 Punkte: Ä (1), J (1), Ü (1), V (1)
//    8 Punkte: Ö (1), X (1)
//    10 Punkte: Q (1), Y (1)
// 
//    0 Punkte: Joker/Blanko (2)
//
//
// ENGLISH Scrabble Points / Score
// (Number of stones in brackets)
// Source - my set of Scrabble :) (@Lord_of_the_Galaxy)
//
//    1 Point   : E (12), A (9), I (9), O (8), N (6), R (6), T (6), U (4), S (4), L (4)
//    2 Points  : G (3), D (4)
//    3 Points  : M (2), B (2), C (2), P (2)
//    4 Points  : H (2), F (2), V (2), W (2), Y (2)
//    5 Points  : K (1)
//    8 Points  : J (1), X (1)
//    10 Points : Q (1), Z (1)
// 
//    0 Points  : Joker/Blank (2)