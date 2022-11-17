//Global Variables
int appWidth, appHeight;
Boolean widthLarger=false, heightLarger=false;
Boolean widthLarger2=false, heightLarger2=false;
float picWidthAdjusted=0.0, picHeightAdjusted=0.0;
float picWidthAdjusted2=0.0, picHeightAdjusted2=0.0;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
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
  //fullScreen(); //displayWidth, displayHeight
  appWidth = width;
  appHeight = height;
  //
  //Population
  pic = loadImage("../Images Used/Landscape/41xxXiE4nsL._AC_.jpg");
  pic2 = loadImage("../Images Used/Landscape/sheep-closeup-eating-grass.jpg");
  //pic3 = loadImage("");
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  topHalfX = appWidth * 1/4;
  topHalfY = appHeight * 1/20;
  topHalfWidth = appWidth * 1/2;
  topHalfHeight = appHeight * 13/20;
  bottomHalfX = appWidth *1/2;
  bottomHalfY = appHeight * 3/4;
  bottomHalfWidth = appWidth * 1/4;
  bottomHalfHeight = appHeight * 4/20;
  //
  //Image Dimensions for Aspect Ratio: image meta data
  //Note: meta explored in MP3's or music files
  //Note: Dimensions are found in the image file / Right Click / Properties / Details
  int picWidth1 = 800; //Horse Landscape
  int picHeight1 = 600;
  int picWidth2 = 730; //Sheep landscape
  int picHeight2 = 400; 
  int picWidth3 = ; //Hydrant portrait
  int picHeight3 = ; //portrait
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
  float imageWidthRatio2=0.0, imageHeightRatio2=0.0;
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
  //Image is either larger or smaller than rect (including CANVAS)
  //Bicycle Image: landscape into landscape
  if ( widthLarger2 == true ) { //Lanscape or Square is TRUE
    picWidthAdjusted2 = topHalfWidth;
    imageHeightRatio2 = smallerDimension2 / largerDimension2;
    picHeightAdjusted2 = picWidthAdjusted2 * imageHeightRatio2;
  } else { //Portrait is TRUE, heightLarger2==true
    picHeightAdjusted2 = topHalfHeight;
    imageWidthRatio2 = smallerDimension2 / largerDimension2;
    picWidthAdjusted2 = picHeightAdjusted2 * imageWidthRatio2;
  }
  //
  //Verifying Variable Values after algoroithm
  println("App Width:", appWidth, " and App Height:", appHeight);
  println("Larger Image dimension is:", largerDimension);
  println("Image dimensions are:", picWidth, picHeight);
  println("Adjusted Image 1 dimensions are (stretch is goal):", picWidthAdjusted, picHeightAdjusted);
  //
  println("Image Width:", pic2Width, " and Image Height:", pic2Height);
  println("Larger Image dimension is:", widthLarger2, "or", heightLarger2);
  println("Rectangle dimensions are:", topHalfWidth, topHalfHeight);
  println("Scale Ratios, width: ", "height is", imageHeightRatio2); 
  println("Adjusted Image 2 dimensions are (stretch is goal):", picWidthAdjusted2, picHeightAdjusted2);
  //
  //Rectangular Layout and Image Drawing to CANVAS
  rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  rect( topHalfX, topHalfY, topHalfWidth, topHalfHeight ); //Top Half
  rect( bottomHalfX, bottomHalfY, bottomHalfWidth, bottomHalfHeight ); //Bottom half
  //
  //Background Image must be single executed code
  if ( nightMode == false ) tint(tintDayMode, tintDayModeOpacity); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
  if ( nightMode == true ) tint(tintRed, tintGreen, tintBlue, tintNightModeOpacity); //RGB: Night Mode
  //image( pic, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  //
}//End setup
//
void draw()
{
  image( pic2, topHalfX, topHalfY, picWidthAdjusted2, picHeightAdjusted2 );
  image( pic3, bottomHalfX, bottomHalfY, bottomHalfWidth3, bottomHalfHeight3 );
}//End draw
//
void keyPressed() {
}//End keyPressed
//
void mousePressed() {
  //
  //Mouse Pressed will control background image
  if (mouseButton == LEFT) {
    nightMode = false;
    rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
    tint(tintDayMode, tintDayModeOpacity); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
    image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
    //
  }
  if (mouseButton == RIGHT) {
    nightMode = true;
    rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
    tint(tintRed, tintGreen, tintBlue, tintNightModeOpacity); //RGB: Night Mode
    image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  }
}//End mousePressed
//
//End Main Program
