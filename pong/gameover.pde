void gameover() {

  clapping.play();
  if (leftscore > rightscore) {
  textAlign(CENTER, CENTER);
  stroke(255);
  fill(#FF9E00);
  textFont(player2);
  textSize(150);
  text("LEFT WINS", width/2, height/2);
  } else {
  textSize(150);
  fill(#E000FF);
  text("RIGHT WINS", width/2, height/2);
  }
  
}

void gameoverClicks() {

  reset();
  mode = INTRO;
  
}
