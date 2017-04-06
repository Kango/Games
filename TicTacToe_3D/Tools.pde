

// Minor Tools

void setCameraBeginning() {

  cam.setMinimumDistance(-150);
  cam.setMaximumDistance(5550); 
  // move
  cam.pan(600,900); // y = 100 Kamera zu hoch; y=800Kamera zu tief
  // rotate
  cam.rotateX(radians(25)); 
  cam.setDistance(830);
  cam.setResetOnDoubleClick (false); 
  // MyState = new cam.CameraState(); 
  // cam.setState(MyState);
}