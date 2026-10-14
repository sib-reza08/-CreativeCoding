PImage bg; //sets the bg variable type to image so it can load image and store it in there

String[] mood_choice = {"good", "neutral", "bad"}; //array that stores the diferent moods.







void setup() {
  size(1440, 900);
  bg = loadImage("pictures/dLDSIMv.jpg"); 
}

void draw() {
  image(bg,0, 0); //ensures if image is too big or small no error will pull up
}
