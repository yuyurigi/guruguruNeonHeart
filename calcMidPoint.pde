//辺の中点を計算する
PVector calcMidPoint(PVector end1, PVector end2) {
  float mx, my;
  if (end1.x > end2.x) {
    mx = end2.x + ((end1.x - end2.x)/2);
  } else {
    mx = end1.x + ((end2.x - end1.x)/2);
  }
  if (end1.y > end2.y) {
    my = end2.y + ((end1.y - end2.y)/2);
  } else {
    my = end1.y + ((end2.y - end1.y)/2);
  }
  PVector cMP = new PVector(mx, my);
  return cMP;
}
