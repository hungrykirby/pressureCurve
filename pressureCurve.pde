String place;
int year, month, day, hour;
float hPa;

void setup() {
  Table csv = loadTable("pressure20200207.csv","header");

  for (TableRow row: csv.rows()) {
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
