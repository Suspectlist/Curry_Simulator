class Ingredient
{
  private PImage _img;
  private float _x;
  private float _y;
  
  Ingredient(String imgName)
  {
    _img = loadImage(imgName);
    _x = 0;
    _y = 0;
  }
  
  public void SetPos(float x, float y)
  {
    _x = x;
    _y = y;
  }
  
  public void Draw()
  {
    image(_img, _x, _y);
  }
  
  public boolean isColliding(float x, float y)
  {
    if (x > _x)
    {
      if ( y > _y)
      {
        if ( x < _x + _img.width)
        {
          if ( y < _y + _img.height)
          {
            println("Hand is colliding with me.");
            return true;
          }
        }
      }
    }
    return false;
  }
}