import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

Kinect k;
KinectTracker tracker;
float widthScale;
float heightScale;

PImage imgKitchen;
PImage imgChilli;
PImage imgTurm;
PImage imgCorian;
PImage imgBowl;
PImage imgPlate;
PImage imgOnion;
PImage imgGarlic;
PImage imgWater;
PImage imgHand;

void setup()
{
  fullScreen();
  imgKitchen = loadImage("Kitchen.png"); 
  imgKitchen.resize(width, height);
  background(imgKitchen);  
  imgChilli = loadImage("ChilliPowder.png");
  imgTurm = loadImage("TurmericPowder.png");
  imgCorian = loadImage("CorianderPowder.png");
  imgBowl = loadImage("Bowl.png");
  imgPlate = loadImage("woodplate.png");
  imgOnion = loadImage("onion.png");
  imgGarlic = loadImage("garlic.png");
  imgWater = loadImage("Water.png");
  imgHand = loadImage("hand.png");

  k = new Kinect(this);
  tracker = new KinectTracker();
  k.setTilt(0);
  widthScale = width/k.width;
  heightScale = height/k.height;
}

void draw()
{
  background(imgKitchen);  
  rect(870, 100, 300, 500);
  textSize(22);
  fill(0);
  text("Instructions", 950, 150); 
  fill(0);
  textSize(12);
  text("first: put your hand over the water", 880, 180);
  fill(0);
  textSize(12);
  text("second: put your hand over onion and then garlic", 880, 200); 
  fill(0);
  textSize(12);
  text("third: now put it over the chilli for spice", 880, 220);
  fill(0);
  textSize(12);
  text("fourth: put it over the turmeric", 880, 240);
  fill(0);
  textSize(12);
  text("fifth: now over the coriander for more spice", 880, 260);
  fill(0);
  textSize(12);

  fill(255);
  image(imgBowl, 526, 245);
  image(imgPlate, -200, 250);
  image(imgChilli, 45, 340);
  image(imgTurm, 20, 515);
  image(imgCorian, 80, 620);
  image(imgOnion, 250, 350);
  image(imgGarlic, 250, 600);
  image(imgWater, 1000, 600);
  ellipse(640, 355, 175, 170);

  tracker.track();

  PVector v1 = tracker.getPos();
  image(imgHand,v1.x,v1.y);
  PVector v2 = tracker.getLerpedPos();

  int t = tracker.getThreshold();
  float scaledX = map(v2.x, 0, k.width, 0, width);
  float scaledY = map(v2.y, 0, k.height, 0, height);
}

void keyPressed() 
{
  int t = tracker.getThreshold();
  if (keyCode == UP) 
  {
    t+=5;
    tracker.setThreshold(t);
  } else if (keyCode == DOWN) 
  {
    t-=5;
    tracker.setThreshold(t);
  } else if ( keyCode == 'c')
  {
    clearImage();
  }
}

void clearImage()
{
  for (int i = 0; i < width*height; i++)
  {
    //paintImg.set(x, y, color(0) );
  }
}