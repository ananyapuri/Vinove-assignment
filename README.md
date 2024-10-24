# Location Screen Feature in Flutter

## Overview
This feature allows users to track and view the current location and traveled routes of individual members in a clear and interactive way. It displays locations on a map and provides a timeline of all visited places, with options to filter by date and view travel details.

## Key Features

1. *Attendance List*  
   - *Access: Start by going to the **Attendance* section from the menu. Here, you'll see a list of members, each with two icons on the right.
   - *Check Location: The **second icon* lets you see the current location and travel history of a member.

2. *View Member’s Location and Timeline*  
   - *Map View: Clicking the location icon will open a map showing the member’s **current location*.
   - *Timeline: At the bottom, you'll see a timeline that lists all places the member visited **today*. You can also pull the list upward to see more.
   - *Date Filter*: Want to check past data? Just use the date filter to view visited locations on previous days.

3. *Route Generation*  
   - *Route Between Two Locations*: You can select any two visited locations, and the system will generate the route between them.
     - *Details Shown*:
       - *Start Location*
       - *Stop Location*
       - *Total Distance* (in kilometers)
       - *Total Travel Time*
   - *Map View: The map will display the entire route, marked with **red dots* where the member stopped for more than *10 minutes*.

## Screens Overview

1. *Attendance Screen*:  
   - Lists members with icons to access their current location and travel routes.

2. *Location & Timeline View*:  
   - Shows a map with the current location of the member and a timeline of visited locations for today (or past dates with the filter).

3. *Route Screen*:  
   - Displays the route between two selected locations, showing details like start/stop points, distance, and travel time. The full route is drawn on the map, with stop markers for extended pauses.

## How to Use

1. Go to the *Attendance* section and click on the second icon next to a member.
2. View their *current location* on the map and scroll through the timeline to see all the places they visited today.
3. To see the route between any two locations, select them, and you'll get a detailed map view with travel stats.

## Conclusion
This feature provides a simple, interactive way to track a member's movements, showing their current location, visited places, and full travel routes, complete with important details like distance, time, and stops.

---
