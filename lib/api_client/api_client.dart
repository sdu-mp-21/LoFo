
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lofo_app/model/record.dart';
import 'package:http/http.dart' as http;

class ApiClient{

  Future<List<Record>> getPost() async {
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/54a0122c-3992-4f0f-bbdc-2933f2b3d110'));

    if (response.statusCode == 200) {
      print(response);
      final records = Records.fromJson(jsonDecode(response.body)).records;
      print(records);
      return records;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}