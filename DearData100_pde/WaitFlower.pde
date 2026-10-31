class WaitFlower {
  String date;
  String time;
  String placeType;
  String waitFor;
  String outcome;
  String activity;

  int durationMinutes;
  int moodStart;
  int moodEnd;

  float x;
  float y;
  float flowerRadius = 13;
  float stemLength = 48;

  WaitFlower(TableRow row, int minDateKey, int maxDateKey) {
    date = row.getString("date");
    time = row.getString("time");
    placeType = row.getString("place_type");
    waitFor = row.getString("wait_for");
    durationMinutes = row.getInt("duration_minutes");
    moodStart = row.getInt("mood_start");
    moodEnd = row.getInt("mood_end");
    outcome = row.getString("outcome");
    activity = row.getString("activity");

    // Date plants a flower along the X-axis.
    x = map(dateToKey(date), minDateKey, maxDateKey, 90, width - 90);

    // Time plants a flower along the Y-axis.
    y = map(timeToMinutes(time), 0, 1439, 115, height - 110);
  }

  void display() {
    boolean hovered = isHovered();

    pushMatrix();
    translate(x, y);

    // Mood start is the default leaf count.
    // On hover, the leaves change to show mood end.
    int visibleLeaves = hovered ? moodEnd : moodStart;

    drawStemAndLeaves(visibleLeaves);
    drawPetals();
    drawOutcomeFace();
    drawWaitForSign();

    if (hovered) {
      drawHoverDetails();
    }

    popMatrix();
  }

  void drawStemAndLeaves(int leafCount) {
    stroke(47, 112, 55);
    strokeWeight(3);
    line(0, flowerRadius, 0, stemLength);

    noStroke();
    fill(activityColour());

    for (int i = 0; i < leafCount; i++) {
      float leafY = flowerRadius + 9 + i * ((stemLength - flowerRadius - 12) / max(1, leafCount));

      pushMatrix();
      translate(0, leafY);
      rotate(i % 2 == 0 ? -PI / 4 : PI / 4);
      ellipse(i % 2 == 0 ? -7 : 7, 0, 15, 7);
      popMatrix();
    }
  }

  void drawPetals() {
    noStroke();
    fill(placeColour());

    int petalCount = petalsFromDuration();

    for (int i = 0; i < petalCount; i++) {
      float angle = TWO_PI * i / petalCount;

      pushMatrix();
      rotate(angle);
      ellipse(flowerRadius + 9, 0, 23, 11);
      popMatrix();
    }
  }

  void drawOutcomeFace() {
    noStroke();
    fill(outcomeColour());
    ellipse(0, 0, flowerRadius * 2, flowerRadius * 2);

    fill(35);
    ellipse(-4, -3, 2.5, 2.5);
    ellipse(4, -3, 2.5, 2.5);

    noFill();
    stroke(35);
    strokeWeight(1.5);

    if (outcome.equals("succeeded")) {
      // Happy
      arc(0, 3, 9, 7, 0, PI);
    } else if (outcome.equals("missed")) {
      // Unhappy
      arc(0, 7, 9, 7, PI, TWO_PI);
    } else {
      // Neutral / quit
      line(-4, 5, 4, 5);
    }
  }

  void drawWaitForSign() {
    float signX = flowerRadius + 18;
    float signY = 4;

    stroke(112, 77, 43);
    strokeWeight(2);
    line(signX, signY, signX, stemLength);

    rectMode(CORNER);
    fill(255, 247, 218);
    rect(signX - 24, signY - 15, 48, 19, 3);

    fill(70, 50, 30);
    textAlign(CENTER, CENTER);
    textSize(8);
    text(waitFor, signX, signY - 6);
  }

  void drawHoverDetails() {
    fill(35, 90, 45);
    textAlign(CENTER);
    textSize(10);
    text("Mood: " + moodStart + " → " + moodEnd + " | " + activity, 0, stemLength + 17);
  }

  // Returns the number of petals. Duration directly controls petal count.
  int petalsFromDuration() {
    return max(3, durationMinutes);
  }

  // Returns true when the mouse is over this flower.
  boolean isHovered() {
    return dist(mouseX, mouseY, x, y) < flowerRadius + 14;
  }

  color placeColour() {
    if (placeType.equals("station") || placeType.equals("bus_stop")) {
      return color(85, 150, 240);
    } else if (placeType.equals("cafeteria") || placeType.equals("restaurant") || placeType.equals("cafe") || placeType.equals("takeaway")) {
      return color(242, 140, 110);
    } else if (placeType.equals("library")) {
      return color(160, 120, 205);
    } else if (placeType.equals("school") || placeType.equals("lecture_hall")) {
      return color(245, 190, 80);
    } else {
      return color(130, 195, 140);
    }
  }

  color activityColour() {
    if (activity.equals("listening_music")) {
      return color(80, 150, 210);
    } else if (activity.equals("reading")) {
      return color(70, 165, 135);
    } else if (activity.equals("talking") || activity.equals("chatting")) {
      return color(180, 110, 190);
    } else if (activity.equals("checking_phone") || activity.equals("scrolling")) {
      return color(235, 165, 75);
    } else {
      return color(96, 175, 90);
    }
  }

  color outcomeColour() {
    if (outcome.equals("succeeded")) {
      return color(255, 220, 75);
    } else if (outcome.equals("missed")) {
      return color(240, 110, 105);
    } else {
      return color(190, 195, 205);
    }
  }
}
