// the data i will be collecing is what I feel about the weather during 3 different points in a day, so during 1 day i collect 3 differnt data points.


PImage bg; //sets the bg variable type to image so it can load image and store it in there
Movie myVideo;

import processing.video.*; // this imports the video libary, with the "*" importing everything in that libary so that  can add a video as a bg instead of a static image.


String[] mood_choice = {"good", "neutral", "bad"}; //array that stores the diferent moods.







void setup() {
  size(1440, 900);
  myVideo = new Movie(this, "pictures/weather_video.mp4");

  myVideo.loop();
}

void draw() {
  image(myVideo, 0, 0, width, height); // ensures if video is too big or small no error will pull up and centers it, and makes it width and height same as the canvas size
}


void movieEvent(Movie m) { // this function reads new frames from the video automatically
  m.read();
}
