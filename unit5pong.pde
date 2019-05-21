/*Pong the magnificent
 Implements a single player Pong like game
 uses a ball class and a paddle class
 */
Ball ba; //Ball object
Paddle pa; //paddle object
boolean playOn; //value is true if still palying,false  when game over
int score; //score displays at end of game

void setup()
{
  size(600, 600); //make wndw 500*500,white backgnd
  colorMode(HSB); //use Hue,Saturation,Brightness color mode
  background(255);

  ba=new Ball(2, -3);
  pa=new Paddle();
  playOn=true;
  score=0;
}
void draw()
{
  background(255);
  //pa.moveLogo(); commented out bcoz dont show the paddle after game over
  //pa.displayLogo();

  if (playOn)
  {

    if (ba.moveLogo(pa))
    {
      ba.displayLogo();
      pa.moveLogo();
  pa.displayLogo();
    }
    else 
    {
     playOn=false;
      //println("Game over");
      score=frameCount;
    }
  }
  else
  {
    background(0);
    
    fill(255);
    textSize(32);
    text("Game Over!!! Score=" + score,50,250);
    //println("Game over");
  }
}