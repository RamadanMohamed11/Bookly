import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "https://www.googleapis.com/books/v1/";

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await Dio().get(_baseUrl + endPoint);
    return response.data;
  }
}
