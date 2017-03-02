Bird bird;

ArrayList<Pipe> pipes;

int points = 0;
int pAdd = 21;
int pMinus = 11;
int speed = -5;

int textSize;
boolean isLooping = true;

Background bg;
Button but;

void setup() {
  fullScreen(P2D);
  //size(400,600);
  orientation(PORTRAIT); 
  noStroke();
  fill(0);
  
  bg = new Background();
  
  //println(width);
  
  bird = new Bird();
  
  pipes = new ArrayList<Pipe>();
  pipes.add(new Pipe());
  
  textSize = floor(min(width,height) / 20);
  textSize(textSize);
  
  but = new Button("Pause");
}

void draw(){
  //background(0);
  bg.show();
  
  if (isLooping){
    bg.update();
    updatePipes();
    bird.update();
  }
  
  showPipes();
  bird.show();
  
  
  fill(0);
  text(points, textSize, textSize * 2);
  
  but.show();
  
  text(frameRate, textSize, height - 5);
}

void updatePipes(){
  for(int i = pipes.size() - 1; i>=0; i--){
    pipes.get(i).update();
    
    if (pipes.get(i).hits(bird)){
        points -= pMinus;
    }
    
    if (pipes.get(i).offscreen()) {
      if (! pipes.get(i).hightlight) {
        points += pAdd;
      }
      pipes.remove(i);
    }
  }
  if (frameCount % 100 == 0) {
    pipes.add(new Pipe());
  }
}

void showPipes(){
  for(int i = pipes.size() - 1; i>=0; i--){
    pipes.get(i).show();
  }
}

void mousePressed() {
  
  if (but.isOver()){
    if(isLooping) {
      //noLoop();
      isLooping = false;
    } else {
      //loop();
      isLooping = true;
    }  
  } else {
    bird.up();
  }
}