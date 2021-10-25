class Ghost {
  
  boolean isLeft;
  PVector position, target;

  float movementSpeed = 0.01;
  float xMargin = 200;
  float yMargin = 150;
  boolean alive = true;
  PVector enemySize = new PVector(100, 40);

  Ghost() {
    float pickSide = random(1);
    float y = random(yMargin, height-yMargin*2);
    float x1, x2;
    if (pickSide < 0.5) {
      isLeft = true;
      x1 = -xMargin;
      x2 = width + xMargin;
    } else {
      isLeft = false;
      x1 = width + xMargin;
      x2 = -xMargin;
    }
    position = new PVector(x1, y);  
    target = new PVector(x2, y);  
  }
  
  void update() {
    if (position.dist(target) < 5) alive = false;
    
    for (Bullet bullet : cannon.bullets) {
      if (alive && hitDetectRect(position, bullet.position, enemySize)) {
        alive = false;
        explosions.add(new Hunt(position.x, position.y));
      }
    }
    
    if (alive) position.lerp(target, movementSpeed);
  }
  
  void draw() {
    rectMode(CENTER);
    rect(position.x, position.y, enemySize.x, enemySize.y);
    
    if (debug) {
      fill(250,249,120);
      noStroke();
      ellipse(220, 160, 110, 110);
      
      stroke(debugColor);
      noFill();

    }
  }
  
  void run() {
    update();
    draw();
  }
    
}
