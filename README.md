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
- The wait duration will control the number of petals around the flower
- The activity during the wait will be represented by the stem colour
- The mood of the flower will be represented by the outcome of the the wait (happy, neutral, unhappy)
- The wait for is going to be displayed on a sign next to the flower


## Current Processing prototype

The current Processing sketch is in `DearData100_pde.pde` at the repository root. It loads the waiting dataset from `data/waits.csv`.

Each row in the CSV creates a `WaitFlower` object:

- The date and time control its position in the garden.
- The petal colour represents the place type.
- The number of petals represents the wait duration.
- The stem colour represents the activity during the wait.
- The centre colour and expression represent the outcome.

Methods that return values include `dateToKey()`, `timeToMinutes()`, `petalsFromDuration()`, `isHovered()`, and the colour methods in the `WaitFlower` class.

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
- Added methods that return values from the collected data
- Created the first flower prototype based on the collected data
- Current Data: 39/100

### Week 4:
- Worked on methods and improved the program
- Implemented CSV data to the program
- Current Data: 62/100

### Week 5:
- Updated flower method and worked on the main pde
