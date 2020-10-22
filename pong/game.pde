void game() {
  background(0);
  strokeWeight(5);
  stroke(255);
  fill(255);
  rect(width/2-5, 0, 10, 2000);
  stroke(#FF9E00);
  rect(width/2-8, 0, 3, 2000);
  stroke(#E000FF);
  rect(width/2+5, 0, 3, 2000);

  //scoreboard
  textSize(40);
  fill(#FF9E00);
  text(leftscore, width/4, 100);
  fill(#E000FF);
  text(rightscore, 3*width/4, 100);
  fill(255);
  //text(timer, 3*width/4, 800);
  timer = timer - 1;

  //paddles
  fill(0);
  strokeWeight(7);
  stroke(#FF9E00);
  circle(leftx, lefty, leftd);
  stroke(#E000FF);
  circle(rightx, righty, rightd);

  //movepaddles
  if (wkey == true) lefty = lefty - 6;
  if (skey == true) lefty = lefty + 6;
  
  if (AI == false) {
  if (upkey == true) righty = righty - 6;
  if (downkey == true) righty = righty + 6;
  } else {
  if (bally > righty + 10) {
    righty = righty + 6;
  }
  if (bally < righty - 10) {
    righty = righty - 10;
  }
}
  
  if (lefty > height-100) {
  lefty = lefty -8;
  }
  if (lefty < 100) {
  lefty = lefty +8;
  }
  
  if (righty > height-100) {
  righty = righty -8;
  }
  if (righty < 100) {
  righty = righty +8;
  }

  //ball
  stroke(255);
  fill(255);
  circle(ballx, bally, balld);

  //move ball
  if (timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
  }

  //scoring
  if (ballx < 0) {
    rightscore++;
    ballx = width/2;
    bally = height/2;
    timer = 100;
    score.rewind();
    score.play();
  }
  if (ballx > width) {
    leftscore++;
    ballx = width/2;
    bally = height/2;
    score.rewind();
    score.play();
  }

  //bouncing
  if (bally < balld/2 || bally > height-balld/2) {
    vy = vy * -1;
    wall.rewind();
    wall.play();
  }

  //paddles bouncing
  if (dist(rightx, righty, ballx, bally) < rightd/2 + balld/2) {
    vx = (ballx - rightx)/10;
    vy = (bally - righty)/10;
    rightbump.rewind();
    rightbump.play();
  }
  if (dist(leftx, lefty, ballx, bally) < balld/2 + leftd/2) {
    vx = (ballx - leftx)/10;
    vy = (bally - lefty)/10;
    leftbump.rewind();
    leftbump.play();
  }
  
  if (leftscore > 2) {
  mode = GAMEOVER;
  }
  
  if (rightscore > 2) {
  
  mode = GAMEOVER;
  }
  
}

void gameClicks() {

  mode = PAUSE;
}
