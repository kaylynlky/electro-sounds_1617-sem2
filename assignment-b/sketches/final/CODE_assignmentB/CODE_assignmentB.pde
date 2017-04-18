//Lee Kai Yin Kaylyn (18032)
// Assignment B - Principal Study 2B AY16-17

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import codeanticode.syphon.SyphonServer;

SyphonServer syphon;

//import sojamo.animatedgif.*;

//GifRecorder gif;

ArrayList<Integer> list;


void settings() {
  
   //{
    //gif = new GifRecorder(this);
//gif.setMillisBetweenFrames(100);
//gif.setDuration(5000);
//gif.setLoop(true);
  //}
  
  size(960, 540, P3D);
  PJOGL.profile=1;
  smooth(4);
}


void setup () {
  {
  syphon = new SyphonServer( this , "p5-to-syphon" );
  }
size(1080,720,P3D);

sphereDetail(mouseX/4);
list = new ArrayList();

//loop many integers
for (int i=0; i<1000; i++) {
list.add( int (random(0,1000) ) );
}

println(list);
}

void draw () {

  fill(0.5);
  background(0);
  background(frameCount%200);
  strokeWeight(2);
  line(pmouseX, pmouseY, mouseX, mouseY);
    syphon.sendScreen( );
  lights();

// looping the Arraylist

for (int i=0; i<list.size(); i++) { //list.length = list.size()
  
  pushMatrix();
  translate(list.get(i),i);
  rotate((frameCount + i)*0.05);
  fill(frameCount*0.1);
  stroke(frameCount%255);
  smooth();
  ambient(0);
  shininess(2.0);
  sphere(200);
  popMatrix();
  
  pushMatrix();
  stroke(frameCount%random(0,255));
  translate(list.get(i),i);
  rotate((frameCount + i)*0.05);
  fill(frameCount*0.1);
  rotateX(mouseY*0.1);
  rotateY(mouseX *0.1);
  sphere(1000);
  popMatrix();
  }
  println(frameCount);
  //saveFrame("images-######.tga");
}
