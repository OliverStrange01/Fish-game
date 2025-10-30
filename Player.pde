class Player{
  int x;
  int y;
  int speedOfX = 20;
  int w, h;
  PImage img1;
  
  Player(int x, int y){
    this.x = x;
    this.y = y;
    
   
  }
  
  //rendering the image
  void render() {
    if (img1 != null) {
      image(img1, x, y, w, h); // Render image if available
    } else {
      fill(255, 0, 0); // Fallback: to a rectangle //error if no fallback
      rect(x, y, w, h);
    }
  }
  
  //on screen
  void display(){
    render();
    w = 50;
    h = 25;
    img1 = loadImage("fish_Pose_1.png");
    img1.resize(w, h);
  }
  
  //collision
  boolean crash(Fish fish) {
    // Rectangle-based collision detection
    return x < fish.x + fish.w && x + w > fish.x && //checks if the fish are on the correct side of the player
           y < fish.y + fish.h && y + h > fish.y;
  }
  
}
