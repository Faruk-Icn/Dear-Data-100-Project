Table waits;
ArrayList<WaitFlower> flowers = new ArrayList<WaitFlower>();


int minDateKey = 99999999;
int maxDateKey = 0;

void setup() {
  size(1100, 750);
  smooth();

  waits = loadTable("waits.csv", "header");
  println(waits.getRowCount());

  for (TableRow row : waits.rows()) {
    int dateKey = dateToKey(row.getString("date"));
    minDateKey = min(minDateKey, dateKey);
    maxDateKey = max(maxDateKey, dateKey);
  }

  if (minDateKey == maxDateKey) {
    maxDateKey = minDateKey + 1;
  }

  for (TableRow row : waits.rows()) {
    flowers.add(new WaitFlower(
      row,
      minDateKey,
      maxDateKey
    ));
  }
}

void draw() {
  drawGardenBackground();

  for (WaitFlower flower : flowers) {
    flower.display();
  }

}

void drawGardenBackground() {
  background(235, 249, 238);

  noStroke();

  stroke(130, 160, 130);
  strokeWeight(1);
  for (int hour = 0; hour <= 24; hour += 4) {
    float y = map(hour * 60, 0, 1439, 115, height - 105);
    line(75, y, width - 75, y);
  }
}


int dateToKey(String date) {
  String[] parts = split(date, "-");
  return int(parts[0]) * 372 + int(parts[1]) * 31 + int(parts[2]);
}

int timeToMinutes(String time) {
  String[] parts = split(time, ":");
  return int(parts[0]) * 60 + int(parts[1]);
}