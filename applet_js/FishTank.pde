Fish[] fish = new Fish[1];
Food[] food = new Food[1]; // We start with an array with just one element.
float gravity = 0.015;
int counter[] = new int[1];

void setup() {
  size(600, 500);
  smooth();


  food[0] = new Food(150, 0, 8);
  fish[0] = new Fish();
  counter[0] = 0;
}

void draw() {
  background(255);
  strokeWeight(5);
  stroke(0);
  fill(255);
  rectMode(CENTER);
  rect(300, 250, 500, 400);
  noStroke();
  fill(0, 0, 255);
  rect(300, 300, 500, 300);


  for (int a=0; a< fish.length; a++) {
    fish[a].display();
    fish[a].move();
  }

  // Update and display all balls
  for(int a=0; a<fish.length; a++) {
  for (int i = 0; i < food.length; i ++ ) { // Whatever the length of that array, update and display all of the objects.
    food[i].gravity();
    food[i].move();
    food[i].display();



    if (fish[a].eat(food[i])) {
      fish[a].mouth();
      food[i].eat();
      counter[a] +=1;

      }
    }
}

for(int a = 0; a<fish.length; a++){
  for (int j = 0; j < 50; j+=5) {

        if (counter[a] > j) {
          fish[a].big();
        }

      if (counter[a] == 50) {
          fish[a].die();
          Fish b = new Fish();
         Fish c = new Fish();
          fish = (Fish[]) append(fish, b);
          fish = (Fish[]) append(fish, c);
          counter = expand(counter, fish.length);
          counter[a] = 0;
          
        }
  }
}
}

void mousePressed() {
  // A new ball object
  Food f = new Food(mouseX, mouseY, 8); // Make a new object at the mouse location.
  food = (Food[]) append(food, f);

  // Here, the function, append() adds an element to the end of the array. 
  // append() takes two arguments. The first is the array you want to append to, and the second is the thing you want to append. 
  // You have to reassign the result of the append() function to the original array. 
  // In addition, the append() function requires that you explicitly state the type of data in the array again by putting the 
  // array data type in parentheses: (Ball[]) This is known as casting.
}

class Fish {
  
  float x;
  float y;
  float r1;
  float r2;
  float xspeed;
  float yspeed;
  
  Fish() {
  
  x = random(100, 500);
 y = random(150, 420);
 
 xspeed = random(1,5);
 yspeed = random(1,5);
  }
  
 
  
  void move(){
    
    r1 = 30;
    r2 = 10;
    
    y += yspeed;
    x += xspeed;
    
  
    
    if(y > 420 || y < 150){
      yspeed = yspeed*-1;
    }
    else if (x > 500 || x < 100) {
      xspeed = xspeed*-1;
      
    }
    
   
  }
  
  void display() {
    
    if(xspeed > 1) {
    fill(150, 150, 0);
    ellipse(x, y, r1, r2);
    triangle(x-r1/2, y, x-r1, y+r2/2, x-r1, y-r2/2);  
    fill(255);
    ellipse(x+10, y-5, r1/8, r1/8);
    fill(0);
    ellipse(x+10, y-5, r1/16, r1/16);
     
    
  }
  else {
  fill(150, 150, 0);
    ellipse(x, y, r1, r2);
     triangle(x+r1/2, y, x+r1, y+r2/2, x+r1, y-r2/2);   
    fill(255);
    ellipse(x-10, y-5, r1/8, r1/8);
    fill(0);
    ellipse(x-10, y-5, r1/16, r1/16);
    
  }
  }
  
    boolean eat(Food a) {
   
    if (x+50 > a.x+a.w/2 && x-50 < a.x-a.w/2 && y+30 > a.y+a.w/2 && y-30 < a.y-a.w/2) {  //if bullet hits an alien
      return true;
    } else {
      return false;
    }
      } 
 
 void mouth(){
   
      if(xspeed > 1) {
    fill(150, 150, 0);
    ellipse(x, y, r1, r2);
    triangle(x-r1/2, y, x-r1, y+r2/2, x-r1, y-r2/2);  
    fill(255);
    ellipse(x+10, y-5, r1/8, r1/8);
    fill(0);
    ellipse(x+10, y-5, r1/16, r1/16);
    ellipse(x+r1/4, y+r2/3, r1/3, r1/3);
     
    
  }
  else {
    
  fill(150, 150, 0);
    ellipse(x, y, r1, r2);
     triangle(x+r1/2, y, x+r1, y+r2/2, x+r1, y-r2/2);   
    fill(255);
    ellipse(x-10, y-5, r1/8, r1/8);
    fill(0);
    ellipse(x-10, y-5, r1/16, r1/16);
    ellipse(x-r1/4, y+r2/3, r1/3, r1/3);
    
  }
 }
 
 void big() {
   
   r1+=5;
   r2+=5;


    }
void die() {
 
 x = width+10;
 y = height +10;
  
}

}
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
    x +=width +10;
    
}
}

