import 'dart:async';
import 'package:coin_cap/di/app_module.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';

Future _get(String url, { Map<String, dynamic> params }) async {
  var response = await dio.get(url, queryParameters: params);
  return response.data;
}

Observable post(String url, Map<String, dynamic> params) =>
    Observable.fromFuture(_post(url, params)).asBroadcastStream();

Observable get(String url, { Map<String, dynamic> params }) =>
    Observable.fromFuture(_get(url, params: params)).asBroadcastStream();

Future _post(String url, Map<String, dynamic> params) async {
  var response = await dio.post(url, data: params);
  return response.data;
}

class NetworkUtils {
  static Future<Response<T>> get<T>(String path, Map<String, dynamic> parameters) async {
    return await dio.get(path, queryParameters: parameters);
  }
}

