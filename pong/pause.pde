void pause() {

  textAlign(CENTER, CENTER);
  stroke(255);
  fill(255);
  textSize(300);
  textFont(player2);
  text("PAUSED", width/2, height/2);
  
}

void pauseClicks() {

  mode = GAME;
  
}
