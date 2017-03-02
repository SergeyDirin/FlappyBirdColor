class Pipe{

  int min = 150;
  int max = 400;
  int gap = floor(random(min, max));
  int gY = floor(random(height - max));

  int x = width;
  int w = 20;
  
  PImage bgImage;
  
  boolean hightlight = false;
  
  Pipe(){
    bgImage = loadImage("pipe.png");
  }
  
  void show(){
    fill(255);
    if (hightlight){
      fill(255,0,0);
    }
    image(bgImage, x, 0, w, gY);
    image(bgImage, x, gY + gap, w, height);
  }

  void update(){
    x += speed;
  
  }
  
  boolean offscreen(){
    if (x < -w) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean hits(Bird bird) {
    if (bird.y < gY || bird.y > gY + gap){
      if (bird.x > x && bird.x < x + w){
        hightlight = true;
        return true;
      }
    }
    return false;
  }
  
}