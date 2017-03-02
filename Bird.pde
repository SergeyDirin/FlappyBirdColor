class Bird{
  int y = height / 2;
  int x = 64;
  
  float gravity = 0.6;
  float velocity = 0;
  float lift = -15;
  
PImage bgImage;

  Bird(){
    bgImage = loadImage("bird.png");
  }
  
  void show(){
    //fill(255);
    //ellipse(x,y,32,32);
    image(bgImage,x,y,75,48);
  }

  void update(){
    velocity += gravity;
    velocity *= 0.9;
    y        += velocity;
    
    if (y > height) {
      y = height;
      velocity = 0;
    }
    if (y < 0) {
      y = 0;
      velocity = 0;
    }
  }
  
  void up(){
    velocity += lift;
  }

}