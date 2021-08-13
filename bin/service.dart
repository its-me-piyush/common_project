import 'package:grpc/grpc.dart';
import 'package:events_app/grpc_exported_files.dart';

class EventService extends EventServiceBase {
  @override
  Future<EventResponse> getEvents(
      ServiceCall call, EventRequest request) async {
    if (request.id > 0) {
      final event = events
          .where((element) => element['uid'] == request.id)
          .map(
            (e) => Event.fromJson(
                '{"1": ${e['uid']}, "2": "${e['title']}", "3": "${e['city']}", "4": ${e['ticketprice']}, "5": "${e['time']}", "6": "${e['image']}", "7": ${e['lat']}, "8": ${e['long']}, "9": "${e['description']}" }'),
          )
          .toList();
      return EventResponse()..events.addAll(event);
    }
    final eventList = events
        .map(
          (e) => Event.fromJson(
              '{"1": ${e['uid']}, "2": "${e['title']}", "3": "${e['city']}", "4": ${e['ticketprice']}, "5": "${e['time']}", "6": "${e['image']}", "7": ${e['lat']}, "8": ${e['long']}, "9": "${e['description']}" }'),
        )
        .toList();
    return EventResponse()..events.addAll(eventList);
  }
}

void main() async {
  final server = Server([
    EventService(),
  ]);
  await server.serve(port: 5000);
  print('Server listning on port ${server.port}');
}
