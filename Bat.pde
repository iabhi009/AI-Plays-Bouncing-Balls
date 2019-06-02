class Bat
{
 int h;
 int len;
 float x;
 float oldx;
 Bat()
 {
   h=10;
   len=100;
   x=random(width-100);
 }
 void updateBat()
 {
   //print("wow");
   fill(255,255,0);
   rect(x,height-h,len,h);
 }
}
