//paste file path in 24 line use same formate as there


/*
UP add colors with edges
DOWN black and white with edges
LEFT decrease color distance
RIGHT increase color distance
*/



import processing.video.*;
Movie myMovie;  
import processing.video.*;
int d=6;
PImage img;
int clrs=0;
int x_res=1920,y_res=1080;

void setup() {
  //size(1920, 1080);
  fullScreen();
  myMovie = new Movie(this, "D:\\Media\\Music Videos\\International\\Charlie Puth - Attention [Official Video].mp4");
  myMovie.play();
  myMovie.speed(1.0);
  myMovie.loop();
}
boolean diff(color c1, color c2) {
  int r1=(int)red(c1);
  int g1=(int)red(c1);
  int b1=(int)red(c1);
  int r2=(int)red(c2);
  int g2=(int)red(c2);
  int b2=(int)red(c2);
  if (sqrt(((r1-r2)*(r1-r2)+(g1-g2)*(g1-g2)+(b1-b2)*(b1-b2)))<d) {
    return false;
  }
  return true;
}
void draw() {
  if (myMovie.available() == true) {
    myMovie.read();
  }
  //img = createImage(myMovie.width, myMovie.height, RGB);
  img = createImage(x_res, y_res, RGB);
  myMovie.loadPixels();
  for (int i = 1; i < myMovie.height-1; i++) {
    for (int j = 1; j < myMovie.width-1; j++) {
      int pix=i*width+j;
      img.pixels[pix] = myMovie.pixels[pix];
      if (
        diff(myMovie.pixels[pix-1], myMovie.pixels[pix]) || diff(myMovie.pixels[pix+1], myMovie.pixels[pix])
        || 
        diff(myMovie.pixels[pix-myMovie.width], myMovie.pixels[pix]) || diff(myMovie.pixels[pix+myMovie.width], myMovie.pixels[pix]) 
        )
        img.pixels[pix] = color(0);
      else if(clrs==1) img.pixels[pix] = color(255);
      else img.pixels[pix] =myMovie.pixels[pix];
    }
  }
  image(img, 0, 0);
  img.updatePixels();
}  
void keyPressed() {
    if (keyCode == LEFT) {
      if(d>=0)d--;
      
    } else if (keyCode == RIGHT) {
      if(d<=255)d++;
    }else if (keyCode == UP) {
      clrs=1;
      
    } else if (keyCode == DOWN) {
      clrs=0;
    }  
  println(d);
}
void movieEvent(Movie m) {
  m.read();
}

//void mousePressed() {
//  myMovie.pause();
//}

//void mouseReleased() {
//  myMovie.play();
//}
