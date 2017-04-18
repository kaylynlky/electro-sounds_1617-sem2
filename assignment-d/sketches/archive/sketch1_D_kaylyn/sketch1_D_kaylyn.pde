import ddf.minim.*;
import ddf.minim.analysis.*;
import codeanticode.syphon.SyphonServer;
import controlP5.*;

Minim minim;
AudioInput in;
BeatDetect beat;
SyphonServer syphon;
ControlP5 cp5;

float noiseStrength = 100, noiseScale = 300;
float overlayAlpha = 70;
float randomize;
float x, y;

ArrayList<Agent> agents;

void settings() {
  size(1080, 720,P3D);
  PJOGL.profile=1;
  smooth(8);
}

void setup() {
  
  //Syphon + Minim
  syphon = new SyphonServer( this , "p5-to-syphon" );
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 128);
  beat = new BeatDetect();
 
  cp5 = new ControlP5(this);
  cp5.addSlider("noiseStrength").setRange(1, 100).setPosition(20, 20).setSize(200, 20);
  cp5.addSlider("noiseScale").setRange(1, 500).setPosition(20, 50).setSize(200, 20);
  cp5.addSlider("overlayAlpha").setRange(1, 128).setPosition(20, 80).setSize(200, 20);
  //cp5.addBang("randomize").setPosition(300, 20).setSize(50, 50);
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {cp5.addBang("randomize").setPosition(300, 20).setSize(50, 50);}}, '0');
  cp5.setAutoDraw(false);

  
  agents = new ArrayList();

  for (int i=0; i<10000; i++) {
    agents.add(new Agent());
  }
  
}


void draw() {
  
  beat.detect(in.mix);

  background(0);
  fill(0, overlayAlpha);
  rect(0, 0, width, height);
  strokeWeight(1);
  if ( beat.isOnset() ) {
    strokeWeight(15);
  }
  for (Agent agent : agents) {
    agent.update();
  }
    syphon.sendScreen();
    
}

    
  void keyPressed() {
      if(key=='2'){
        cp5.setAutoDraw(!cp5.isAutoDraw());
      }
    }

void randomize() {
  for (Agent agent : agents) {
    agent.randomize();
  }
}

class Agent {
  PVector current, previous, n1, velocity;
  float speed;
  int col;

  Agent() {
    current = new PVector(random(width), random(height));
    previous = new PVector().set(current);
    speed = random(1, 4);
   col = color(255);
   // col = color(random(255),random(255),random(255));
  }

  void update() {
    stroke(col);
    float angle = noise(current.x/noiseScale, current.y/noiseScale) * noiseStrength;
    current.x += cos(angle) * speed;
    current.y += sin(angle) * speed;
    
        if (current.x<0 || current.x>width || current.y<0 || current.y>height) {
      randomize();
    }    

    
    line(previous.x, previous.y, current.x, current.y);
    previous.set(current);
  }

  void randomize() {
    current.x = random(width);
    current.y = random(height);
    previous.set(current);
  }
}