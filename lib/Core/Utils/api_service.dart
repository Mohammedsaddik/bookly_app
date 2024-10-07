import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint,int limit = 20}) async {
    var response = await _dio.get('$_baseUrl$endPoint',queryParameters: {'limit': limit},);
    return response.data;
  }
}
