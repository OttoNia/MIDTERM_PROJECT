String message;

  int points = 0;

float gravity = 0.4;
float gravityDelta = 0.01;
float friction = 0.99;
float floor;

Cannon cannon;
ArrayList<Ghost> planes;
ArrayList<Hunt> explosions;
int carInterval = 1000;
int markTime = 0;
boolean debug = true;
color debugColor = color(255, 127, 0);

PImage G2Img, G1, B;

void setup() {
  size(900, 700, P2D);
  
      B = loadImage("B.png");
      
  floor = height;
  
  cannon = new Cannon(width/2, height - 100);
  planes = new ArrayList<Ghost>();
  explosions = new ArrayList<Hunt>();

  G2Img = loadImage("G2.png");
  G2Img.resize(256, 256);
  imageMode(CENTER);
  
  message = "Ghost Hunt";
  textSize(32);
  text("points : ", 10, 10);
}

void draw() {
  
  background(0);
     image(B, 450, 350, 900,700);
     
   fill(255);
   textSize(32);
   text(message, width/2-textWidth(message)/2, 50);
  
  int t = millis();
  
  if (t > markTime + carInterval) {
    planes.add(new Ghost());
    markTime = t;
  }
    
  cannon.run();
    
  for (int i=planes.size()-1; i>=0; i--) {
    Ghost plane = planes.get(i);
    
    if (plane.alive) {
      plane.run();
    } else {
      planes.remove(i);
    }
  }
  
  for (int i=explosions.size()-1; i>=0; i--) {
    Hunt explosion = explosions.get(i);
    
    if (explosion.alive) {
      explosion.run();
    } else {
      explosions.remove(i);
    }
  }
  
  println("Number of bullets: " + cannon.bullets.size());
  
  surface.setTitle("" + frameRate);
}

boolean hitDetectRect(PVector p1, PVector p2, PVector hitbox) {
  hitbox = hitbox.copy().div(2);
  
  if (p1.x >= p2.x - hitbox.x && p1.x <= p2.x + hitbox.x && p1.y >= p2.y - hitbox.y && p1.y <= p2.y + hitbox.y) {
    return true;
  } else {
    return false;
  }
  
}
