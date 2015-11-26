PImage img1;
PImage img2;
PImage img3;
PImage img4;

void setup()
{
  fullScreen();
  img1 = loadImage("ChilliPowder.png");
  img2 = loadImage("TurmericPowder.png");
  img3 = loadImage("CorianderPowder.png");
  img4 = loadImage("Bowl.png");
}

void draw()
{
  image(img1, 45, 340);
  image(img2, 20, 515);
  image(img3, 40, 620);
  image(img4, 150, 150);
}