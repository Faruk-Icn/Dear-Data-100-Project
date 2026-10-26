Table waits;

int petalCount;
float centerSize;
float stemLength = 150;
float averageWait;

void setup() {
  size(400, 400);

  waits = loadTable("waits.csv", "header");

  averageWait = calculateAverageWait();
  petalCount = calculatePetalCount();
  centerSize = map(averageWait, 0, 30, 40, 110);
}

void draw() {
  background(255);

  pushMatrix();
  translate(width / 2, height / 2);

  // Stem
  stroke(34, 139, 34);
  strokeWeight(6);
  line(0, 0, 0, stemLength);

  // Petals: number depends on the number of CSV rows
  noStroke();
  fill(240, 50, 50);

  for (int i = 0; i < petalCount; i++) {
    float angle = TWO_PI / petalCount * i;

    pushMatrix();
    rotate(angle);
    ellipse(centerSize * 0.6, 0, centerSize * 0.9, centerSize * 0.5);
    popMatrix();
  }

  // Flower centre: size depends on average wait duration
  fill(255, 204, 0);
  ellipse(0, 0, centerSize, centerSize);

  popMatrix();

  fill(0);
  textAlign(CENTER);
  text("Average wait: " + nf(averageWait, 0, 1) + " minutes", width / 2, 30);

  int recordCount = waits == null ? 0 : waits.getRowCount();
  text("Recorded waits: " + recordCount, width / 2, 50);
}

// Returns the average duration from duration_minutes in the CSV
float calculateAverageWait() {
  if (waits == null || waits.getRowCount() == 0) {
    return 0;
  }

  float totalMinutes = 0;

  for (TableRow row : waits.rows()) {
    totalMinutes += row.getFloat("duration_minutes");
  }

  return totalMinutes / waits.getRowCount();
}

// Returns a petal count based on the number of recorded observations
int calculatePetalCount() {
  if (waits == null) {
    return 5;
  }

  return constrain(waits.getRowCount(), 5, 12);
}
