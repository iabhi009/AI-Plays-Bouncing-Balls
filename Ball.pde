class Box
{      
      Bat ba;
      float x,y,r,z,ax,ay,cr,cg,cb;
      boolean notDead;
      int count;
      int score;
      Box()
      {
        x=random(250);
        y=random(250);
        r=25;
        z=25;
        ax=random(min_speed,max_speed);
        ay=random(min_speed,max_speed);
       count=0; 
       ba=new Bat();
       cr=random(255);
       cb=random(255);
       cg=random(255);
       notDead=true;  
       score=0;  
  }
     void update()
     {
       if(notDead)
       {
       //print("it Works");
        count++;
        if(count>100)
        {
            count=0;
            if(ax>0)
            ax+=.1;
            else
            ax-=.1;
            if(ay>0)
            {
            ay+=.1;
            move=(ay*batSpeedChangeRate);
            }
            else
            {
            ay-=.1;
            move=(ay*batSpeedChangeRate*-1);  
          }
        }
        x=x+ax;
        if(y+ay>490 && y+ay>500)
        {
        y=492; 
        if((x+(r/2))>= ba.x-(r/2) && (x+(r/2))<= ba.x+ba.len+(r/2))
       {
         //notDead=false;
       }
       else
       {
         notDead=false;
       }
        }
        else
        {
          y=y+ay;
        }
        fill(cr,cb,cg);
        ellipse(x,y,r,z);
      if((y) >= height)
      {
        notDead=false;
        print(score);
    }
        if(x<=0 && y <= 0)
        {
          
          if(ay<0)ax*=-1;
          if(ay<0)ay*=-1;
        }
        else if(x>=width && y<=0)
        {
          ax*=-1;
          if(ay<0)ay*=-1;
        }
        else if(x>width || y>height)
        {
          ax*=-1;
          //ay*=-1;
        }
        else if(x<1 && y>0)
        {
           ax*=-1;
          //ay*=-1;
        }
        else if(x<1 || y<0)
        {
          //ax*=-1;
        ay*=-1;
        }
        
        /* Bat Thinggy */
        ba.updateBat();
        if(y>height-ba.h)
        {
       if((x+(r/2))>= ba.x-(r/2) && (x+(r/2))<= ba.x+ba.len+(r/2))
       {
          score++;
          //ax*=-1;
          ay*=-1;
          if(ba.oldx > ba.x)
          {
           x-=random(10);
            y-=random(10);
          }
          else if(ba.oldx < ba.x)
           {
             x-=random(10);
            y-=random(10);
           }
       }
       }
       /* --------------------------- */
     }
     if(keyPressed)
     {
       
      if (key == CODED) {
    if (keyCode == LEFT)
    {
      //print("wow"); 
      moveLeft();
    }
    else if (keyCode == RIGHT) 
    {
      moveRight();
    } 
    }     
     }
   }
   void moveLeft()
   {
     if(ba.x<move)
        {
          ba.oldx=ba.x;
          ba.x=0;
        }
        else
        {
           ba.oldx=ba.x;
           ba.x-=move;
        }
   }
   void moveRight()
   {
     //String t= "ax = "+ax+", ay="+ay+"\n x= "+x+",y="+y;
     
     if(ba.x+ba.len+move>width)
        {
          ba.oldx=ba.x;
          ba.x=width-ba.len;
        }
        else
        {
           ba.oldx=ba.x;
           ba.x+=move;
        }
   }
   void callBrain()
   {
      float predx=0,predy;
      float futurePos=sqrt(pow(ba.x-ax,2)+pow((height-ba.h)-ay,2));  
      futurePos=futurePos%ay;
      if(futurePos<0)
      futurePos*=-1;
      if(ax >0 && ay>0)
      {
        predx=x;
        predy=y;
        do
        {
          predx+=ax;
          predy+=ay;
        }while(predy<490);
          if(predx < ba.x+(ba.len/2))
          {
            
            moveLeft();
          }
          else if(predx > ba.x+(ba.len/2))
          {
            moveRight();
            
          }
      }
      /*if(ax >0 && ay>0 &&  (ba.x+25) > x+futurePos)
      {
        
        System.out.print("Wow Wow");
        moveLeft();
      }*/ 
      if(ax<0 && ay>0)
      {
        predx=x;
        predy=y;
        do
        {
          predx+=ax;
          predy+=ay;
        }while(predy<490);
          if(predx < ba.x+(ba.len/2))
          {
            
            moveLeft();
          }
          else if(predx > ba.x+(ba.len/2))
          {
            moveRight();
            
          }
      }
      
      textSize(32);
      String t= "ax = "+ax+", ay="+ay+"\n x= "+x+",y="+y+"\nF. Pos= "+predx+"\n batx = "+ba.x+", Bat Speed= "+move;
      
      futurePos=0;
      fill(255, 0, 255);
      text(t, 100, 100);
 }   
}
