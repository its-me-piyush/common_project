import 'package:grpc/grpc.dart';
import 'package:events_app/grpc_exported_files.dart';

void main() async {
  final channel = ClientChannel(
    '10.0.2.2',
    port: 5000,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );

  final stub = EventServiceClient(channel);

  var response = await stub.getEvents(EventRequest());

  print('Response recieved: ${response.events.length}');

  await channel.shutdown();
}
