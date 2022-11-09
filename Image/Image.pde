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
  //Copy Display Orientation from Hello World
  appWidth = width;
  appHeight = height;
  //
  //Image Dimensions for Aspect Ratio
  //41xxXiE4nsL._AC_.jpg
  //Note: dimensions are found in the image file/ right click/ properties/ details
  int picWidth = 500;
  int picHeight = 500;
  //
  float largerDimension, smallerDimension;
  //Image Orientation: Landscape, Portrait, Square
  if ( picWidth >= picHeight) { //True if Landscape or Square
  largerDimension = picWidth;
  smallerDimension = picHeight;
  widthLarger = true;
  } else { //False if Portrait
  largerDimension = picHeight;
  smallerDimension = picWidth;
  heightLarger = true;
  }
}//End setup
//
void draw() {}//End draw
void keyPressed() {}//End keyPressed
void mousePressed() {}//End mousePressed
//



/* Older algorithm
if ( widthLarger == true) imageWidthRatio = largerDimension / largerDimension;
if ( widthLarger == true) imageHeightRatio = smallerDimension / largerDimension;
if ( heightLarger == true) imageWidthRatio = smallerDimension / largerDimension;
if ( heightLarger == true) imageHeightRatio = largerDimension / largerDimension;
*/
float picWidthAdjusted=0.0, picHeightAdjusted=0.0; 
//Better Image Streth Algorithm
if (appWidth >= picWidth) {
  picWidthAdjusted = picWidth;
  if ( widthLarger == true) imageWidthRatio = largerDimension / largerDimension;
  if ( heightLarger == true) imageWidthRatio = smallerDimension / largerDimension;
} else {
  //Image smaller than CANVAS needs seperate algorithm
  }
if (appHeight >= picHeight) {
  picHeightAdjusted = (picHeight);
   if ( widthLarger == true) imageHeightRatio = smallerDimension / largerDimension;
   if ( heightLarger == true) imageHeightRatio = largerDimension / largerDimension;
} else {
 //Image smaller than CANVAS needs seperate algorithm
}
println (appWidth, imageWidthRatio);
println (appHeight, imageHeightRatio);
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
