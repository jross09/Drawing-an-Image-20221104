//Background Image Example
//
//Global Variables
int appWidth, appHeight;
Boolean widthLarger = false, heightLarger = false;
float imageWidthRatio=0.0, imageHeightRatio=0.0;
float imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight;
PImage pic;
Boolean nightMode=false;
//
void setup() 
{
 size(1000, 800); //Landscape
  //Copy Display Algorithm from Hello World
  appWidth = width;
  appHeight = height;
  //
  //Image Dimensions for Aspect Ratio
  //Obi-wan-star-wars-jedi-23864621-800-600.jpg
  //Note: Dimensions are found in the image file / Right Click / Properties / Details
  int picWidth = 800;
  int picHeight = 600;
  //
  float smallerDimension, largerDimension;
  //Image Orientation: Landscape, Portrait, Square
  if ( picWidth >= picHeight ) { //True if Landscape or Square
    largerDimension = picWidth;
    smallerDimension = picHeight;
    widthLarger = true;
  } else { //False if Portrait
    largerDimension = picHeight;
    smallerDimension = picWidth;
    heightLarger = true;
  }
  //
  float picWidthAdjusted=0.0, picHeightAdjusted=0.0;
  //Teaching example, width is known to be larger
  //Better Image Stretch Algorithm, smaller image to larger CANVAS
  if ( appWidth >= picWidth ) {
    picWidthAdjusted = appWidth;
    //
    if ( widthLarger == true ) imageWidthRatio = largerDimension / largerDimension;
    //
    if ( appHeight >= picHeight ) {
      if ( widthLarger == true ) imageHeightRatio = smallerDimension / largerDimension;
      picHeightAdjusted = picWidthAdjusted * imageHeightRatio;
      if (appHeight < picHeightAdjusted ) {
        println("STOP: image is too big for CANVAS");
        exit(); //stops any further use of APP
        //Remember: goal is 1:1 aspect ratio
      }
    } else {
      //Image smaller than CANVAS needs separate algorithm
    }
  } else {
    //Image smaller than CANVAS needs separate algorithm
  }
  //
  //Verifying Variable Values after aglorithm
  println ("App Width;", appWidth, "And App Height", appHeight); 
  println("Larger Image Dimension is:", largerDimension);
  println("Image dimensions are:", picWidth, picHeight);
  println("adjusted Image dimensions are (stretch is goal):", picWidthAdjusted, picHeightAdjusted);
  //
}//End setup
//
void draw() {}//End draw
void keyPressed() {}//End keyPressed
void mousePressed() {}//End mousePressed
//


picWidthAdjusted = appWidth * imageWidthRatio;
picHeightAdjusted = appHeight * imageHeightRatio;
//
//Developer verified variables
println(appWidth, picWidth, picWidthAdjusted);
println(appHeight, picHeight, picHeightAdjusted);
//
//Population
pic = loadImage("../Images Used/41xxXiE4nsL._AC_.jpg");
imageBackgroundX = appWidth*0;
imageBackgroundY = appHeight*0;
imageBackgroundWidth = appWidth-1;
imageBackgroundHeight = appHeight-1;
//
//Rectangle Layout and Image drawing to CANVAS
rect(imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight);
//
//if () {} else for a Binary Choice, no single IF
if (nightMode == false)tint(255, 128); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
if (nightMode == true)tint(128, 128, 50); //RGB: Night Mode
//
//image(pic, imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight);
image(pic, imageBackgroundX, imageBackgroundY, picWidthAdjusted, picHeightAdjusted);
