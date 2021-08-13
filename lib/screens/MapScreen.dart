import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  //Following are the variables, to get the deatils we need to display the location
  final double lattitude;
  final double longitude;
  final String eventName;

  const MapsScreen(
      {required this.lattitude,
      required this.longitude,
      required this.eventName});

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  //Now, we need a google map controller
  late GoogleMapController _googleMapController;

  //Disposing teh google maps controller
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//Creating the Latlng variables

    LatLng destinationPosition = LatLng(widget.lattitude, widget.longitude);

    double lat = widget.lattitude;
    double lon = widget.longitude;

    var _initialMapPosition2 =
        CameraPosition(target: LatLng(lat, lon), zoom: 11.5);

    Marker destination = Marker(
      markerId: MarkerId(widget.eventName),
      infoWindow: InfoWindow(title: widget.eventName),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: destinationPosition,
    ); //The location popsition

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            initialCameraPosition: _initialMapPosition2,
            onMapCreated: (GoogleMapController controller) {
              _googleMapController = controller;
              //Calling the method, to add the markers
            },
            markers: {
              destination,
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            width: double.infinity,
            color: Colors.black54,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.eventName,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          'Click on the marker for options',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } else {
                          SystemNavigator.pop();
                        }
                      },
                      child: Icon(
                        Icons.close,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      //Following is the floating action button to take to the initial position
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          onPressed: () {
            _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(_initialMapPosition2));
          },
          child: const Icon(
            Icons.center_focus_strong,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
