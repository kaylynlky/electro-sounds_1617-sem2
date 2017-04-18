import ddf.minim.*;
import ddf.minim.analysis.*;
import codeanticode.syphon.*;

Minim minim;
AudioInput in;
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
  size(1280, 720, P3D);
  PJOGL.profile=1;
}


void setup(){
  
  server = new SyphonServer(this, "Processing Syphon");
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 128);
  
}

void draw(){
    
  background(0);
  fill(255);
  stroke(frameCount%(255));
  smooth(8);
  speed = random(1,10);
  amp = random(100,100);
  noiseDetail(8);

   
  for(int i = 0; i < 1000; i++){
    angle = cos(radians(i*click+num))*360;
    x = width/2+sin(radians(i))*angle*speed;
    y = height/2+cos(radians(i))*angle*speed;
    
    line(x, y, width/2, height/2);
    strokeWeight(1);
  }
  num += 0.9;
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