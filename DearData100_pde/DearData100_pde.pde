Table waits;
ArrayList<WaitFlower> flowers = new ArrayList<WaitFlower>();

int minDateKey = 99999999;
int maxDateKey = 0;

void setup() {
  size(1100, 750);
  smooth();

  waits = loadTable("waits.csv", "header");

  // Find the date range first, so every date can be mapped across the garden.
  for (TableRow row : waits.rows()) {
    int dateKey = dateToKey(row.getString("date"));
    minDateKey = min(minDateKey, dateKey);
    maxDateKey = max(maxDateKey, dateKey);
  }

  if (minDateKey == maxDateKey) {
    maxDateKey = minDateKey + 1;
  }

  // Each CSV row becomes one WaitFlower object.
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

  drawTitleAndKey();
}

void drawGardenBackground() {
  background(235, 249, 238);

  noStroke();
  fill(198, 229, 196);
  rect(0, height - 80, width, 80);

  stroke(130, 160, 130);
  strokeWeight(1);
  for (int hour = 0; hour <= 24; hour += 4) {
    float y = map(hour * 60, 0, 1439, 115, height - 105);
    line(75, y, width - 75, y);
  }
}

void drawTitleAndKey() {
  fill(30, 70, 40);
  textAlign(LEFT);
  textSize(24);
  text("Mood Garden: Waiting Data", 30, 38);

  textSize(12);
  text("X-axis = date    Y-axis = time of day    Hover over a flower to reveal its mood change", 30, 60);

  textAlign(RIGHT);
  text("Flowers: " + flowers.size(), width - 30, 38);
}

// Returns a number that Processing can map along the X-axis.
int dateToKey(String date) {
  String[] parts = split(date, "-");
  return int(parts[0]) * 372 + int(parts[1]) * 31 + int(parts[2]);
}

// Returns the number of minutes after midnight for the Y-axis.
int timeToMinutes(String time) {
  String[] parts = split(time, ":");
  return int(parts[0]) * 60 + int(parts[1]);
}
