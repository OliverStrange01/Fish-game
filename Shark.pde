

class Shark extends Enemy {
 
  Shark(int x, int y) {
    super(x, y);
    w = 100; //width
    h = 50; //height
    img = loadImage("shark_Pose_1.png"); //shark image
    img.resize(w, h); //resize the image depending on the size of the display
  }
}
  
  
