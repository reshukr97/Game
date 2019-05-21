class Paddle
{
  //attributes
  float xLoc;     //x and y  locations
  float yLoc;
  float halfLength; //half the length of paddle


  //constructor
  Paddle()
  {
    xLoc=10; //always 10 pixels right of left wall
    yLoc=height/2;
    halfLength=30; //total length of paddle is 60 (30 *2)
  }


  //methods
  void moveLogo()
  {
    yLoc=mouseY; //mov mouse
  }
  
  boolean collide(Ball ba)
  {
    if(ba.xLoc < this.xLoc+ba.rad && //ball class enough to paddle
    ba.yLoc >this.yLoc-halfLength && //and below the upper end of paddle 
   ba.yLoc < this.yLoc+halfLength) //and above the lower end of the paddle
    {
      return true;
    }
    else
    {
    return false;
    }
  }
  
  
  
  void displayLogo()
  {
    strokeWeight(10);
    stroke(170,255,175);
    line(xLoc, yLoc-halfLength, xLoc, yLoc+halfLength); //halflength is a constant
  }
}