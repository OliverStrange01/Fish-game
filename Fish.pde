abstract class Fish {
  int x, y;
  float speedX = random(2, 5); // Randomized speed for each fish between 2 and 5
  float speedY = -1; //speed on y axis set to -1
  int w = 60, h = 30; // Default dimensions
  PImage img;

  Fish(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void render() {
    if (img != null) {
      image(img, x, y, w, h); // Render image if available
    } else {
      fill(255, 0, 0); // Fallback: to a black rectangle //error if no fallback
      rect(x, y, w, h);
    }
  }

  void update() { //Calls to other functions
    move();
    render();
  }

  void move() {
    x -= speedX; // Move left
    
    // Randomly adjust the Y axis speed
    if (random(1) < 0.05) { // Adjust direction with a small probability
      speedY = random(-2, 2); // Randomize y axis speed within a range
    }
    
    y += speedY; // Speed on y axis
    
    // Keep the fish within the vertical bounds of the screen
    if (y < 0) {
      y = 0;
      speedY = abs(speedY); // Move downwards
    } else if (y > height - h) {
      y = height - h;
      speedY = -abs(speedY); // Move upwards
    }
  
    if (x < -w) { // If fish goes off screen to the left
      respawn(); // Call respawn
    }
  }

  void respawn() {
    x = width + w; // Move fish to the far right
    y = int(random(height - h)); // Randomize y axis position
    speedX = random(2, 5); // Randomize speed for variation
    speedY = -1;
  }
}
