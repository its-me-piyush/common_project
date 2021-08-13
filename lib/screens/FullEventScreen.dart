import 'dart:async';
import 'dart:ui';

import 'package:events_app/screens/MapScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../provider/event_provider.dart';

class FullEventScreen extends StatefulWidget {
  final int uid; //Following variable will hold the uniqe id of the event

  FullEventScreen({
    required this.uid,
  });
  @override
  _FullEventScreenState createState() => _FullEventScreenState();
}

class _FullEventScreenState extends State<FullEventScreen> {
  double btnOffset =
      60; //Following is the variable, top store the offset for button

  @override
  Widget build(BuildContext context) {
    final eventDetail =
        Provider.of<EventsProvider>(context).getSingleEvent(widget.uid);
    //Following are the variables that would be used to set the values in UI
    //==> Fetch all the values, and assign to the following variables..
    //Remove this initial values, and replace with the fetched data using the respective uid recieved in constructor
    final String title = eventDetail.title; //Title
    final String city = eventDetail.city; //City
    final double ticketPrice = eventDetail.ticketprice; //Price
    final String startTime = eventDetail.time; //Start time
    final String imageUrl = eventDetail.image; //The image url
    final String description = eventDetail.description; //Description
    final double lattitute = eventDetail.lat; //Lattitude
    final double longitude = eventDetail.long; //Longitude

    //==> Following is the timer, which will let the byt Ticket btn animate from bottom
    Timer(Duration(milliseconds: 600), () {
      setState(() {
        btnOffset = 2;
      });
    });

    //==> Following is the code, to make the status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    //Returning the widget/Screen
    return Scaffold(
      //Code, to extrend the body behind appbar
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                //Following is the Container 1, for the elements to be placed at top in the UI
                Container(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.network(
                          imageUrl,
                          height: 280,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      //Following is the conatiner for backbtn and Event Details heading
                      Container(
                        margin: EdgeInsets.only(top: 60, left: 15),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                //Destroying current activity
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                } else {
                                  SystemNavigator.pop();
                                }
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                'Event Details',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                      //Showing the time, overlapping the Image
                      Container(
                        color: Colors.black54,
                        margin: EdgeInsets.only(top: 180, left: 30, right: 30),

                        //Following is the column to show starting time
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.lock_clock,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  startTime,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Text(
                              'ONWARDS',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //Following will be container 2, to set the basic details of the event..
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20, left: 12),
                  //==> Column for Title and City
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_city,
                                size: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  city,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      //==> Following will be the column to display the price of ticket
                      Card(
                        margin: EdgeInsets.only(right: 10),
                        elevation: 10,
                        color: Colors.purple,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.attach_money,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                ticketPrice.toString() + " \$",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 3,
                ),

                //Following container, just draws a line on the UI
                Container(
                  margin:
                      EdgeInsets.only(left: 60, right: 60, top: 20, bottom: 20),
                  width: double.infinity,
                  height: 1,
                  color: Colors.black45,
                ),

                SizedBox(
                  height: 3,
                ),

                //Following will be the container 3, to show the start time
                Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                        size: 19,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        startTime + " Onwards",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                //Following is the container 4, it will display the location co ordinates
                Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.gps_fixed,
                        color: Colors.grey,
                        size: 19,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Lattitude: " +
                            lattitute.toString() +
                            " Longitude: " +
                            longitude.toString(),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),

                //Following is the conatiner 5, which will store a button to show location on map
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(30),
                    child: OutlineButton(
                        borderSide: BorderSide(
                          color: Colors.purple,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        onPressed: () {
                          //The logic to show location co ordinates on map here..
                          //==> The developer needs to write the logic to start a activity with Location of the co ordinated showing on the map
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapsScreen(
                                      lattitude: lattitute,
                                      longitude: longitude,
                                      eventName: title,
                                    )),
                          );
                        },
                        child: Text(
                          'Show Location on Map',
                          style: TextStyle(color: Colors.purple, fontSize: 16),
                        ))),

                //Following container, just draws a line on the UI
                Container(
                  margin:
                      EdgeInsets.only(left: 60, right: 60, top: 0, bottom: 0),
                  width: double.infinity,
                  height: 1,
                  color: Colors.black45,
                ),

                //Following will be the conatiner 6, to show the description of the Event
                Container(
                  margin: EdgeInsets.only(left: 12, top: 20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Event Description',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        description,
                        maxLines: 4,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black87),
                      )
                    ],
                  ),
                ),
                //Following will  be the container 7, that will contain the button to buy the ticket
                // Container(
                //     margin: EdgeInsets.all(30),
                //     width: double.infinity,
                //     child: ElevatedButton(
                //       onPressed: () {},
                //       child: Text(
                //         'Buy Tickets Now',
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 16,
                //             fontWeight: FontWeight.bold),
                //       ),
                //       style: ButtonStyle(
                //           backgroundColor:
                //               MaterialStateProperty.all(Colors.purple)),
                //     ))
              ],
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: AnimatedContainer(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              duration: Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              transform: Matrix4.translationValues(0, btnOffset, 0),
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                      topRight: Radius.circular(60)),
                  color: Colors.purple),
              child: Center(
                child: Text(
                  'Buy Tickets Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
