void setVertex() {
  PVector center = new PVector(width/2, height/2);
  PVector Ac = new PVector();

  //四角形の頂点を配列に代入
  float ang = 90;
  for (int i = 0; i <=rotNum; i++) {
    float rad = radians(ang);
    float x =  center.x + (radius*cos(rad));
    float y = center.y+ (radius* sin(rad));
    vertex = (PVector[]) append(vertex, new PVector(x, y));
    radius += addRadius;
    ang  += 90;
  }

  //ハートが真ん中に表示されるようy座標を変える
  //ハートの一番高い部分のy座標を計算する
  float lasty = height/2;
  PVector mp0 = calcMidPoint(vertex[vertex.length-3], vertex[vertex.length-2]);
  float rad = PVector.dist(mp0, vertex[vertex.length-3]);
  float ang0 = atan2(vertex[vertex.length-3].y-mp0.y, vertex[vertex.length-3].x-mp0.x);
  float deg = degrees(ang0);
  for (int i = 0; i <= 180; i++) {
    float y = mp0.y + (rad*sin(radians(deg)));
    deg += 1;
    if (y < lasty) {
      lasty = y;
    }
  }
  PVector top = new PVector(vertex[vertex.length-1].x, lasty);
  PVector hcenter = calcMidPoint(vertex[vertex.length-1], top);
  tr = dist(hcenter.x, hcenter.y, center.x, center.y);

  //---------------------------------------------------
  //ハートのすべての頂点を配列に代入

  while (vc<vertex.length-1) {

    PVector Pos = vertex[vc].copy();

    if (vc%4 == 0 || vc%4 == 3) { //直線部分
      //Posと次の頂点との距離
      float dist = PVector.dist(Pos, vertex[vc+1]);
      Ac = PVector.sub(vertex[vc+1], Pos); //次の頂点に向かうベクトルを計算
      Ac.normalize(); //単位ベクトル化

      for (float i = 0; i < dist; i++) {
        Pos.add(Ac.x, Ac.y);
        hPos = (PVector[]) append(hPos, new PVector(Pos.x, Pos.y));
      }

      //ハートの丸い部分
    } else if (vc%4 == 1 || vc%4 == 2) {
      PVector mp = calcMidPoint(vertex[vc], vertex[vc+1]);
      float hRad = PVector.dist(mp, vertex[vc]);
      float hAng = atan2(vertex[vc].y - mp.y, vertex[vc].x - mp.x);
      float hDeg = degrees(hAng);

      for (float angle = hDeg; angle<=hDeg+180; angle++) {
        Pos.x = mp.x + (hRad*cos(radians(angle)));
        Pos.y = mp.y + (hRad*sin(radians(angle)));
        hPos = (PVector[]) append(hPos, new PVector(Pos.x, Pos.y));
      }
    }
    vc+=1;
  }
}
