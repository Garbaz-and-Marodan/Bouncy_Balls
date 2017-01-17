ArrayList<Ball> balls;
float drag = 0.75;
float gravity = 9.81;
float absorb = 0.7;

void setup() { 
  colorMode(HSB);
  size(500, 700);
  balls = new ArrayList();
  balls.add(new Ball(width/2, height/2));
}   

void draw() { 
  background(255);
  for (Ball ball : balls) {
    ball.move();
    ball.show();
    for(Ball other : balls){
      //if(other!=ball) ball.collide(other);
    }
  }
} 

void mousePressed() {
  balls.add(new Ball(mouseX, mouseY));
}

void keyPressed(){
  for (Ball ball : balls){
    ball.vel.add(new PVector(random(-5,5),random(-5,5)));
    ball.spin += random(-0.2,0.2);
  }
}