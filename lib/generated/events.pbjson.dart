///
//  Generated code. Do not modify.
//  source: events.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use eventDescriptor instead')
const Event$json = const {
  '1': 'Event',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 5, '10': 'uid'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'city', '3': 3, '4': 1, '5': 9, '10': 'city'},
    const {'1': 'ticketprice', '3': 4, '4': 1, '5': 2, '10': 'ticketprice'},
    const {'1': 'time', '3': 5, '4': 1, '5': 9, '10': 'time'},
    const {'1': 'image', '3': 6, '4': 1, '5': 9, '10': 'image'},
    const {'1': 'lat', '3': 7, '4': 1, '5': 1, '10': 'lat'},
    const {'1': 'long', '3': 8, '4': 1, '5': 1, '10': 'long'},
    const {'1': 'description', '3': 9, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `Event`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventDescriptor = $convert.base64Decode('CgVFdmVudBIQCgN1aWQYASABKAVSA3VpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSEgoEY2l0eRgDIAEoCVIEY2l0eRIgCgt0aWNrZXRwcmljZRgEIAEoAlILdGlja2V0cHJpY2USEgoEdGltZRgFIAEoCVIEdGltZRIUCgVpbWFnZRgGIAEoCVIFaW1hZ2USEAoDbGF0GAcgASgBUgNsYXQSEgoEbG9uZxgIIAEoAVIEbG9uZxIgCgtkZXNjcmlwdGlvbhgJIAEoCVILZGVzY3JpcHRpb24=');
@$core.Deprecated('Use eventRequestDescriptor instead')
const EventRequest$json = const {
  '1': 'EventRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `EventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventRequestDescriptor = $convert.base64Decode('CgxFdmVudFJlcXVlc3QSDgoCaWQYASABKAVSAmlk');
@$core.Deprecated('Use eventResponseDescriptor instead')
const EventResponse$json = const {
  '1': 'EventResponse',
  '2': const [
    const {'1': 'events', '3': 1, '4': 3, '5': 11, '6': '.Event', '10': 'events'},
  ],
};

/// Descriptor for `EventResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventResponseDescriptor = $convert.base64Decode('Cg1FdmVudFJlc3BvbnNlEh4KBmV2ZW50cxgBIAMoCzIGLkV2ZW50UgZldmVudHM=');
