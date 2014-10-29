class Pipes {
  int pipex;
  int pipey;
  boolean scoreCheck = false;



  Pipes() {  
    pipex = 600;
    pipey= int(random(80, 520));
  }  



  void show() {

    fill(0, 255, 0); 
    rect(pipex, 0, 50, pipey-70);
    rect(pipex, 600, 50, -1*(600-pipey)+70);
    if (collision == false) {
      if(speedup == true){
      pipex-=4; 
      }
      else if(slowdown == true){
      pipex-=1;  
      }
      
      else {
        pipex-=2;
      }
      
    }
  }  


  public boolean hasCollision(Bird b) {
    if ((pipex-225<=b.diam/2 || pipex-175<=b.diam/2) && pipex+50>=225-b.diam/2 && (b.y-b.diam/2<=600 && b.y+b.diam/2>=-1*(600-pipey)+670 || b.y+b.diam/2>=0 && b.y-b.diam/2 <= pipey-70)) {
      if (invince == false) {
        return true;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  }
}  

