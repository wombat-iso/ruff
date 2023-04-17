class Roof {
  int fl;
  int x;
  int endx;
  boolean growing;
  ArrayList<Col> cols;
  
  Roof(int y) {
    fl = y;
    x = 0;
    endx = width - int(random(width/2));
    growing = true;
    cols = new ArrayList<Col>();
  }
  
  void addCol() {
    cols.add(new Col(int(random(endx/4)), 0));
  }
  
  void render() {
    //stroke(255, 120);
    //strokeWeight(3);
    //line(0, fl, x, fl);
    
    if(growing) {
      x += 20;
    }
    if(x > endx) {
      growing = false;
      x = endx;
    }
    noStroke();
    fill(255, 120);
    rect(0, fl, x, 3);
    endx--;
    
    for(Col c: cols) {
      noStroke();
      fill(255, 120);
      int w = int(5+(height-fl)/40);
      if(c.y > height - fl) {
        c.y = height - fl;
      }
      rect(endx - c.x - w, height, w, -c.y);
      c.y+=10;
    }
    
    // Shade
    noStroke();
    fill(200, 50);
    beginShape();
    vertex(0, fl);
    vertex(x, fl);
    vertex(x + height - fl, height);
    vertex(0, height);
    endShape(CLOSE);
  }
}
