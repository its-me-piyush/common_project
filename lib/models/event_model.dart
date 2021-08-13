class EventsModel {
  final int uid;
  final String title;
  final String city;
  final double ticketprice;
  final String time;
  final String image;
  final double lat;
  final double long;
  final String description;

  EventsModel({
    required this.uid,
    required this.title,
    required this.city,
    required this.ticketprice,
    required this.time,
    required this.image,
    required this.lat,
    required this.long,
    required this.description,
  });
}
