float theta; 
float theta2;

void setup() {
  size(640, 640);
}

void draw() {
  background(25);
  frameRate(30);
  stroke(225);
  theta = mouseY / (float) height * PI;
  theta2 = (mouseX / (float) width - .5) * PI;
  translate(width/2,height);
  // Draw a line 120 pixels
  line(0,-200,0,-320);
  // Move to the end of that line
  translate(0,-320);
  // Start the recursive branching!
  branch(120);

}

void branch(float h) {
  h *= .71;
  
  // All recursive functions must have an exit condition!!!!
  if (h > 1) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta2-theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(theta2+theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}