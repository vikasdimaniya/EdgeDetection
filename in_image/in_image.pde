PImage tower;

PImage img;
void setup() {
  size(780 , 1040);
  tower = loadImage("../a5.jpeg");
  img = createImage(tower.width,tower.height , RGB);  
}
int diff(color a,color b){
  int diff=0;
  float x1=red(a);
  float x2=red(b);
  float y1=green(a);
  float y2=green(b);
  float z1=blue(a);
  float z2=blue(b);
  diff=(int)sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)+(z1-z2)*(z1-z2));
  return diff ;
}
void draw() {
    int d=color(255)-color(246);
    tower.loadPixels();
    for (int i = 1; i < tower.height-1; i++) {
      for (int j = 1; j < tower.width-1;  j++) {
        int pix=i*width+j;
        /*
        img.pixels[pix] = tower.pixels[pix];
        if((((tower.pixels[pix-1]<tower.pixels[pix]+d && tower.pixels[pix+1]<tower.pixels[pix]+d) || (tower.pixels[pix-1]>tower.pixels[pix]+d && tower.pixels[pix+1]>tower.pixels[pix]+d))
           &&!((tower.pixels[pix-tower.width]<tower.pixels[pix]+d && tower.pixels[pix+tower.width]<tower.pixels[pix]+d) || (tower.pixels[pix-tower.width]>tower.pixels[pix]+d && tower.pixels[pix+tower.width]>tower.pixels[pix]+d))
        )||(!(tower.pixels[pix-1]<tower.pixels[pix]+d && tower.pixels[pix+1]<tower.pixels[pix]+d) || (tower.pixels[pix-1]>tower.pixels[pix]+d && tower.pixels[pix+1]>tower.pixels[pix]+d))
           &&((tower.pixels[pix-tower.width]<tower.pixels[pix]+d && tower.pixels[pix+tower.width]<tower.pixels[pix]+d) || (tower.pixels[pix-tower.width]>tower.pixels[pix]+d && tower.pixels[pix+tower.width]>tower.pixels[pix]+d)))
        img.pixels[pix] = color(0);
        else img.pixels[pix] = color(255);
        */
        if(!(
            (
              (tower.pixels[pix-1-tower.width]<tower.pixels[pix-tower.width]+d && tower.pixels[pix+1-tower.width]<tower.pixels[pix-tower.width]+d)
              ||
              (tower.pixels[pix-1-tower.width]>tower.pixels[pix-tower.width]+d && tower.pixels[pix+1-tower.width]>tower.pixels[pix-tower.width]+d)
            )
          
        &&(
              (tower.pixels[pix-1]<tower.pixels[pix]+d && tower.pixels[pix+1]<tower.pixels[pix]+d)
              ||
              (tower.pixels[pix-1]>tower.pixels[pix]+d && tower.pixels[pix+1]>tower.pixels[pix]+d)
           )
         
        &&(
          (
            (
              tower.pixels[pix-1+tower.width]<tower.pixels[pix+tower.width]+d && tower.pixels[pix+1+tower.width]<tower.pixels[pix+tower.width]+d)||(tower.pixels[pix-1+tower.width]>tower.pixels[pix+tower.width]+d && tower.pixels[pix+1+tower.width]>tower.pixels[pix+tower.width]+d)
            )
          )  
          &&//horizontal
          (
              (tower.pixels[pix-1-tower.width]<tower.pixels[pix-1]+d && tower.pixels[pix-1+tower.width]<tower.pixels[pix-1]+d)
              ||
              (tower.pixels[pix-1-tower.width]>tower.pixels[pix-1]+d && tower.pixels[pix+1+tower.width]>tower.pixels[pix-1]+d)
            )
          
        &&(
              (tower.pixels[pix-tower.width]<tower.pixels[pix]+d && tower.pixels[pix+tower.width]<tower.pixels[pix]+d)
              ||
              (tower.pixels[pix-tower.width]>tower.pixels[pix]+d && tower.pixels[pix+tower.width]>tower.pixels[pix]+d)
           )
           
        &&(
          (
              (tower.pixels[pix+1+tower.width]<tower.pixels[pix+1]+d && tower.pixels[pix+1-tower.width]<tower.pixels[pix+1]+d)
              ||
             (tower.pixels[pix+1+tower.width]>tower.pixels[pix+1]+d && tower.pixels[pix+1-tower.width]>tower.pixels[pix+1]+d)
            )
          ))
        )
        img.pixels[pix] = color(0);
        //else img.pixels[pix] = tower.pixels[pix];
        else img.pixels[pix] = color(255);
      
      }
    }
    image(img, 0, 0);    
    //img.updatePixels();

  
}
