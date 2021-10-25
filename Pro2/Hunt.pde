class Hunt {
 
  int points = 0;
  
  PVector position;
  boolean alive = true;
  int timestamp;
  int lifetime = 200;
  
  Hunt(float x, float y) {
    timestamp = millis();
    position = new PVector(x, y);
  }
  
  void update() {
    if (alive && millis() > timestamp + lifetime) alive = false;
  }
  
  void draw() {
  
    pushMatrix();
    translate(position.x, position.y);
    image(G2Img, 0, 0);
    popMatrix();
    noStroke();
    float sizeVal = 50 + random(-20, 20);
    ellipse(position.x, position.y, sizeVal, sizeVal);
  }
  
  void run() {
    update();
    draw();
  }
  
}
