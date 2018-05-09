public  class Circles{
  private int radius;
  private PVector pv;
  private int x;
  private int y;
  private int z;
  public Circles(){
    radius=0; 
    pv= new PVector();
  }
  
  public Circles(int r){
    radius=r;
     pv= new PVector();
  }
  
  public void incRadius(){
    radius++;
  }
  
  public int getRadius(){
   return radius/2; 
  }
  
  public PVector getPV(){
   return pv; 
  }
  
  public void setPV(int x, int y){
   pv.x=x;
   pv.y=y;
   this.x=floor(map(x,0,width,0,255));
   this.y=floor(map(y,0,height,0,255));
   this.z=floor(map(sqrt(pow(x,2)+pow(y,2)),0,sqrt(pow(width,2)+pow(height,2)),0,255));
  }
  
  public color getColor(){
    return color(x,y,z);
  }
}
