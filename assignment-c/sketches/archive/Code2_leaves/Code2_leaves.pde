//Lee Kai Yin, Kaylyn (18032)
//Assignment C - Principal Study 2B AY16-17

// Leaves Changes when vertex / parameters changes


//DECLARE
ArrayList <Leaf> leaves;

void setup() {
  size(960,540); 
  smooth();

  //INITIALIZE
  leaves = new ArrayList<Leaf>();
  
}

void draw() {
  background(255);

//add function() to put particles into your ArrayList
//new object is added to the ArrayList every cycle through draw.
for (int i=0; i<2000; i++) {
  leaves.add(new Leaf());
}
  
 //dot size() function to keep track of how many objects are in ArrayList. 
   // for loop with variable "i" and the dot get() function to grab the objects in the ArrayList for display.
  for (int i = 0; i < leaves.size(); i++ ) { 
    Leaf l = (Leaf) leaves.get(i);
    l.run();
  }

// When our collection gets to _ , we remove the object in position one of the ArrayList.
  if (leaves.size() < 0) {
    leaves.remove(0); 
  }
}

class Leaf {
  
  float x;
  float y;
  
  Leaf() {
    x = frameRate%200*(random(960));
    y = frameRate%100*(random(960));
  }
  
  void run(){
    draw();
  }
  
  void draw() {

    noStroke();
    fill(0);
    pushMatrix();
    translate(x, y);    
    scale(frameRate*0.04);
    rotate(mouseX*0.01);
    rotate(mouseY*0.01);
    //shape of leaves
      beginShape();
          vertex(0, 0);
          bezierVertex(-25, 25, -5, 60, 50, 70);
          vertex(0, 0);
          bezierVertex(50, 15, 55, 45, 50, 70);
      endShape();
      stroke(227, 191, 144);
      line(0, 0, 50, 70);
    popMatrix();   

}
}
