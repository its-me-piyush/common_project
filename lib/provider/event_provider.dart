import 'package:flutter/material.dart';

import 'package:grpc/grpc.dart';
import '../grpc_exported_files.dart';

import '../models/event_model.dart';

class EventsProvider with ChangeNotifier {
  List<EventsModel> _items = [];

  Future<void> getData() async {
    final channel = ClientChannel(
      '10.0.2.2',
      port: 5000,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    final stub = EventServiceClient(channel);

    var response = await stub.getEvents(EventRequest());

    var eventData = response.events;
    List<EventsModel> _trial = [];
    eventData.forEach((element) {
      _trial.add(
        EventsModel(
          uid: element.uid,
          title: element.title,
          city: element.city,
          ticketprice: double.parse(element.ticketprice.toStringAsFixed(2)),
          time: element.time,
          image: element.image,
          lat: element.lat,
          long: element.long,
          description: element.description,
        ),
      );
    });

    _items = _trial;
    await channel.shutdown();
    notifyListeners();
  }

  List<EventsModel> get events {
    return [..._items];
  }

  EventsModel getSingleEvent(int id) {
    return _items.firstWhere((element) => element.uid == id);
  }
}
