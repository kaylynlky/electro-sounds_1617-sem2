import sojamo.animatedgif.*;

GifRecorder gif;

ArrayList<Integer> list;


void setup () {
  {
    gif = new GifRecorder(this);
gif.setMillisBetweenFrames(100);
gif.setDuration(1000);
gif.setLoop(true);
 gif.setScale(0.5);
  }
size(960,540,P3D);

sphereDetail(mouseX/4);
list = new ArrayList();

//loop many integers
for (int i=0; i<1000; i++) {
list.add( int (random(0,1000) ) );
}

println(list);
}

void draw () {

  fill(0.4);
  background(0);
  background(frameCount%255);
  lights();

// looping the Arraylist

for (int i=0; i<list.size(); i++) { //list.length = list.size()
  
  pushMatrix();
  translate(list.get(i),i);
  rotate((frameCount + i)*0.05);
  fill(frameCount*0.5);
  stroke(#69F4F7);
  smooth();
  ambient(255);
  shininess(3.0);
  triangle(18,18,18,40,40,20);
  popMatrix();
  
  pushMatrix();
  stroke(255,237,252);
  translate(list.get(i),i);
  rotate((frameCount + i)*0.1);
  noFill();
  rotateX(mouseY*0.05);
  rotateY(mouseX *0.05);
  sphere(30);
  popMatrix();
  }
  println(frameCount);
  saveFrame("frames/######.tga");
  }
  
  void keyPressed() {
    switch(key) {
      case('r'):gif.record();break;
    }
  }