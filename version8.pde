ArrayList<Fish> fishs = new ArrayList<>();
ArrayList<Explosion> explosions = new ArrayList<>();  // List to hold explosions
Player player1; // Player class
PImage backGround;
int bgX = 0;
int bgY = 0;
int lastSpawnTime = 0;
int spawnInterval = 10000; // When new enemy spawns
int lives = 2; // Number of lives player has

// Game state
final int PLAYING = 0;
final int FINISHED = 1;
int gameMode = PLAYING;

//setup
void setup() {
  size(500, 500);
  frameRate(24);

  for (int c = 0; c < 6; c++) {
    fishs.add(new Shark(500, (int) random(height)));
  }

  backGround = loadImage("background.gif");
  backGround.resize(1000, height);

  player1 = new Player(250, 250);
}

void draw() {
  if (gameMode == PLAYING) {
    scrollBackground();
    
    if (millis() - lastSpawnTime > spawnInterval) {
      for (int c = 0; c < 2; c++) {
        fishs.add(new Stingray(500, (int) random(height)));
      }
      lastSpawnTime = millis(); // Update the spawn time
    }

    // Create a list to hold fish to be removed
    ArrayList<Fish> toRemove = new ArrayList<>();
    ArrayList<Explosion> toRemoveExplosions = new ArrayList<>();  // List for explosions to remove

    // Iterate over the fish and check for collisions
    for (Fish fish : fishs) {
      fish.update();
      if (player1.crash(fish)) {
        lives--;  // Reduce lives by 1
        toRemove.add(fish);  // Flag the fish to be removed

        // Create explosion at the fish position
        explosions.add(new Explosion(fish.x, fish.y));

        if (lives <= 0) {
          gameMode = FINISHED;  // Game over when no lives remain
        }
      }
    }

    // Remove the fish from the original list after the iteration
    fishs.removeAll(toRemove);

    // Update and display explosions
    for (Explosion explosion : explosions) {
      explosion.update();
      explosion.display();
      if (!explosion.isActive()) {
        toRemoveExplosions.add(explosion);  // Mark explosion for removal
      }
    }
    explosions.removeAll(toRemoveExplosions);  // Remove finished explosions

    // Display remaining lives
    fill(255);
    textSize(20);
    text("Lives: " + lives, width - 100, 30);

    player1.display();
  } else if (gameMode == FINISHED) {
    background(0);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("Game Over", width / 2, height / 2);
  }
}

//when key is presssed
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      bgX += 5; // Move background to the right
      for (Fish fish : fishs) {
        fish.x += 5; // Move fish to the right
      }
    } else if (keyCode == RIGHT) {
      bgX -= 5; // Move background to the left
      for (Fish fish : fishs) {
        fish.x -= 5; // Move fish to the left
      }
    } else if (keyCode == UP) {
      bgY += 5; // Move background down (simulate moving up)
      for (Fish fish : fishs) {
        fish.y += 5; // Move fish down
      }
    } else if (keyCode == DOWN) {
      bgY -= 5; // Move background up (simulate moving down)
      for (Fish fish : fishs) {
        fish.y -= 5; // Move fish up
      }
    }
  }
}

//scroll background
void scrollBackground() {
  imageMode(CORNER);

  // Draw the background images for horizontal and vertical scrolling
  image(backGround, bgX, bgY);
  image(backGround, bgX + backGround.width, bgY);
  image(backGround, bgX, bgY + backGround.height);
  image(backGround, bgX + backGround.width, bgY + backGround.height);

  // Wrap the background horizontally
  if (bgX <= -backGround.width) {
    bgX = 0;
  } else if (bgX > 0) {
    bgX = -backGround.width;
  }

  // Wrap the background vertically
  if (bgY <= -backGround.height) {
    bgY = 0;
  } else if (bgY > 0) {
    bgY = -backGround.height;
  }
}
