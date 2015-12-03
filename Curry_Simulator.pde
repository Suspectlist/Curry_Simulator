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

void setup()
{
  fullScreen();
  imgKitchen = loadImage("Kitchen.png"); 
  imgKitchen.resize(width,height);
  background(imgKitchen);  
  imgChilli = loadImage("ChilliPowder.png");
  imgTurm = loadImage("TurmericPowder.png");
  imgCorian = loadImage("CorianderPowder.png");
  imgBowl = loadImage("Bowl.png");
  imgPlate = loadImage("woodplate.png");
  imgOnion = loadImage("onion.png");
  imgGarlic = loadImage("garlic.png");
  imgWater = loadImage("Water.png");
  
  k = new Kinect(this);
  tracker = new KinectTracker();
  k.setTilt(0);
  widthScale = width/k.width;
  heightScale = height/k.height;
}

void draw()
{
  rect(250,500,600,200);
  image(imgBowl, 526, 245);
  image(imgPlate, -200, 250);
  image(imgChilli, 45, 340);
  image(imgTurm, 20, 515);
  image(imgCorian, 80, 620);
  image(imgOnion, 250, 350);
  image(imgGarlic, 250, 600);
  image(imgWater, 500, 600);
  
 
  tracker.track();
  
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(v1.x, v1.y, 20, 20);
  
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);
  
  int t = tracker.getThreshold();
  text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " + 
    "UP increase threshold, DOWN decrease threshold", 10, 500);
  float scaledX = map(v2.x, 0, k.width,  0, width);
  float scaledY = map(v2.y, 0, k.height, 0, height);
  
}

void keyPressed() 
{
  int t = tracker.getThreshold();
    if (keyCode == UP) 
    {
      t+=5;
      tracker.setThreshold(t);
    } 
    else if (keyCode == DOWN) 
    {
      t-=5;
      tracker.setThreshold(t);
    }
    else if ( keyCode == 'c')
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

void Controls()
{
  //chilli
  
  
  //turm
  
  //corian
  
  //onion
  
  //garlic
}

  
  