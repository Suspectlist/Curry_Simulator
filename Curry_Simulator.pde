PImage imgKitchen;
PImage imgChilli;
PImage imgTurm;
PImage imgCorian;
PImage imgBowl;
PImage imgPlate;

void setup()
{
  fullScreen();
  imgKitchen = loadImage("Kitchen.png"); 
  img.resize(width,height);
  background(imgKitchen);  
  imgChilli = loadImage("ChilliPowder.png");
  imgTurm = loadImage("TurmericPowder.png");
  imgCorian = loadImage("CorianderPowder.png");
  imgBowl = loadImage("Bowl.png");
  imgPlate = loadImage("woodplate.png");
}

void draw()
{
  image(imgChilli, 45, 340);
  image(imgTurm, 20, 515);
  image(imgCorian, 40, 620);
  image(imgBowl, 526, 245);
  image(imgPLate, 600,350);
  
  Controls();
}

void Controls()
{
  //chilli
  if (