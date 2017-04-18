//ArrayList and its functions(): size(), add(), get() and remove () 

//DECLARE
ArrayList<Particle> particles;

void setup() {
  size(960,540); 
  smooth();
  //INITIALIZE
  particles = new ArrayList<Particle>(); 
}

void draw() {
  background(255);

//Here a new particle object is added to the ArrayList every cycle through draw.
  particles.add(new Particle()); 
  
   // And, we use a for loop with variable "i" and the dot get() function to grab the particles in the ArrayList for display.
  for (int i = 0; i < particles.size(); i++ ) { 
    Particle p = (Particle) particles.get(i);
    p.run();
  }
}

// A simple Particle class
class Particle {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  
  Particle() {
    x = random(960);
    y = random(540);
    xspeed = random(1,0);
    yspeed = random(0,1);
  }
  
  void run(){
    display();
  }
  
  
  void display() {
    stroke(0);
    fill(random(0,255));
    rect(x,y,10,10);
  }
}