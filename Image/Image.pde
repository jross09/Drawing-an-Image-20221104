//Background Image Example
//
//Global Variables
int appWidth, appHeight;
float largerDimension, smallerDimension;
Boolean widthLarger = false, heightLarger = false;
float imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight;
PImage pic;
Boolean nightMode=false;
//
size(1000, 800); //Landscape
//Copy Display Orientation from Hello World
appWidth = width;
appHeight = height;
//
//Aspect Raio Calculations
//41xxXiE4nsL._AC_.jpg
int picWidth = 500;
int picHeight = 500;
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
//
if ( widthLarger == true) imageWidthRatio = largerDimension / largerDimension;
if ( widthLarger == true) imageHeightRatio = smallerDimension / largerDimension;
if ( heightLarger == true) imageWidthRatio = smallerDimension / largerDimension;
if ( heightLarger == true) imageHeightRatio = largerDimension / largerDimension;
//
pidWidthAdjusted = picWidth * imageWidthRatio;
picHeightAdjusted = picHeight = imageHeightRatio;
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
image(pic, imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight);
