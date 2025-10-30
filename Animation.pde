class Explosion {
  float x, y;  // Position of the explosion
  int radius;  // Radius of the explosion effect
  int maxRadius;  // Maximum size of the explosion
  int duration;  // Duration of the explosion
  int timeElapsed;  // Time elapsed since the explosion started

  Explosion(float x, float y) {
    this.x = x;
    this.y = y;
    this.radius = 10;
    this.maxRadius = 50;  // Max size of explosion
    this.duration = 500;  // Duration in milliseconds
    this.timeElapsed = 0;
  }

  // Update the explosion effect
  void update() {
    if (timeElapsed < duration) {
      radius += 2;  // Increase the radius
      timeElapsed += 20;  // Increment time
    }
  }

  // Display the explosion
  void display() {
    noFill();
    stroke(255, 0, 0);  // Red color for explosion
    strokeWeight(3);
    ellipse(x, y, radius, radius);  // Draw explosion
  }

  // Check if explosion is still active
  boolean isActive() {
    return timeElapsed < duration;
  }
}
