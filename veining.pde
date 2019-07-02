ArrayList<brush> tree = new ArrayList();
ArrayList<brush> newBranch = new ArrayList();
color init;
color fin;

ArrayList<brush> deleteList = new ArrayList();
void setup() {
  fullScreen();
  newtree();
  noStroke();
}

void draw() {
deleteList.clear();
  for (brush b : tree) {

    b.drawStroke(init, fin); 
    if (b.time < 1) {
      
        float xVel = random(-1.3, 1.3);
        newBranch.add(new brush(int(b.x), int(b.y), new PVector(xVel, -1).normalize().mult(3), b.size>2?b.size-1:1));
        b.size = b.size>2?b.size-1:1;
        b.time = int(random(60, 120))+tree.size();
        b.velocity = new PVector (-xVel, -1).normalize().mult(2);

    }
  }


  for (brush b : tree) {
    for (brush c : tree)  {
      if (!b.equals(c) && dist(b.x, b.y, c.x, c.y)<5 && !deleteList.contains(c) && b.time < 20) {
        //deleteList.add(c);
        //deleteList.add(b);
        //b.size += 1;
      }
    }
    if (b.y < 0 || b.x<0 ||b.x>width) {
      deleteList.add(b);
    }
  }
  if (tree.size() ==  0) {
  delay(1000);
      background(0);
      newtree();  
       
  }

  for (brush b : deleteList) {
    tree.remove(b);
  }

  for (brush b : newBranch) {
    tree.add(b);
  }

  newBranch.clear();
}

void mouseDragged() {
  newtree();
}

void newtree() {
  background(0);
  tree.clear();
  tree.add(new brush(width/2, height, new PVector(0, -1), 8));
  init = color(random(0, 255), random(0, 255), random(0, 255));
  fin = color(random(0, 255), random(0, 255), random(0, 255));

}
