abstract class Enemy extends Fish {
 
  Enemy(int x, int y) {

    super(x, y);

  }

  @Override

   void update() {

    move();

    render(); //display

  }

}
