import 'package:events_app/screens/FullEventScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/all_events_lsit_widget.dart';
import '../provider/event_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 1,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          'Events',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: Provider.of<EventsProvider>(context, listen: false).getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Consumer<EventsProvider>(
              child: Center(
                child: const Text('Sorry, no events found!'),
              ),
              builder: (context, value, ch) {
                if (value.events.length <= 0) {
                  return ch!;
                }
                var eventData = value.events.reversed.toList();
                return CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (eventData.isEmpty)
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width: double.infinity,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                if (eventData.isNotEmpty)
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width: double.infinity,
                                    child: CarouselSlider.builder(
                                      itemCount: eventData.length,
                                      itemBuilder:
                                          (context, index, realIndex) =>
                                              InkWell(
                                        borderRadius: BorderRadius.circular(12),
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  FullEventScreen(
                                                uid: eventData[index].uid,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Stack(
                                          alignment: Alignment.bottomLeft,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    eventData[index].image,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.3,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    Container(),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                eventData[index]
                                                    .title
                                                    .toUpperCase(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      options: CarouselOptions(
                                        enableInfiniteScroll: true,
                                        autoPlay: true,
                                        autoPlayInterval: Duration(seconds: 5),
                                        enlargeCenterPage: true,
                                        autoPlayAnimationDuration:
                                            Duration(seconds: 2),
                                        pauseAutoPlayOnTouch: true,
                                        viewportFraction: 0.8,
                                      ),
                                    ),
                                  ),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Text(
                                    'All Events:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                AllEventsWidget(
                                  eventData: eventData.reversed.toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
