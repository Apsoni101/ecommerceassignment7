import 'package:dio/dio.dart';
import 'network_constants.dart';

class NetworkService {
  final Dio dio;

  NetworkService({Dio? dio})
      : dio = dio ??
      Dio(BaseOptions(
        baseUrl: NetworkConstants.baseUrl,
        connectTimeout: NetworkConstants.connectTimeout,
        receiveTimeout: NetworkConstants.receiveTimeout,
      )) {
    this.dio.interceptors.add(LogInterceptor(responseBody: true, error: true));
  }
}
