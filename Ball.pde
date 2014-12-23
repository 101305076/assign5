class Ball{
  float x ;
  float y ;
  float xSpeed;
  float ySpeed;
  float size;
  
  void move(){
    x+=xSpeed;
    y-=ySpeed;
    
    if (x<0 || x>width){
      xSpeed *= -1;
    }
    if (y<0 ){
      ySpeed *= -1;
    }
    if( x<=mouseX+40 && x>=mouseX-40 && (y-size/2)>=height-30){
      ySpeed *= -1;
    }
    if(y>height){
      y = 800;
    }
  }
  void display(){
    fill(255);
    ellipse(x,y,size,size);
  }
  
  Ball(int myBallX,int myBallY){
    x = myBallX;
    y = myBallY;
    xSpeed = random(-6,6);
    ySpeed = random(0,4);
   
    size = 20;
  }












}
