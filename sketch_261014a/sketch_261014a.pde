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
  
  background(0); // clears previous frame so moving/twinkling stars don't leave trails
  drawAnimatedStars(); // updates and draws the slower twinkling stars every frame, for now the function does not exist, but i will create it now
}
void buildConstellations() { // this will create my random stars as a background, which will glow aswell for a nice spacey effecet
   for (int i=0; i < numStars; i++) { // will hopefully make the 1000 random stars pop up on screen as a background
      starX[i] = random(width); // choses a random point with a value of 0 till the width set
      starY[i] = random(height);  // choses a random point with a value of 0 till the height set
      starSpeedX[i] = random(-0.01, 0.01); // makes the stars move left and right super super slowly
      starSpeedY[i] = random(-0.01, 0.01); // makes the stars move up and down super super slowly
      starPhase[i] = random(TWO_PI); // this will randomly choose a twinkle cycle for the star
      starSize[i] = random(1, 1); // this will make the stars look distant

    
  
 }
    
}

void drawAnimatedStars() {
  noStroke(); // keeps stars clean without outlines

  for (int i = 0; i < numStars; i++) {
    // this will move star very slowly and wrap around to the other side incase the stars fly off the screen never to be seen again
    starX[i] += starSpeedX[i]; // the speed of the star moving left and right
    starY[i] += starSpeedY[i]; // the speed of the star moving up and down
    if (starX[i] < 0) starX[i] = width;
    if (starX[i] > width) starX[i] = 0;
    if (starY[i] < 0) starY[i] = height;
    if (starY[i] > height) starY[i] = 0;

    // this will create a slow gentle twinkle with no outer glowing
    float twinkle = 0.5 + 0.5 * sin(frameCount * 0.015 + starPhase[i]); // slower sine wave between 0 and 1
    float currentSize = starSize[i] * (0.85 + 0.25 * twinkle);
    float coreAlpha = map(twinkle, 0, 1, 90, 255); // smooth brightness change

    fill(255, coreAlpha); // single star core without any outer glow
    ellipse(starX[i], starY[i], currentSize, currentSize);
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
