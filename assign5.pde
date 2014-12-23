Ball myBall;
Bar theBar;
Brick [] bricks;

//Game Status
final int GAME_PRPRTON =-1;
final int GAME_START   = 0;
final int GAME_RUN = 1;
final int GAME_WIN = 2;
final int GAME_LOSE = 3;

int status;              //Game Status
int life ;




void setup(){
  
  size(640,480);
  background(255);
  status = GAME_PRPRTON;
  life = 3;
  
  theBar = new Bar(80);
  bricks = new Brick[50];
  
  brickMaker(50);  
  
  
}

void draw(){
  background(0);
  noStroke();
   
  switch(status){
    
    case GAME_PRPRTON:
    background(255);
    textSize(40);
    fill(200,50,50);
    text("Press ENTER to Start" ,50,height/2);
    
    
    break;
    
    case GAME_START:
     
     theBar.move();
     theBar.display();
     for(int i=0;i<bricks.length;i++){
        fill(int (i*49/255),255,int(i*49%255));
        bricks[i].display();
     }     
     myBall = new Ball(mouseX,height-30);
     myBall.display();   
     drawLife();
     break;
    
    case GAME_RUN:
     theBar.move();
     theBar.display();
     for(int i=0;i<bricks.length;i++){
        fill(int (i*49/255),255,int(i*49%255));
        bricks[i].display();
     }      
     myBall.move();
     myBall.display();
     drawLife();       
     checkBrickHit();
     checkBallMissed();
     checkWinLose();
     break;
     
     case GAME_WIN:
     fill(0);
     textSize(100);
     text("WINNER",width/2,height/2);
     
     break;
     
     case GAME_LOSE:
     fill(0,0,255);
     textSize(60);
     text("GAME_LOSE",150,height/2);
     break;
     
     }
}
 
 void brickMaker(int num){
   for(int i=0;i<num;i++){
     
     int colNum = 10; 
     int bx = (width-40*10-10*9)/2+(50*int(i % colNum));
     int by = 30+(30*int(i /colNum));
     bricks[i] = new Brick(bx,by);
   }
  }
void checkBrickHit(){
  for (int i=0; i<bricks.length-1; i++) {
    Brick brick = bricks[i];
    if (brick!= null && !brick.gone // Check Array isn't empty and brick still exist
      && bricks[i].brx+brick.len/2 >= myBall.x  && bricks[i].bry-brick.len/2<= myBall.y+myBall.size/2
      && bricks[i].bry+brick.len/2>= myBall.y && bricks[i].brx-brick.len/2<=myBall.x ) {
      
      
      removeBrick(brick);
    }
  }
   
}
void removeBrick(Brick obj){
  obj.gone = true;
  obj.brx = 2000;
  obj.bry = 2000;
}
void drawLife() {

  fill(230, 74, 96);
  textSize(20);
  text("LIFE:", 36, 450);
    for(int i=0;i<life;i++){
    int xspace = 25*i;
    ellipse(100+xspace,459,15,15);
  }
}
void checkBallMissed(){
   
   if(myBall.y>height){
       life --;
       status = GAME_START;
    }
}
void checkWinLose(){
  int tmp=0;
  for(int i=0;i<50;i++){
    if(bricks[i].gone){
      tmp++;
    }
  }
  
   if( life == 0 ){
     status = GAME_LOSE;
     }
   else if(tmp==50) {
         status = GAME_WIN;
     }
   
} 

void reset() {
  for (int i=0; i<bricks.length;i++) {
    bricks[i].gone = false;
  }
  brickMaker(50);  
}
void keyPressed(){
  if(key == ENTER && status == GAME_LOSE || status == GAME_WIN){
    status = GAME_PRPRTON;    
  } 
  life = 3;
  reset();
  if(key == ENTER && status ==  GAME_PRPRTON){
    status = GAME_START;    
  } 
}
void mousePressed(){
  if(mouseButton == RIGHT){
      status = GAME_RUN;
    }
}

