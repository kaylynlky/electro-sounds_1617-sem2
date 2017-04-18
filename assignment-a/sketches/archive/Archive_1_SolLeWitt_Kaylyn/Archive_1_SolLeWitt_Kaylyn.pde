void setup() {
size(960, 540);
background(255);
}

void draw() {
  for (int i = 0; i < 1000; i = i+40)  {
    fill(0);
    rect(80, 0+i, 800, 2);
  }
    
  for(int j = 0; j < 11; j = j+1) {
 fill(sin(1.57118+(j*3.14159))*(255));
 triangle(480-(j*25), 75+((j)*(25)*(1.57509)), 207, 505, 480-(j*25), 505);
  
  }
}