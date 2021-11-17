
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lofo_app/model/record.dart';
import 'package:http/http.dart' as http;

class ApiClient{

  Future<List<Record>> getPost() async {
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/74dccdaa-8545-43f6-8cc1-8805ca93f465'));

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
