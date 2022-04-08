/*
 *SKETCH Centipedes 
 *AUTEUR Mick Waanders
 *DATE: 21-10-2021
*/
final int FONTCOLOR = #FFFFFF;
final int FONTSIZE = 40;
final int TEXTMARGINRIGHT = 200;
final int TEXTMARGINTOP = 150;

void drawButton(String text, int x, int y, int widthBtn, int heightBtn, int buttonColor, int fontSize, boolean startButton) {
  //int buttonText_marginLeft = 10;
  int buttonText_Xpos = x + widthBtn / 4 + 5;
  int buttonText_Ypos = y + heightBtn / 2;  
  
  stroke(0);
  fill(buttonColor);
  rect(x, y, widthBtn, heightBtn);
  
  if (text != null && startButton == false) {
    drawText(buttonText_Xpos, buttonText_Ypos, text, fontSize, NULL, NULL);
  }
  if (startButton == true) {
    drawText(buttonText_Xpos + 120, buttonText_Ypos, text, fontSize, NULL, NULL);   
  }
}

void drawText(int x, int y, String text, int textSize, int textMarginRight, int fontColor) {
  fill(fontColor);
  textFont(Roboto, 128);
  textSize(textSize);
  textAlign(LEFT, CENTER);
  text(text, x - textMarginRight, y);   
} 

void drawCircle(int x, int y, int circleDiameter, int fillColor) {
  noStroke();
  fill(fillColor); 
  circle(x, y, circleDiameter);
}

void drawSquare(int x, int y, int tileWidth, int fillColor) {
  noStroke();
  fill(fillColor);
  square(x, y, tileWidth);
}
