# Live Location Tracking in Flutter

## Overview
This Flutter project provides real-time tracking of users' locations and allows access to their location history. The app displays live locations on an interactive map and offers an option to view historical routes, along with essential information such as travel time and distance.

## Key Features

1. *Member List and Attendance*  
   - Navigate to the *Attendance* section from the menu to view the list of team members.
   - Each member is displayed with an avatar, their current login status, and two actionable icons.
     - *View Location History*: The calendar icon opens the history of the member’s locations for the selected date.
     - *Track Live Location*: The GPS icon displays the current live location of the member on a map.

2. *Real-Time Location Tracking*  
   - The live location of a member is displayed on an interactive map, allowing you to track their real-time movements.
   - The map updates dynamically as the member’s location changes, providing up-to-date tracking in a visually intuitive manner.

3. *Location History and Route*  
   - The *Location History* screen provides detailed information on a member’s past locations for a specific day.
   - You can:
     - Scroll through the list of timestamps and visited places.
     - Visualize each stop on the map, showing the exact route taken throughout the day.
   - Optionally, you can set a date filter to view data from previous days and analyze the travel route for specific periods.

4. *Route Visualization*  
   - The *Route View* provides a complete overview of the paths taken between different locations.
     - Important details include:
       - *Start Location*
       - *End Location*
       - *Total Distance* covered (in kilometers)
       - *Total Time* taken between points
     - Stops lasting more than *10 minutes* are marked with distinct markers, making it easy to identify significant halts during the journey.

## Screens Overview

1. *Attendance Screen*  
   - Lists all team members with the following features:
     - *Calendar Icon* for accessing location history
     - *GPS Icon* for tracking live location

2. *Live Location Screen*  
   - Displays the real-time location of a selected member on a map.
   - The map is interactive, allowing you to zoom in or out and see the movement of the member in real-time.

3. *Location History Screen*  
   - Shows a chronological list of all the locations visited by a member on a particular date.
   - Includes details like:
     - *Time of Visit*
     - *Coordinates or Place Name*
   - The history is displayed on a map, with the option to visualize the entire route.

4. *Route Screen*  
   - Displays the route between any two selected locations, along with key metrics like distance and time.
   - The full route is rendered on the map, showing the complete travel path with markers for extended stops.

## How to Use

1. Open the *Attendance* section from the app’s menu.
2. Click on the *GPS icon* next to a member to view their live location on a map.
3. To see location history:
   - Click the *calendar icon* next to a member.
   - Select a date to see all visited locations on that day.
4. To visualize the route between two locations:
   - Select any two points from the *Location History* screen.
   - The app will display the full route on the map, along with important travel details.

## Technologies Used
- *Flutter* for front-end development.
- *Google Maps API* for live map rendering.
- *Geolocation* services for tracking real-time movements.

## Conclusion
The Live Location Tracking feature in this Flutter project provides a seamless way to track and review users' location data. With real-time updates, location history, and detailed route visualization, it offers a comprehensive tool for monitoring travel patterns and ensuring transparency in location tracking.
