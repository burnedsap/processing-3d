PShape s;
import nervoussystem.obj.*;
import processing.dxf.*;

import peasy.PeasyCam;
boolean record;


PeasyCam cam;
public void settings() {
  size(800, 600, P3D);
}

public void setup() {
  cam = new PeasyCam(this, 400);
  s = loadShape("pot1.obj");
}

void draw() {
  if (record) {
    beginRaw(DXF, "output.dxf");
  }  
  translate(width/2, height/2);


  for (int i=0; i<50; i++) {
    rotate(i);
    //scale(1.1);
    noFill();
    stroke(255, 0, 0);
    pushMatrix();
    rotate(i);
    scale(i*0.01);
    shape(s, 0, 0);
    popMatrix();
  }

  // Do all your drawing here
  if (record) {
    endRaw();
    record = false;
  }
}

void keyPressed() {
  // Use a key press so that it doesn't make a million files
  if (key == 'r') {
    record = true;
  }
}
