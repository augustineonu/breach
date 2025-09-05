import 'dart:convert';
import 'package:breach/core/constants/api_endpoints.dart';
import 'package:breach/features/home/data/models/stream_model,dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:get/get.dart';

class WebSocketService extends GetxService {
  WebSocketChannel? _channel;

  // Reactive list of streams
  var streams = <StreamModel>[].obs;

  void connect(String token) {
    final url = '${ApiEndpoints.websocketUrl}$token';
    _channel = WebSocketChannel.connect(Uri.parse(url));

   _channel!.stream.listen(
  (message) {
    try {
      final data = json.decode(message);
      final stream = StreamModel.fromJson(data);
      streams.add(stream);
    } catch (e) {
      debugPrint("WebSocket decode error: $e");
    }
  },
);

  }

  void disconnect() {
    _channel?.sink.close();
  }
}
