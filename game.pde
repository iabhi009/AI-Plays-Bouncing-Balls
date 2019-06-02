boolean start=false;
static int max=1;
float min_speed=5;
float max_speed=9;
float batSpeedChangeRate= 2.5;
float move=max_speed*batSpeedChangeRate;
Box[] b=new Box[max];
//dots = new Dot[size];
void setup()
{
  
    frameRate(50);
    size(800,500);
    //frameRate(1000);
//     b=new Box[10];
  int i;
  for(i=0;i<max;i++)
  {
   b[i]=new Box(); 
  }
}       
void draw()
{
    background(255);
    int i;
    if(keyPressed)
    {
      start=true; 
    }
    else if(start == false)
    {
            textSize(32);
      String t= "AI Plays Dont Let the Freaking Ball touch the Ground\n Press any button to start";
      fill(250, 23, 23);
      text(t, 100, 100);

    }
    if(start)
    {
    for(i=0;i<max;i++)
    {
      
    textSize(32);
    String txt= "Score = " + b[i].score;
      fill(255, 0, 255);
      text(txt, width-300, 200); 
      b[i].update();
      b[i].callBrain(); // Comment this line to play by yourself
    }
    }
}    
    
