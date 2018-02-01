

class Tree {
  
  float x, y, size; 
  color c;
  
  //constr
  Tree ( float x1, float y1, 
    color c1, 
    float size1) {
      
    x=x1;
    y=y1;
    c=c1;
    size=size1;
  }//constr

  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, size, size);
  }
}
//