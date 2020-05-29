import processing.video.*;
int d=0,d2=10,value=255,count=500,dimension;
float md=0;
PImage img,img2;
Capture tower;

void setup() {
  size(640, 480);

  String[] towereras = Capture.list();
  
  if (towereras.length == 0) {
    println("There are no towereras available for capture.");
    exit();
  } else {
    println("Available towereras:");
    for (int i = 0; i < towereras.length; i++) {
      println(towereras[i]);
    }
    
    // The towerera can be initialized directly using an 
    // element from the array returned by list():
    tower = new Capture(this, towereras[4]);
    tower.start();     
  }
}
boolean diff(color c1, color c2) {
  int r1=(int)red(c1);
  int g1=(int)red(c1);
  int b1=(int)red(c1);
  int r2=(int)red(c2);
  int g2=(int)red(c2);
  int b2=(int)red(c2);
  if (sqrt(((r1-r2)*(r1-r2)+(g1-g2)*(g1-g2)+(b1-b2)*(b1-b2)))<d2) {
    return false;
  }
  return true;
}
int countPix(int pix){
  int count=0;
  if(img.pixels[pix]==color(0))count++;
  if(img.pixels[pix-1]==color(0))count++;
  if(img.pixels[pix+1]==color(0))count++;
  if(img.pixels[pix-1-width]==color(0))count++;
  if(img.pixels[pix+1-width]==color(0))count++;
  if(img.pixels[pix-1+width]==color(0))count++;
  if(img.pixels[pix+1+width]==color(0))count++;
  if(img.pixels[pix-width]==color(0))count++;
  if(img.pixels[pix+width]==color(0))count++;
  return count;
}
void draw() {
  if (tower.available() == true) {
    tower.read();
  }
  img = createImage(tower.width,tower.height , RGB);
  img2 = createImage(tower.width,tower.height , RGB);
  tower.loadPixels();
  for (int i = 1; i < tower.height-1; i++) {
    for (int j = 1; j < tower.width-1;  j++) {
      int pix=i*width+j;      
      if (
        diff(tower.pixels[pix-1], tower.pixels[pix]) || diff(tower.pixels[pix+1], tower.pixels[pix])
        || 
        diff(tower.pixels[pix-tower.width], tower.pixels[pix]) || diff(tower.pixels[pix+tower.width], tower.pixels[pix]) 
        )
        
      img.pixels[pix] = color(0);
      else img.pixels[pix] = color(255);
      
      //else img.pixels[pix] = tower.pixels[pix];
      }
  }
  img.updatePixels();
  image(img, 0, 0);
 
}
