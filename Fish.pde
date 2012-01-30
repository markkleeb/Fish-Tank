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
    ellipse(x+r1/3, y-r2/2, r1/8, r1/8);
    fill(0);
    ellipse(x+r1/3, y-r2/2, r1/16, r1/16);
    ellipse(x+r1/4, y+r2/3, r1/3, r2);
     
    
  }
  else {
    
  fill(150, 150, 0);
    ellipse(x, y, r1, r2);
     triangle(x+r1/2, y, x+r1, y+r2/2, x+r1, y-r2/2);   
    fill(255);
    ellipse(x-r1/3, y-r2/2, r1/8, r1/8);
    fill(0);
    ellipse(x-r1/3, y-r2/2, r1/16, r1/16);
    ellipse(x-r1/4, y+r2/3, r1/3, r2);
    
  }
 }
 
 void big() {
   
   r1+=5;
   r2+=5;

    }
    
void die() {
 println("dead!");
 x = width+10;
 y = height +10;
  
}

}
