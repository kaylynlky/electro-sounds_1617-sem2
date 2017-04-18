import ddf.minim.*;
import ddf.minim.analysis.*;
import codeanticode.syphon.*;

Minim minim;
AudioInput in;
BeatDetect beat;
SyphonServer server;

int click = 0;

float x,y;
float speed;
float amp;
float angle;
float num = 0;
//boolean to determine the value of click is true or false
boolean doOnce = true; 


void settings() {
  size(1080, 720, P3D);
  PJOGL.profile=1;
}


void setup(){
  
  server = new SyphonServer(this, "Processing Syphon");
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 128);
  beat = new BeatDetect();
  
}

void draw(){
  beat.detect(in.mix);
    
  background(0);
  fill(255);
  stroke(frameCount%(255));
  smooth(8);
  speed = random(1,10);
  amp = random(100,100);
  noiseDetail(8);

   
  for(int i = 0; i < 1000; i++){
    angle = cos(radians(i*click+num))*220;
    x = width/2+sin(radians(i))*angle;
    y = height/2+cos(radians(i))*angle;
    
    line(x, y, width/2, height/2);
    strokeWeight(1);
  }
  num += 0.9;
  
  ambientLight(10, 10, 10);
  
  if (key== '1') {
   for(int i = 0; i < 1000; i++){
    float angle = cos(radians(i*click+num))*1000;
    x = width/2+sin(radians(i))*amp*speed;
    y = height/2+cos(radians(i))*amp*speed;
    
  line(x, y, width/2, height/2);
  ellipse(x, y, 5, 5);
  strokeWeight(1);
   }
    num += 0.1;
  }
  server.sendScreen();
}

void mousePressed(){
  if(doOnce){
    doOnce = false;
    click++;
  } 
}

void mouseReleased(){
  doOnce = true;
}