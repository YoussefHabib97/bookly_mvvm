import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://www.googleapis.com/books/v1/';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');

    return response.data;
  }
}
