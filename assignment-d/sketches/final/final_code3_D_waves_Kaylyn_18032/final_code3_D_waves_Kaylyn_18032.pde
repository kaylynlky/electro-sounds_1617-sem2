import ddf.minim.*;
import ddf.minim.analysis.*;
import codeanticode.syphon.SyphonServer;
import controlP5.*;

SyphonServer syphon;
ControlP5 cp5;
PGraphics buffer;

float noiseVal=100;
float noiseStrength = 100, noiseScale = 300;
float overlayAlpha = 70;
float z = 0;
float x,y;
PShader shader;
float speed;

ArrayList<Agent> agents;

void settings() {
  size(1080, 720,P2D);
  PJOGL.profile=1;
  smooth(8);
}


void setup() {
  
  //Syphon + Minim
  syphon = new SyphonServer( this , "p5-to-syphon" );
  
  shader = loadShader("shader.glsl");
  shader.set("resolution", float(width), float(height)); //set the resolution variable

  buffer = createGraphics(1280, 720, P2D);
  cp5 = new ControlP5(this);
  cp5.addSlider("noiseStrength").setRange(1, 100).setPosition(20, 20).setSize(200, 20);
  cp5.addSlider("noiseScale").setRange(1, 500).setPosition(20, 50).setSize(200, 20);
  cp5.addSlider("overlayAlpha").setRange(1, 128).setPosition(20, 80).setSize(200, 20);
  cp5.addBang("randomize").setPosition(300, 20).setSize(50, 50);
  cp5.addSlider("speed").setSize(200,20).setPosition(20,110).setRange(1,400).setValue(0.01);
  
  agents = new ArrayList();

  for (int i=0; i<20000; i++) {
    agents.add(new Agent());
  }
}


void draw() {
  
  buffer.beginDraw();
  buffer.background(0);
  buffer.noFill();
  buffer.rect(0, 0, width, height); 
  buffer.strokeWeight(1);
  buffer.noiseVal=noise((mouseX+x+width/2)*noiseScale, (mouseY+y)*noiseScale);
  buffer.stroke(overlayAlpha*255);
  
  shader.set("mouse", float(mouseX), float(mouseY));
  shader.set("time", frameCount*speed);
  shader(shader);


  for (float y = 0; y < height; y = y + 20) {
    for (float x = 0; x < width; x = x + 1) {
            point(x, y + map(noise(x/150, y/150, z), 0, 1, -100, 100));
        }
    }
     z = ((z + 0.1)*noiseStrength);
  
    resetShader();
  
  for (Agent agent : agents) {
    agent.update();
  }
  buffer.endDraw();
  image(buffer, 0 , 0);
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
    col = color(map(current.x, 0, 0, 0, 255), map(current.y, 0, 0, 0, 255));
    velocity = new PVector();
  }

  void update() {
    float angle = noise(current.x/noiseScale, current.y/noiseScale) * noiseStrength;
    current.x += cos(angle) * speed;
    current.y += sin(angle) * speed;

    n1 = new PVector(noise(current.x), noise(current.y), noise(current.z));
    stroke(255);
    line(previous.x, previous.y, current.x, current.y);
    previous.set(current);
    
    velocity.x = 0.1*cos(TWO_PI*noise(0.01*current.x,current.y,0.01*current.z));
    velocity.y = 0.1*sin(TWO_PI*noise(0.01*current.x,current.y,0.01*current.z));
    previous.add(velocity);
    
        if (current.x<0 || current.x>width || current.y<0 || current.y>height) {
      randomize();
    }
    
  }

  void randomize() {
    current.x = random(width);
    current.y = random(height);
    previous.set(current);
  }
}