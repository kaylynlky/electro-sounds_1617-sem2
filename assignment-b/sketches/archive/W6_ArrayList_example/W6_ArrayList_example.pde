ArrayList<Integer> list;


void setup () {
size(960, 540);
list = new ArrayList(); // create an empty Array List store integer)

//loop many integers
for (int i=0; i<1000; i++) {
list.add( int (random(0,1000) ) );
}

println(list);
}

  void draw () {
    fill(0.4);
background(#B6F7EE);    // r g b

// looping the Arraylist

for (int i=0; i<list.size(); i++) { //list.length = list.size()
  pushMatrix();
  translate(list.get(i),i);
  rotate((frameCount + i)*0.2);
  fill(((frameCount+i)*2) % 240,227,244);
  noStroke();
  ellipse(0,0,20,200);
  popMatrix();
  }
  println(frameCount);
  }