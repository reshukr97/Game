/* Ball class
 implements a ball suitable for pong
 THis version implements a ball class to encapsulae all ball behaviour
 */

class Ball
{
  //attributes ,aka class variables,instance variables,properties

  float xLoc; //x location for the centre of the logo
  float yLoc;  //y location
  float xVel; //velocity of logo in X directn
  float yVel; //velocity of logo in Y directn
  float accel; //accln factor to make ballspeed up gradually
  float diam; //diam of logo
  float rad; //radius of logo
  float oHue; //hue value of the outer circle oflogo
  float iHue;  //hue for inner circle
  float xV;
  float yV;

  //constructor for the ball class
  //parameters xV and yV initialise xVel and yVel
  Ball(float xV, float yV)
  {
    xLoc=width/2; //start logo at centre of wndw
    yLoc=height/2;
    xVel=xV;  //start moving to the right
    yVel=yV;    //start moving up a little faster
    accel=1.001;
    diam=75;
    
    rad=diam/2;
    oHue=random(0, 255); //hue values for outer
    iHue=random(0, 255); //hue for inner
  }
  //methods for ball class
  //Parameter is the paddle obj,needed for collision detection
  //returns true if tis not over(play on),false if game over
boolean moveLogo(Paddle pa)
  {
    //background(255);
    //xLoc=random(0,width);
    //yLoc=random(0,height);
xVel=xVel*accel; //Acceleration in x direction only
    xLoc=xLoc+xVel;    //move in x directn
    if (xLoc>width-rad) //Bounce off right wall
    {
      xVel=xVel* -1;         //change directn
    } 
    else if(pa.collide(this)) //Bounce of the paddle
    {
      xVel=xVel* -1;
    }
    
    else if (xLoc<rad) //Game over
    {
      
     // println("Game over");
     // xVel=xVel* -1;
     return false;
    }
    yLoc=yLoc+yVel;
    if (yLoc > height-rad) //Bounce off floor
    {
      yVel=yVel*-1;
    } else if (yLoc<rad) //boounce of ceiling
    {
      yVel=yVel*-1;
    }
    
    return true; //if game is not over,return true

    //xLoc=xLoc+random(-10,10); //jitter around current location
    //yLoc=yLoc+random(-10,10);
    //xLoc=mouseX;
    //yLoc=mouseY;
    //println(xLoc,yLoc);
  }
  //display logo at xloc,yloc
  void displayLogo()
  {
    // float rad=diam/2;
    strokeWeight(5);
    stroke(0);
    oHue=oHue+1;
    if (oHue>255)
    {
      oHue=0;
    }
    println(oHue);
    fill(oHue, 255, 255);
    ellipse(xLoc, yLoc, diam, diam); //big green circle
    line(xLoc-rad, yLoc, xLoc+rad, yLoc);
    line(xLoc, yLoc-rad, xLoc, yLoc+rad); //crosshairs
    //fill(oHue,255,0);
    //ellipse(xLoc,yLoc,diam,diam);
    //line(xLoc-50,yLoc,xLoc+50,yLoc);
    //line(xLoc,yLoc-50,xLoc,yLoc+50);

    fill(iHue, 255, 255);
    iHue=iHue-1;
    if (iHue<0)
    {
      iHue=255;
    }
    println(iHue);
    line(xLoc-25, yLoc, xLoc+25, yLoc);
    line(xLoc, yLoc-25, xLoc, yLoc+25);
    ellipse(xLoc, yLoc, 50, 50);
  }
}