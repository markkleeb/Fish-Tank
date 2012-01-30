Fish[] fish = new Fish[1];
Food[] food = new Food[1]; // We start with an array with just one element.
float gravity = 0.015;
int counter[] = new int[1];

void setup() {
 frameRate(40);
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
  for (int j = 0; j < 30; j+=3) {

        if (counter[a] > j) {
          fish[a].big();
        }

      if (counter[a] >= 30) {
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

