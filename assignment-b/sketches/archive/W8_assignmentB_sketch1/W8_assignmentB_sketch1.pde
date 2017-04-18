import codeanticode.syphon.SyphonServer;

SyphonServer syphon;

ArrayList<Integer> list;


void settings() {
  size(960, 540, P3D);
  PJOGL.profile=1;
}


void setup () {
  
  {
  syphon = new SyphonServer( this , "p5-to-syphon" );
  }
  
size(960,540,P3D);
smooth(3);
pixelDensity(displayDensity());
list = new ArrayList();
sphereDetail(mouseX/4);

//loop many integers
for (int i=0; i<1000; i++) {
list.add( int (random(0,1000) ) );
}

println(list);
}

void draw () {

  fill(0.5);
  background(0);
  background(frameCount%random(255));
  strokeWeight(2);
  line(pmouseX, pmouseY, mouseX, mouseY);
  syphon.sendScreen( );
  lights();

// looping the Arraylist

for (int i=0; i<list.size(); i++) { //list.length = list.size()
  
  pushMatrix();
  translate(list.get(i),i);
  rotate((frameCount + i)*0.02);
  fill(frameCount*0.1);
  stroke(frameCount%255);
  ambient(frameCount%255);
  shearX(PI/4.0);
  sphere(900);
 popMatrix();
  
  pushMatrix();
  stroke(255);
  translate(list.get(i),i);
  fill(frameCount*0.1);
  rotate((frameCount + i)*0.02);
  rotate(frameCount*0.5);
  rotateX(mouseY*0.1);
  rotateY(mouseX *0.1);
  sphere(900);
  popMatrix();

  }
  println(frameCount);
  //saveFrame("frames/######.tga");
}