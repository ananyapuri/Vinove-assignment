import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vinove_assignemnt/RouteScreen.dart';
import 'Member.dart';

class LocationHistoryScreen extends StatefulWidget {
  final Member member;

  LocationHistoryScreen(this.member);

  @override
  State<LocationHistoryScreen> createState() => _LocationHistoryScreenState();
}

class _LocationHistoryScreenState extends State<LocationHistoryScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.7749, -122.4194),
      zoom: 14); // Updated to match San Francisco
  final List<Marker> _markers = <Marker>[
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(37.7749, -122.4194),
      infoWindow: InfoWindow(title: 'Patricia\'s Green Inn'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.indigo,
        title: Text(
          'Track Live Location',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Google Map showing the current location
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            mapType: MapType.normal,
            compassEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: _markers.toSet(),
            circles: {
              Circle(
                circleId: CircleId('radiusCircle'),
                center: LatLng(37.7749, -122.4194),
                radius: 500,
                // Radius in meters
                fillColor: Colors.blue.withOpacity(0.2),
                strokeColor: Colors.blue,
                strokeWidth: 2,
              ),
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),

          Positioned(
            top: 350,
            left: 170,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC4D4qC-OqCVv8jT4HjPuJ9izxULizCBRiPg&s"),
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 5)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 5)
                    ],
                  ),
                  child: Text("5 min ago"),
                )
              ],
            ),
          ),

          Positioned(
            top: 0,
            child: Container(
              width: 400,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15, // You can adjust the size
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC4D4qC-OqCVv8jT4HjPuJ9izxULizCBRiPg&s'), // Replace with your image URL or asset
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(widget.member.name + " (" + widget.member.id + ")",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Change',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // DraggableScrollableSheet for the timeline
          DraggableScrollableSheet(
            initialChildSize: 0.4, // initial height
            minChildSize: 0.3, // min height when collapsed
            maxChildSize: 0.8, // max height when expanded
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
                ),
                child: Column(
                  children: [
                    Center(
                        child: Container(
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(25)),
                    )),

                    SizedBox(
                      height: 10,
                    ),
                    // Header Row with total sites and date
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('Total Sites: ',
                                  style: TextStyle(fontSize: 16)),
                              Text('10',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.blue.shade300,
                                size: 16,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Tue, Aug 31 2022',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  SizedBox(width: 8),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 16,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    // Timeline List
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        children: [
                          _buildTimelineTile(
                              context,
                              "1234 Maple St. Brooklyn, New York 11215",
                              "Left at 07:45 am",
                              false),
                          _buildTimelineTile(
                              context,
                              "4321 Oak Ln. Houston, Texas 77001",
                              "08:50 am - 10:30 am",
                              false),
                          _buildTimelineTile(
                              context,
                              "789 Pine Rd, Seattle, Washington 98109",
                              "11:00 am - 11:30 am",
                              false),
                          _buildTimelineTile(
                              context,
                              "Sunrise Plaza 22 Sunshine Blvd, Miami, FL 33101",
                              "12:15 pm - 12:45 pm",
                              false),
                          _buildTimelineTile(
                              context,
                              "305 Beach St. Venice, California 90291",
                              "01:20 pm - 01:45 pm",
                              false),
                          _buildTimelineTile(
                              context,
                              "985 Elm Dr. Los Angeles, CA 90001",
                              "02:30 pm - 03:30 pm",
                              false),
                          _buildTimelineTile(
                              context,
                              "768 Birch Grove, Madison, Wisconsin 53703",
                              "03:50 pm - 04:15 pm",
                              false),
                          _buildTimelineTile(
                              context,
                              "45 Sunset Blvd, Malibu, California 90265",
                              "05:00 pm - 05:30 pm",
                              false),
                          _buildTimelineTile(
                              context,
                              "1234 Maple St. Brooklyn, New York 11215",
                              "06:05 pm",
                              false),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Custom function to build each timeline tile
Widget _buildTimelineTile(
    BuildContext context, String title, String subtitle, bool isFirst) {
  return ListTile(
    leading: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.circle, color: Color(0xFF42329E), size: 10),
        if (!isFirst) Container(height: 40, width: 2, color: Color(0xFF42329E)),
      ],
    ),
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Text(subtitle),
    trailing: IconButton(
      icon: Icon(Icons.chevron_right),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RouteScreen(
                Member("Mandeep Singh", "MSJ888", "Online", "12345", "9828")),
          ),
        );
      },
    ),
  );
}
