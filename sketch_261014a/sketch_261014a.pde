// the data i will be collecing is what my mood is during 3 different points in a day, so during 1 day i collect 3 differnt data points.





void setup() {
  size(1440, 900);
  surface.setLocation(200,50); // this will set my sketch window when i run my code to always open in the center of the screen (on my screen at home, idk about screens elsewhere...)
  background(0); //sets the background to black


}

void buildConstellations() { // this will create my random stars as a background, which will glow aswell for a nice spacey effecet
 // where i will run code at hopefully a good stable 60 frames a second
  stroke(255); // colour of stars for now
  strokeWeight(1); // makes dot thick and easier to see
  for (int i=0; i < 1000; i++) { //will hopefully make 1000 random stars pop up on screen as a background
  
  float x = random(width);
  float y = random(height);
  point(x,y); // sets random dots at the position the variables chose
  

  }
  
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    buildConstellations(); // Re-randomizes all star positions on demand for a cooler effect
  } else if (key == 's' || key == 'S') {
    saveFrame("random_mood_constellation.png");
  }
}
