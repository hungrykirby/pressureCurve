String place;
int year, month, day, hour;
float hPa;
Table csv;
int lenCsv = 0;
FloatList hPaArray;
int numOfCircle = 1; // 1日ごとに1つボールが増える
int preDay = 0;
int w;
int h;

void setup() {
  csv = loadTable("pressure20200207.csv","header");
  size(500, 500);
  background(255);
  frameRate(30);
  fill(0);
  noStroke();

  for (TableRow row: csv.rows()) {
    lenCsv ++;
    place = row.getString("place");
    year  = row.getInt("year");
    month = row.getInt("month");
    day   = row.getInt("day");
    hour  = row.getInt("hour");
    hPa   = row.getFloat("hPa");
  }
  hPaArray = new FloatList();
  w = width/2; h = height/2;
}

void draw(){
  int f = frameCount % lenCsv;
  int r = 0; // 傾き
  TableRow t = csv.getRow(f);
  hPa = t.getFloat("hPa");
  hPaArray.append(hPa);
  if(hPaArray.size() >= 10){
    hPaArray.remove(0);
  }
  if(frameCount >= lenCsv - 1){
    noLoop();
  }
  float d = (hPa - 900); //中心からの距離
  background(255);
  
  float s = 0;
  int l = hPaArray.size();
  if(l > 1){
    s = hPaArray.get(l - 1) - hPaArray.get(l - 2);
  }
  colorMode(HSB, 100);
  // fill(s*10 + 70, 100, 100);
  for(int i = 0; i < numOfCircle; i++){
    circle(w + d*sin((i + f*0.1/PI)*PI*2/numOfCircle), h + d*cos((i + f*0.1/PI)*PI*2/numOfCircle), abs(s)*5 + 30);
  }
  month = t.getInt("month");
  day   = t.getInt("day");
  if(day != preDay){
    numOfCircle++;
  }
  preDay = day;
  hour  = t.getInt("hour");
  textSize(20);
  colorMode(RGB, 256);
  fill(0);
  text(str(month) + "month, " + str(day) + "day, " + str(hour) + "hour", 20, 20);
  // saveFrame("frames/####.png");
}
