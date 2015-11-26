PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

void setup()
{
  fullScreen();
  img = loadImage("Kitchen.png"); 
  img.resize(width,height);
  background(img);  
  img1 = loadImage("ChilliPowder.png");
  img2 = loadImage("TurmericPowder.png");
  img3 = loadImage("CorianderPowder.png");
  img4 = loadImage("Bowl.png");
  img5 = loadImage("woodplate.png");
}

void draw()
{
  image(img1, 45, 340);
  image(img2, 20, 515);
  image(img3, 40, 620);
  image(img4, 526, 245);
  image(img5, 600,350);
}