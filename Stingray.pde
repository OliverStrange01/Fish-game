class Stingray extends Enemy {
 
  Stingray(int x, int y) {
    super(x, y);
    w = 100; //width
    h = 150; //height
    img = loadImage("stingray_Pose_1.png"); //stingray image
    img.resize(w, h); //resize the image to fit the display size
  } //constructor
}
