/* //<>//
 *SKETCH Centipedes 
 *AUTEUR Mick Waanders
 *DATE: 21-10-2021
*/

boolean CanMoveLeft, canMoveRight, canMoveUp, canMoveDown = true;

int amountOfChameleonsHit, amountOfBananasEaten, amountOfCherrysEaten = 0;

void moveCentipede() {
  int[][] gameTileMap = getGameTileMap();

  for (int row = 0; row < getGameTileMap().length; row++) {
    for (int colomn = 0; colomn < getGameTileMap()[row].length; colomn++) {

      boolean leftCollision = colomn > 0;
      boolean rightCollision = colomn < gameTileMap[row].length - 1;
      boolean upperCollision = row > 0;
      boolean downCollision = row < getGameTileMap().length - 1;

      if (gameTileMap[row][colomn] == 1) {
        switch (keyCode) {
        case LEFT:
          //Checkt of je niet uit het speelveld gaat
          if (leftCollision) {
            boolean trailLeftTouched = gameTileMap[row][colomn - 1] == 14;

            //Checkt of je de trail raakt of de body van de centipede
            if (trailLeftTouched || (gameTileMap[row][colomn -1] >= 2 && gameTileMap[row][colomn -1] <= 10)) {
              CanMoveLeft = false;
              println("Je kan niet naar links! moveLeft = " + CanMoveLeft);
            } else {
              checkIfOnFruitOrChameleon(row, colomn);             
              moveCentipedeBody(); 
              gameTileMap[row][colomn - 1] = 1;
            }
          } else {
            CanMoveLeft = false;
            println("Je kan niet naar links! moveLeft = " + CanMoveLeft);
          }
          return;

        case RIGHT:
          //Checkt of je niet uit het speelveld gaat
          if (rightCollision) {      
            boolean trailRightTouched = gameTileMap[row][colomn + 1] == 14;  

            //Checkt of je de trail raakt of niet
            if (trailRightTouched || (gameTileMap[row][colomn + 1] >= 2 && gameTileMap[row][colomn + 1] <= 10)) {
              canMoveRight = false;
              println("Je kan niet naar rechts! moveRight = " + canMoveRight);
            } else {
              checkIfOnFruitOrChameleon(row, colomn); 
              moveCentipedeBody();
              gameTileMap[row][colomn + 1] = 1;
            }
          } else {
            canMoveRight = false;
            println("Je kan niet naar rechts! moveRight = " + canMoveRight);
          }
          return;

        case UP:
          //Checkt of je niet uit het speelveld gaat
          if (upperCollision) {
            boolean trailUpTouched = gameTileMap[row - 1][colomn] == 14;

            //Checkt of je de trail raakt of niet
            if (trailUpTouched || (gameTileMap[row - 1][colomn] >= 2 && gameTileMap[row - 1][colomn] <= 10)) {
              canMoveUp = false;
              println("Je kan niet naar boven! moveUp = " + canMoveUp);
            } else {
              checkIfOnFruitOrChameleon(row, colomn); 
              moveCentipedeBody();
              gameTileMap[row - 1][colomn] = 1;
            }
          } else {
            canMoveUp = false;
            println("Je kan niet naar boven! moveUp = " + canMoveUp);
          }
          return;

        case DOWN:
          //Checkt of je niet uit het speelveld gaat
          if (downCollision) {
            boolean trailDownTouched = gameTileMap[row + 1][colomn] == 14;

            //Checkt of je de trail raakt of niet
            if (trailDownTouched || (gameTileMap[row + 1][colomn] >= 2 && gameTileMap[row + 1][colomn] <= 10)) {
              canMoveDown = false;
              println("Je kan niet naar beneden! moveDown = " + canMoveDown);
            } else {
              checkIfOnFruitOrChameleon(row, colomn); 
              moveCentipedeBody();            
              gameTileMap[row + 1][colomn] = 1;
            }
          } else {
            canMoveDown = false;
            println("Je kan niet naar beneden! moveDown = " + canMoveDown);
          }
          return;
        }
      }
    }
  }
}


void checkIfCentipedeIsStuck() {
  boolean allFalse;

  if (!CanMoveLeft && !canMoveRight && !canMoveUp && !canMoveDown) {
    //Hij laat de println al zien als de moveDown false is?
    allFalse = true;

    if (allFalse == true) {
      println("Centipede is stuck!");
    }
  }
}


//Laat de body het hoofd volgen
void moveCentipedeBody() {
  int[][] gameTileMap = getGameTileMap();

  for (int row = 0; row < gameTileMap.length; row++) {
    for (int colomn = 0; colomn < gameTileMap[row].length; colomn++) {
      switch (gameTileMap[row][colomn]) {
      case 1:
        if (amountOfChameleonsHit == 9) {
          gameTileMap[row][colomn] = 14;
        } else {
          gameTileMap[row][colomn] = 2;
        }
        break;

      case 2:
        if (amountOfChameleonsHit == 8) {
          gameTileMap[row][colomn] = 14;
        } else {
          gameTileMap[row][colomn] = 3;
        }
        break;

      case 3:
        if (amountOfChameleonsHit == 7) {
          gameTileMap[row][colomn] = 14;
        } else {
          gameTileMap[row][colomn] = 4;
        }
        break;

      case 4:
        if (amountOfChameleonsHit == 6) {
          gameTileMap[row][colomn] = 14;
        } else {
          gameTileMap[row][colomn] = 5;
        }
        break;

      case 5:
        if (amountOfChameleonsHit == 5) {
          gameTileMap[row][colomn] = 14;
        } else {
          gameTileMap[row][colomn] = 6;
        }
        break;

      case 6:
        if (amountOfChameleonsHit == 4) {
          gameTileMap[row][colomn] = 14;
        } else {
          gameTileMap[row][colomn] = 7;
        }
        break;

      case 7:        
        if (amountOfChameleonsHit == 3) {
          gameTileMap[row][colomn] = 14;
        } else {
          gameTileMap[row][colomn] = 8;
        }
        break;

      case 8:
        if (amountOfChameleonsHit == 2) {
          gameTileMap[row][colomn] = 14;
        } else {
          gameTileMap[row][colomn] = 9;
        }
        break;

      case 9:
        if (amountOfChameleonsHit == 1) {
          gameTileMap[row][colomn] = 14;
        } else {
          gameTileMap[row][colomn] = 10;
        }
        break;
        
      case 10: 
        gameTileMap[row][colomn] = 14;
        break;
      }
    }
  }
}


//
void checkIfOnFruitOrChameleon(int row, int colomn) {  
  switch (keyCode) {
  case LEFT:
    //Checkt bij het naar links gaan van de centipede of de centipede head op een banaan komt
    if (getGameTileMap()[row][colomn - 1] == 11) {
      whenOverBanana();
    } else if (getGameTileMap()[row][colomn - 1] == 12) {
      whenOverCherry();
    } else if (getGameTileMap()[row][colomn - 1] == 13) {
      amountOfChameleonsHit++;
    }       
    break;

  case RIGHT:
    //Checkt bij het naar rechts gaan van de centipede of de centipede head op een banaan komt
    if (getGameTileMap()[row][colomn + 1] == 11) {
      whenOverBanana();
    } else if (getGameTileMap()[row][colomn + 1] == 12) {
      whenOverCherry();
    } else if (getGameTileMap()[row][colomn + 1] == 13) {
      amountOfChameleonsHit++;
    }  
    break;  

  case UP:
    //Checkt bij het naar boven gaan van de centipede of de centipede head op een banaan komt
    if (getGameTileMap()[row - 1][colomn] == 11) {
      whenOverBanana();
    } else if (getGameTileMap()[row - 1][colomn] == 12) {
      whenOverCherry();
    } else if (getGameTileMap()[row - 1][colomn] == 13) {
      amountOfChameleonsHit++;
    } 
    break;

  case DOWN:
    //Checkt bij het naar beneden gaan van de centipede of de centipede head op een banaan komt
    if (getGameTileMap()[row + 1][colomn] == 11) {
      whenOverBanana();
    } else if (getGameTileMap()[row + 1][colomn] == 12) {
      whenOverCherry();     
    } else if (getGameTileMap()[row + 1][colomn] == 13) {
      amountOfChameleonsHit++;
    }
    break;
  }
}


int y;
int marginDown = 40;

void showamountOfChameleonsHit() {
  y = getYgameWindow() / 2 * 3 - 50;

  drawText(getXgameWindow() / 2, y, "Aantal kameleons aan geraakt: " + amountOfChameleonsHit, FONTSIZE - 10, 0, 0);
}

void showAmountOfBananasEaten() { 
  drawText(getXgameWindow() / 2, y + marginDown, "Aantal bananen gegeten: " + amountOfBananasEaten, FONTSIZE - 10, 0, 0);
}

void showAmountOfCherrysEaten() {
  drawText(getXgameWindow() / 2, y + marginDown * 2, "Aantal kersen gegeten: " + amountOfCherrysEaten, FONTSIZE - 10, 0, 0);
}
