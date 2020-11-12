void drawHeart() {

  //背景
  background(col2);
  
  translate(0, tr);
  
  float c = 5;
  float d = thickness*6;
  for (int i=0; i<c; i++) {
    color col = lerpColor(col2, col1, i/c);
    float dd = lerp(d, d*0.2, i/c);
    
    for (int j = 0; j < hPos.length; j++) {
      fill(col);
      ellipse(hPos[j].x, hPos[j].y, dd, dd);
    }
  }
  filter(BLUR, 40);

  //ピンクの線
  for (int i = 0; i < hPos.length; i++) {
    fill(col3);
    ellipse(hPos[i].x, hPos[i].y, thickness, thickness);
  }
  filter(BLUR, 3);

  //白い線
  for (int i = 0; i < hPos.length; i++) {
    fill(0, 0, 100);
    ellipse(hPos[i].x, hPos[i].y, thickness*0.4, thickness*0.4);
  }
}
