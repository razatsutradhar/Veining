class brush{
 float x;
 float y;
 color avgColor;
 PVector velocity;
 PVector accel;
 PVector jerk;
 boolean hitWall=false;
 
 int time = 100;
 int size;
 brush(int x, int y){
  this.x = x;
  this.y = y;
  velocity = new PVector(1,random(-3,3));
  accel = new PVector(0,random(-.006,.01));
  jerk = new PVector(0,random(-.003,.003));
 }
 brush(int x, int y, PVector velocity, int size){
  this.x = x;
  this.y = y;
  this.velocity = velocity;
  accel = new PVector(0,0);
  jerk = new PVector(0,0);
  this.size = size;
 } 
 void drawStroke(color init, color fin){
   time--;
   fill(color(map(y,0, height, red(init), red(fin)),
              map(y,0, height, green(init), green(fin)), 
              map(y,0, height, blue(init), blue(fin))));
   ellipse(x, y, size,size);
   hitWall = false;
   
   x+= velocity.x;
   y+= velocity.y;
   velocity.add(accel);
 


   //if(x<0 || x > width){
   // velocity.x = -velocity.x; 
   // hitWall = true;
   //}
   
   //if(y<0 || y>height){
   // velocity.y = -velocity.y; 
   // hitWall = true;
   //}
 }
}
