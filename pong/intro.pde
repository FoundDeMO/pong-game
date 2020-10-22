void intro() {

  background(0);

  fill(255);

  //ball
  stroke(255);
  circle(ballx, bally, balld);

  //moving
  ballx = ballx + vx;
  bally = bally + vy;

  //bouncing
  if (bally < balld/2 || bally > height-balld/2) {
    vy = vy * -1;
  }
  if (ballx < balld/2 || ballx > width-balld/2) {
    vx = vx * -1;
  }
  
  //song
  intro.play();

  //'PONG'
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(player2);
  textSize(175);
  text("PONG", width/2, height/4);

  //Buttons
  strokeWeight(6);
  stroke(100);
    tactileRect(450, 450, 500, 150);
  rect(width/3.1, height/2, 500, 150);
    tactileRect(510, 630, 400, 150);
  rect(width/2.8, height/1.4, 400, 135);

  //'multiplayer'
  textSize(40);
  fill(0);
  text("Multiplayer", width/2, height/1.7);
  //'singleplayer'
  textSize(30);
  text("Singleplayer", width/2, height/1.27);
}

void introClicks() {

  if (mouseX > 450 && mouseX < 970 && mouseY > 430 && mouseY < 580) {
    mode = GAME;
    AI = false;
    ballx = width/2;
    bally = height/2;
    intro.pause();
  }
  if (mouseX > 510 && mouseX < 920 && mouseY > 610 && mouseY < 760) {
    mode = GAME;
    AI = true;
    ballx = width/2;
    bally = height/2;
    intro.pause();
  }
}
