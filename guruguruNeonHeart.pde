import java.util.Calendar;

float radius = 20;     // 最初の四角の大きさ(直径/2)
float addRadius = 18.0; //線と線の間隔（数字が小さいと狭い）
float thickness = 20; //線の太さ
int rotNum = 3*4; //うずまき3週*４頂点
PVector[] vertex = {};
PVector[] hPos = {};
int vc = 0;
float tr;

color col1, col2, col3;

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);     
  noStroke();

  col1 = color(326, 93, 71); //背景のライトの色
  col2 = color(325, 89, 7); //背景色
  col3 = color(334, 83, 90); //線の色（ピンク）

  setVertex();
  drawHeart();
};
void draw() {
}

void keyPressed() {
  if (key == 's' || key == 'S')saveFrame(timestamp()+"_####.png");
}


String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
