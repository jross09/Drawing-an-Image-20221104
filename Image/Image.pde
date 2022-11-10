//Background Image Example
//
//Global Variables
int appWidth, appHeight;
Boolean widthLarger = false, heightLarger = false;
Boolean widthLarger2 = false, heightLarger2 = false;
float picWidthAdjusted=0.0, picHeightAdjusted=0.0;
float imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight;
float topHalfX, topHalfY, topHalfWidth, topHalfHeight;
float bottomHalfX, bottomHalfY, bottomHalfWidth, bottomHalfHeight;
PImage pic, pic2, pic3;
Boolean nightMode=false;
int tintDayMode=255, tintDayModeOpacity=50;
int tintRed=64, tintGreen=64, tintBlue=40, tintNightModeOpacity=85;
//
void setup() 
{
 size(800, 600); //Landscape
  //Copy Display Algorithm from Hello World
  appWidth = width;
  appHeight = height;
  //
  //Image Dimensions for Aspect Ratio
  //Obi-wan-star-wars-jedi-23864621-800-600.jpg
  //Note: Dimensions are found in the image file / Right Click / Properties / Details
  int picWidth = 800;
  int picHeight = 600;
  int pic2Width = 720; //Landscape
  int pic2Height = 540;//Landscape
  //int pic3Width = ; //portrait
  //int pic3Height = ; //portrait
  //
  float smallerDimension, largerDimension, smallerDimension2, largerDimension2;
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
  if ( pic2Width >= pic2Height ) { //True if Landscape or Square
    largerDimension2 = pic2Width;
    smallerDimension2 = pic2Height;
    widthLarger2 = true;
    //Landscape large Image to larger space OR smaller space
  } else { //False if Portrait
    largerDimension2 = pic2Height;
    smallerDimension2 = pic2Width;
    heightLarger2 = true;
  }
  //
  //Teaching example, width is known to be larger
  float imageWidthRatio=0.0, imageHeightRatio=0.0;
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
  //Population
  pic = loadImage("../Images Used/Landscape/41xxXiE4nsL._AC_.jpg");
  pic2 = loadImage("../Images Used/Landscape/619d130e28000009387eb078.jfif");
  //pic3 = loadImage("../Images Used/");
  imageBackgroundX = appWidth*0;
  imageBackgroundY = appHeight*0;
  imageBackgroundWidth = appWidth-1;
  imageBackgroundHeight = appHeight-1;
  topHalfX = appWidth * 1/4;
  topHalfY = appHeight * 1/20;
  topHalfWidth = appWidth * 1/2;
  topHalfHeight = appHeight * 8/20;
  bottomHalfX = appWidth * 1/2;
  bottomHalfY = appHeight * 3/4;
  bottomHalfWidth = appWidth * 1/4;
  bottomHalfHeight = appHeight * 4/20;
  //
  //Rectangle Layout and Image drawing to CANVAS
  rect(imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight);
  rect( topHalfX, topHalfY, topHalfWidth, topHalfHeight ); //Top half
  rect( bottomHalfX, bottomHalfY, bottomHalfWidth, bottomHalfHeight ); //Bottom half
  //
  //Background Image must be in single executed code
  if (nightMode == false)tint(tintDayMode, tintDayModeOpacity); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
  if (nightMode == true) tint(tintRed, tintGreen, tintBlue, tintNightModeOpacity);
  //image(pic, imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight);
  image(pic, imageBackgroundX, imageBackgroundY, picWidthAdjusted, picHeightAdjusted);
}//End setup
//
void draw() 
{
  image(pic2, topHalfX, topHalfY, topHalfWidth, topHalfHeight);
  //image(pic3, bottomHalfX, bottomHalfY, bottomHalfWidth, bottomHalfHeight);
  
}//End draw
//
void keyPressed() {}//End keyPressed
//
void mousePressed() {
  //
  //Mouse Pressed will control background image
  if(mouseButton == LEFT){
  nightMode = false;
  rect(imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight);
  tint(tintDayMode, tintDayModeOpacity); //Gray Scale: use 1/2 tint value for white
  image(pic, imageBackgroundX, imageBackgroundY, picWidthAdjusted, picHeightAdjusted);
  //
  }
  if(mouseButton == RIGHT) {
  nightMode = true;
  rect(imageBackgroundX, imageBackgroundY, imageBackgroundWidth, imageBackgroundHeight);
  tint(tintRed, tintGreen, tintBlue, tintNightModeOpacity); //RGB: Night Mode
  image(pic, imageBackgroundX, imageBackgroundY, picWidthAdjusted, picHeightAdjusted);
  }
}//End mousePressed
//
//End Main Program
