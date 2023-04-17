ArrayList<Roof> roofs = new ArrayList<Roof>();
int count;

void setup() {
  size(640, 640);
  pixelDensity(2);
  count = int(random(0, 20));
}

void draw() {
  background(0);
  frameRate(30);
  stroke(255);
  
  boolean del = false;
  for(Roof r: roofs) {
    r.render();
    if(r.x < -width) {
      del = true;
    }
    println(roofs.size());
  }
  if(del) {
    roofs.remove(0);
  }
  if(frameCount % count == 0) {
    roofs.add(new Roof(int(random(height))));
    roofs.get(roofs.size() - 1).addCol();
    count = int(random(30, 90));
  }
  saveFrame("frames/######.png");
}
  
