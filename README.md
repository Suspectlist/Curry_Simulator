<h1>Unit 3 Final Project: [[Unit 3 Coding Project Final]]</h1>

<strong>Interaction</strong>:

<strong>Description</strong>: Our Project is Curry Simulator
<h2>Timeline</h2>

<div>
  <h3>Milestone #1: November 20th, 2015 </h3>
  <strong>Goal:</strong> You should have solid planning done by the end of this milestone.
  <ul>
    <li>Partnering Sean in this project</li>
    <li>Sean and I have a plan making a curry simulator game</li>
    <li>Researched on the web to see what spices changes the curry colour</li>
    <li>Also researched a bit about Kinect and how it works with processing</li>
    <li>Starting the project with the most important part of the project which is the curry and spices
  </ul>
</div>

<p>
  <h3>Milestone #2: November 30th, 2015 </h3>
  <strong>Goal:</strong> You should have a small prototype by the end of this milestone.
  <ul>
    <li>first task : Sean making curry and a bowl in the middle. Also doing background</li>
    <li>second task: Tahmid is making the spices that we put at the side</li>
    <li>third task: When done processing our tasks, we put it in somebody’s laptop</li>
    <li>fourth task: We put our coding together to make our objective</li>
    <li>fifth task: Show Linus that we have done our objective</li>

    <li>Project so far: PImage img1;
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

class KinectTracker {

  // Depth threshold
  int threshold = 745;

  // Raw location
  PVector loc;

  // Interpolated location
  PVector lerpedLoc;

  // Depth data
  int[] depth;
  
  // What we'll show the user
  PImage display;
   
  KinectTracker() {
    // This is an awkard use of a global variable here
    // But doing it this way for simplicity
    kinect.initDepth();
    kinect.enableMirror(true);
    // Make a blank image
    display = createImage(kinect.width, kinect.height, RGB);
    // Set up the vectors
    loc = new PVector(0, 0);
    lerpedLoc = new PVector(0, 0);
  }

  void track() {
    // Get the raw depth as array of integers
    depth = kinect.getRawDepth();

    // Being overly cautious here
    if (depth == null) return;

    float sumX = 0;
    float sumY = 0;
    float count = 0;

    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {
        
        int offset =  x + y*kinect.width;
        // Grabbing the raw depth
        int rawDepth = depth[offset];

        // Testing against threshold
        if (rawDepth < threshold) {
          sumX += x;
          sumY += y;
          count++;
        }
      }
    }
    // As long as we found something
    if (count != 0) {
      loc = new PVector(sumX/count, sumY/count);
    }

    // Interpolating the location, doing it arbitrarily for now
    lerpedLoc.x = PApplet.lerp(lerpedLoc.x, loc.x, 0.3f);
    lerpedLoc.y = PApplet.lerp(lerpedLoc.y, loc.y, 0.3f);
  }

  PVector getLerpedPos() {
    return lerpedLoc;
  }

  PVector getPos() {
    return loc;
  }

  void display() {
    PImage img = kinect.getDepthImage();

    // Being overly cautious here
    if (depth == null || img == null) return;

    // Going to rewrite the depth image to show which pixels are in threshold
    // A lot of this is redundant, but this is just for demonstration purposes
    display.loadPixels();
    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {

        int offset = x + y * kinect.width;
        // Raw depth
        int rawDepth = depth[offset];
        int pix = x + y * display.width;
        if (rawDepth < threshold) {
          // A red color instead
          display.pixels[pix] = color(150, 50, 50);
        } else {
          display.pixels[pix] = img.pixels[offset];
        }
      }
    }
    display.updatePixels();

    // Draw the image
    image(display, 0, 0);
  }

  int getThreshold() {
    return threshold;
  }

  void setThreshold(int t) {
    threshold =  t;
  }
}
 
  </ul>
</p>

<div>
  <h3>Milestone #3: December 7th, 2015 (For C block)</br>
  Milestone #3: December 8th, 2015 (For G block) </h3>
  <strong>Goal:</strong> You should have iterated and improved on your prototype by the end of this milestone.
  <ul>
    <li>first task:Sean doing the messages and the other bowls</li>
    <li>second task:Tahmid doing collisions on the curry and make sure it changes colour</li>
    <li>third task:Put it again in one laptop</li>
    <li>fourth task:Process it through the kinect. If something doesn’t work, ask Linus or John</li>
    <li>fifth task:Get ready for the presentation</li>
  </ul>
</div>
