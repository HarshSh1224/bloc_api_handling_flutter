import 'package:dio/dio.dart';

class Api {
  final Dio _dio = Dio();

  Api(){
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com/";
    // _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
}