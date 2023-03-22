import 'dart:convert';

import 'package:flutix/constants/constant.dart';
import 'package:flutix/utils/app_storage.dart';

class ApiLogModel {
  ApiLogModel({
    required this.url,
    required this.payload,
    this.response = '',
    required this.method,
    DateTime? timestamp,
    this.error = '',
  }) : timestamp = timestamp ?? DateTime.now();

  factory ApiLogModel.fromJson(dynamic source) =>
      ApiLogModel.fromMap(json.decode(source));

  factory ApiLogModel.fromMap(Map<String, dynamic> map) {
    return ApiLogModel(
      url: map['url'],
      payload: map['payload'],
      response: map['response'],
      method: map['method'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
      error: map['error'],
    );
  }

  final String url;
  final String payload;
  final String response;
  final String method;
  final DateTime timestamp;
  final String error;

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'payload': payload,
      'response': response,
      'method': method,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'error': error,
    };
  }

  String toJson() => json.encode(toMap());
}

class ApiLogger {
  Future log({required ApiLogModel data}) async {
    final currentLog = await apiLogs();
    final List<ApiLogModel> newDataLog;
    newDataLog = currentLog.isEmpty || currentLog.length <= 10
        ? currentLog
        : currentLog.sublist(1)
      ..add(data);
    await AppStorage.write(key: CACHE_API_LOG, value: jsonEncode(newDataLog));
  }

  Future<List<ApiLogModel>> apiLogs() async {
    final dataLog = await AppStorage.read(key: CACHE_API_LOG);
    final List data = dataLog.isNotEmpty ? jsonDecode(dataLog) : [];
    return List.from(data.map(ApiLogModel.fromJson));
  }
}
