ArrayList<Circles> circle;

int maxRadius=100;

public void setup(){
  size(600,600);
  background(51,51,51);
  circle=new ArrayList<Circles>();
  stroke(255); 
  frameRate(10);
}


public void draw(){
 background(51,51,51);
  if(circle.size()<500){
    createCircle(); //<>//
  }

  for (Circles c:circle){
     updateCircle(c);    
  }  
}

public void updateCircle(Circles c){
   fill(c.getColor());
   ellipse(c.getPV().x,c.getPV().y,c.getRadius()*2,c.getRadius()*2);  
}

public void createCircle(){
  Circles tmp = new Circles();
  int nX=floor(random(width));
  int nY=floor(random(height));
  tmp.setPV(nX,nY);
  boolean testBounds=checkCircle(tmp);
  while(testBounds && tmp.getRadius()<=maxRadius){
    tmp.incRadius(); //<>//
    updateCircle(tmp);
    testBounds=checkCircle(tmp);
  }
  if(tmp.getRadius()>0){
    circle.add(tmp);
  }
}

public boolean checkCircle(Circles tmp){
  boolean create=true;
  Circles chk = new Circles(); 
  if(circle.size()>0){    
    for(int i=0;i<circle.size();i++){
        chk=circle.get(i);
        PVector dist = PVector.sub(chk.getPV(),tmp.getPV());
        if(dist.mag()<=chk.getRadius()+tmp.getRadius()+1){
          create=false;
          break;
        }    
    }
  }
 return create; 
}
