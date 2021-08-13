///
//  Generated code. Do not modify.
//  source: events.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'events.pb.dart' as $0;
export 'events.pb.dart';

class EventServiceClient extends $grpc.Client {
  static final _$getEvents =
      $grpc.ClientMethod<$0.EventRequest, $0.EventResponse>(
          '/EventService/getEvents',
          ($0.EventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.EventResponse.fromBuffer(value));

  EventServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.EventResponse> getEvents($0.EventRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getEvents, request, options: options);
  }
}

abstract class EventServiceBase extends $grpc.Service {
  $core.String get $name => 'EventService';

  EventServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.EventRequest, $0.EventResponse>(
        'getEvents',
        getEvents_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EventRequest.fromBuffer(value),
        ($0.EventResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.EventResponse> getEvents_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EventRequest> request) async {
    return getEvents(call, await request);
  }

  $async.Future<$0.EventResponse> getEvents(
      $grpc.ServiceCall call, $0.EventRequest request);
}
