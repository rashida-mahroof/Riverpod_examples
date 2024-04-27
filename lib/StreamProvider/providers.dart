import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final webSocketProvider = Provider.family<WebSocketChannel,String>((ref,coin) {
  final webSocket =  IOWebSocketChannel.connect('wss://ws.coincap.io/prices?assets=$coin');
  return webSocket;
});

final bitcoinPriceProvider = StreamProvider.family<Map<String,double>,String>((ref,coin) {
  final webSocket = ref.watch(webSocketProvider(coin));
  return webSocket.stream.map((event) {
    final Map<String,dynamic> data =json.decode(event);
   
    return data.map((key, value) => MapEntry(key, double.parse(value.toString())));
  });
});