float astart = 0;  // variable 'astart' from the top/2 of the screen
float aend = 540;  // variable 'aend' form the top/2 of the screen
float b = 0;       //variable float 'b' from bottom/2 of the screen

void setup() {
  size(960, 540);
  stroke(255);
  background(255);
}

void draw() { 
  
  //looping
  
  line(astart, 0, astart , height/2);
  astart =astart + 1;
  
  line(b, height/2, b, height);
  b = b + 1;
  
  if(aend > width) {
    aend = aend + 100 ;
    astart = astart + 100;
  }
  if (random(600)>500) { // to randomize the bar colour
  stroke(0); 
  } else {
   stroke (255,random(200));
}
  if(b > width) { // return back to start for bottom of screen
    b = 0;
  }  
}