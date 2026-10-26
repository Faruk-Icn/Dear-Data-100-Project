# Dear-Data-Project

For my Dear Data 100 Project I will be recording every time I wait; this can include stuff like waiting for public transport, food, people, or lectures to start.

Each row in my dataset will represent a wait which is at-least a minute long.

I will be assessing and visualising the outcome of the waits and how it relates to mood and what I do while waiting.

## What do the columns represent?

Each row will have 9 different columns which I plan on representing simultaneously;
- Date, the date of the wait
- Time, the time when the wait started
- Place Type, a general location where I waited
- Wait For, what I was waiting for
- Duration, how long I have waited for in minutes
- Mood Start (0-5, 0 being unhappy, 5 being completely satisfied)
- Mood End (0-5)
- Outcome, did I succeed, quit or miss the wait
- Activity, what I do while waiting

## How I will represent this data creatively

For my project I have decided to create a "Mood Garden" which will allow me to explore across gardens and flowers to visualise the patterns in the data of my waiting. Each garden will represent a unique activity that I was doing during my waits and each flower in these gardens will represent the 8 other parameters.

- The date of the wait will be represented by planting the flower on the X-Axis of the garden using the map() function
- The time will also be represented in a similar way on the Y-Axis of the garden
- The place type will be represented by the colour of the petals on each flower
- The wait duration will be the number of petals that surround the flower
- Mood start and mood end will be represented in a more advanced system where mood start will be the original number of leaves on the stem and as the user hovers over the flower the leaves will increase or decrease depending on the mood end
- The mood of the flower will be represented by the outcome of the the wait (happy, neutral, unhappy)
- The wait for is going to be displayed on a sign next to the flower


## Current Processing prototype

The current Processing sketch is in `DearData100_pde/DearData100_pde.pde`. It loads a copy of the waiting dataset from `DearData100_pde/data/waits.csv`.

The prototype represents the full dataset as one flower:

- The flower centre size is based on the average wait duration.
- The number of petals is based on the number of recorded observations, limited to 5–12 petals so that the flower remains readable.
- The sketch displays the calculated average waiting time and the number of recorded waits.

Two methods return values from the CSV data:

- `calculateAverageWait()` returns a `float` average of the `duration_minutes` column.
- `calculatePetalCount()` returns an `int` based on the number of rows in the CSV.

This is the first prototype for the Mood Garden. The next stage is to create individual flowers so that each wait can use its own date, time, place, mood, outcome, and activity values.

## Log
### Week 1:
- Created a Repository
- Created a CSV template for the data I'm recording
- Created a README
- Current Data: 0/100
### Week 2:
- Recorded and uploaded data
- Current Data 24/100
- Came up with a creative way in representing this data 

### Week 3:
- Connected the Processing sketch to the CSV data
- Added methods that return the average wait duration and petal count
- Created the first flower prototype based on the collected data
- Current Data: 39/100
