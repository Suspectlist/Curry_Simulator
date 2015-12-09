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

Ingredient corian;
Ingredient chilli;
Ingredient water;
Ingredient garlic;
Ingredient onion;
Ingredient turm;
Ingredient bowl;
Ingredient plate;

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
  
  corian = new Ingredient("CorianderPowder.png");
  chilli = new Ingredient("ChilliPowder.png");
  water = new Ingredient("Water.png");
  garlic = new Ingredient("garlic.png");
  onion = new Ingredient("onion.png");
  turm = new Ingredient("TurmericPowder.png");  
  bowl = new Ingredient("Bowl.png");
  plate = new Ingredient("woodplate.png");
  
  k = new Kinect(this);
  tracker = new KinectTracker();
  k.setTilt(0);
  widthScale = width/k.width;
  heightScale = height/k.height;
}

void draw()
{
  background(imgKitchen);  
  fill(255);
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
  onion.SetPos(250, 150);
  onion.Draw();
  garlic.SetPos(250,400);
  garlic.Draw();
  water.SetPos(526, 45);
  water.Draw();
  corian.SetPos(80, 420);
  corian.Draw();
  chilli.SetPos(45, 140);
  chilli.Draw();
  turm.SetPos(20, 315);
  turm.Draw();
  bowl.SetPos( 526, 245);
  bowl.Draw();
  plate.SetPos(-200, 50);
  plate.Draw();
  
  image(imgBowl, 526, 245);
  image(imgPlate, -200, 50);
  image(imgChilli, 45, 140);
  image(imgTurm, 20, 315);
  image(imgCorian, 80, 420);
  image(imgOnion, 250, 150);
  image(imgGarlic, 250, 400);
  image(imgWater, 526, 45);
  ellipse(640, 355, 175, 170);

  tracker.track();

  PVector v1 = tracker.getPos();
  image(imgHand,v1.x,v1.y);
  PVector v2 = tracker.getLerpedPos();

  int t = tracker.getThreshold();
  float scaledX = map(v2.x, 0, k.width, 0, width);
  float scaledY = map(v2.y, 0, k.height, 0, height);
  
  if (water.isColliding(scaledX,scaledY))
  {
   fill(0,255,255);
   ellipse(640,355,175,170);
  }
  
  if (corian.isColliding(scaledX,scaledY))
  {
    fill(0, 153, 0);
    ellipse(640,355,175,170);
  }
  
  if (chilli.isColliding(scaledX,scaledY))
  {
    fill(178,34,34);
    ellipse(640,355,175,170);
  }
  
  if (turm.isColliding(scaledX,scaledY))
  {
    fill(218,165,32);
    ellipse(640,355,175,170);
  }
  
  if (onion.isColliding(scaledX,scaledY))
  {
    fill(0,191,255);
    ellipse(640,355,175,170);
  }
  
  if (garlic.isColliding(scaledX,scaledY))
  {
    fill(0,191,255);
    ellipse(640,355,175,170);
  }
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
  {
    //paintImg.set(x, y, color(0) );
  }
}