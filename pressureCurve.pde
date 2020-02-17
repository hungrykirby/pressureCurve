String place;
int year, month, day, hour;
float hPa;
Table csv;
int lenCsv = 0;

void setup() {
  csv = loadTable("pressure20200207.csv","header");
  size(500, 500);
  frameRate(30);

  for (TableRow row: csv.rows()) {
    lenCsv ++;
    place = row.getString("place");
    year  = row.getInt("year");
    month = row.getInt("month");
    day   = row.getInt("day");
    hour  = row.getInt("hour");
    hPa   = row.getFloat("hPa");
    print(place);
    println(hPa);
  }
}

void draw(){
  int f = frameCount % lenCsv;
  TableRow t = csv.getRow(f);
  hPa = t.getFloat("hPa");
  // print(csv.getColumnCount());
  // println(hPa);
  float d = (hPa - 900);
  background(255);
  circle(width/2, height/2, d);
}
