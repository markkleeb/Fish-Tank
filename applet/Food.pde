// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 9-11: Resizing an array using append()

class Food {
  float x;
  float y;
  float speed;
  float w;
  
  Food(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
  }
  
  void gravity() {
    // Add gravity to speed
    speed = speed + gravity;
  }
  
  void move() {
    // Add speed to y location
    y = y + speed;
    if (y > height - 55) {
      y = height - 55;
    }
  }
  
  void display() {
    // Display the circle
    strokeWeight(0);
    fill(150, 100, 0);
    ellipse(x,y,w,w);
  }
  
  void eat(){
    
    y += height+10;
    x += width +10;
    
}
}
