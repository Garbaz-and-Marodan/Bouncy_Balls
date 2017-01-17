
class Ball {
  PVector pos, vel, acc;
  float size, mass, angle, spin;
  color col;

  Ball(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    size = random(80,100);
    spin = random(-0.2,0.2); 
    angle = 0; // +: clock , -: anti-clock
    mass = 1/size;
    col = color(random(0,255),255,255);
  }

  void move() {
    acc.y = mass*gravity;
    acc.mult(drag);
    vel.add(acc);
    if (pos.y>=height-size/2)vel.mult(drag);
    pos.add(vel);
    bounce();
    spin();
  }

  void spin() {
    angle += spin;
  }

  void bounce() {
    if (pos.y>=height-size/2) { // bottom
      pos.y = height-size/2;
      vel.x += spin*10;
      vel.y *= -absorb;
      spin *= absorb;
    } else if (pos.y<=size/2) { // top
      pos.y = size/2;
      vel.x -= spin*10;
      vel.y *= -absorb;
      spin *= absorb;
    }
    if (pos.x>=width-size/2) { // right
      pos.x = width-size/2;
      vel.y -= spin*10;
      vel.x *= -absorb;
      spin *= absorb;
    } else if (pos.x<=size/2) { // left
      pos.x = size/2;
      vel.y += spin*10;
      vel.x *= -absorb;
      spin *= absorb;
    }
  }
  
  void collide(Ball other){
    if(dist(pos.x,pos.y,other.pos.x,other.pos.y)<=size/2+other.size/2){
      vel.mult(-absorb);
    }
  }

  void show() {
    fill(col);
    stroke(0);
    strokeWeight(3);

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    ellipse(0, 0, size, size);
    ellipse(size/2, 0, 5, 5);
    popMatrix();
  }
}