PImage source;       // Source image
PImage destination;  // Destination image
int [] masks=new int[5]; 
Integer number;
char [] hiddenmessage=new char[5];

void setup() {//writing string to file etc proccessing.org/tutorials/data
  size(230, 200);
  source = loadImage("tennis.png"); 
  // The destination image is created as a blank image the same size as the source.
  destination = createImage(source.width, source.height, RGB);
   String msg="hello";
   for (int i = 0; i < 5; i++){//figure out how to countchar
   char letter=msg.charAt(i);
   
   
        int pxl= source.pixels[i];
      int mask1 =-1652352;
      int maskedpxl=pxl & mask1;
      masks[0]=104; 
      masks[1]=101;
      masks[2]=108;
      masks[3]=108;
      masks[4]=111;
      int pickedmask=masks[i];
      int result = maskedpxl | pickedmask;
      destination.pixels[i]=result;
      
     int hiddenpxl=destination.pixels[i];
     int hiddenmask1=127;
     int hiddenmaskedpxl=hiddenpxl & hiddenmask1;
     char hiddenletter=(char)hiddenmaskedpxl;
     hiddenmessage[i]=hiddenletter;

}
for (int t = 5; t<36300; t++) { //36300 is the number of pixels in the image
        destination.pixels[t]=source.pixels[t];
      }
      System.out.println("hidden message:"+hiddenmessage[0]+hiddenmessage[1]+hiddenmessage[2]+hiddenmessage[3]+hiddenmessage[4]);
      
}

void draw() {  


  // We are going to look at both image's pixels
  source.loadPixels();
  destination.loadPixels();
  
 

  // We changed the pixels in destination
  destination.updatePixels();
  source.updatePixels();
   //Display the destination/source 
  image(destination,0,0);
  save("hiddenmessage.png");

}