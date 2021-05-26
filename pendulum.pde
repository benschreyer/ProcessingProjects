

PVector position;

PVector g;

PVector velocity;

float ropeLength;

float dt;

float mass;

PVector ropePosition;

float deltaFunction(float x,float a, float r)
{
  return 1/ (1.0 + exp((a - x)/r));
}

PVector ropeForce(PVector r, PVector x, float rL, PVector exF)
{
   PVector xToR = new PVector(0.0,0.0);
   
   xToR.add(r);
   xToR.sub(x);
   
   PVector xToRNorm = xToR.copy();
   
   xToRNorm.setMag(1.0);
   
   float dot = -1.0 * xToRNorm.dot(exF);
   

   return xToRNorm.mult(dot * deltaFunction(xToR.mag(),rL,1.0));


}
  

void setup() {
  frameRate(1200);
  size(1000,1000);
  background(0);
  fill(204);
  
  position = new PVector(640.0,760.0);
  
  g = new PVector(0.0,-500.0);
  
  velocity = new PVector(0.0,0.0);
  
  mass = 100.0;
  
  ropeLength = 205.0;
  
  dt = 1.0/1000.0;
  
  
  ropePosition = new PVector(500.0,900.0);


}




void draw() {
  background(204);

  ellipse(position.x, 1000 - position.y, 72, 72);
  ellipse(ropePosition.x, 1000 - ropePosition.y, 22, 22);
  
  PVector dv = new PVector();
  
  dv.add(g);
  dv.mult(dt);
  
  PVector gF = g.copy().mult(mass);
  
  PVector aR = ropeForce(ropePosition, position, ropeLength, gF);
  
  aR.div(mass);
  
  dv.add(aR);
  

  
  print(str(dv.x) + " " +str(dv.y) + " dv \n");
  
  velocity.add(dv);
  
  PVector dp = new PVector();
  
  dp.add(velocity);
  dp.mult(dt);
  
  position.add(dp);
  
  
  
  print(str(velocity.x) + "  " + str(velocity.y) + "  "  + str(position.x)+ "  "  + str(position.y) + "\n");
  
  

}
