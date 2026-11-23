// the data i will be collecing is what my mood is during 3 different points in a day, so during 1 day i collect 3 differnt data points.


int numStars = 1000; // instead of looping thousand times, instead i will set a specific amount and assign it to a variable so i can control the speed
float[] starX = new float[numStars]; // stores x position of each star so they can move/twinkle
float[] starY = new float[numStars]; // stores y position of each star
float[] starSpeedX = new float[numStars]; // very slow sideways drift for each star
float[] starSpeedY = new float[numStars]; // very slow up/down drift for each star
float[] starPhase = new float[numStars]; // offsets each star's twinkle timing so they don't all blink together
float[] starSize = new float[numStars]; // slight size variation across stars



void setup() {
  size(1440, 900);
  surface.setLocation(200,50); // this will set my sketch window when i run my code to always open in the center of the screen (on my screen at home, idk about screens elsewhere...)
  background(0); //sets the background to black
  
  buildConstellations(); // initial canvas set up

}
void draw() {
  // runs the code at 60 frames a second hopefully
}
  void buildConstellations() { // this will create my random stars as a background, which will glow aswell for a nice spacey effecet
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
      background(0); // so a bunch of dots dont show up when i press r, (found out the hard way)
      buildConstellations(); // Re-randomizes all star positions on demand for a cooler effect
    } else if (key == 's' || key == 'S') {
      saveFrame("random_mood_constellation.png");
    }
  }
