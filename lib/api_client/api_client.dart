import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lofo_app/model/record.dart';
import 'package:http/http.dart' as http;

class ApiClient{
  static const String _host = "http://127.0.0.1:8000";

  String getHost() {
    return _host;
  }

  Future<String> authenticate(String email, String name, String password) async {
    var result = "";
    try {
      var response = await Dio().post(
        '$_host/api/users',
        data: {
          'email': email,
          'name': name,
          'password': password,
        },
      );
      print(response.data);
      result = response.data['TOKEN'];
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString(_key_access_token, result);
    } on DioError catch (e) {
      if(e.message.substring(e.message.length - 4, e.message.length - 1) == '400'){
        print('error 400');
        return '400';
      }
    } catch (e, s) {
      print('error is $e s is $s');
    }
    return result;
  }

  Future<String> login(String email, String password) async {
    var result = "";
    try {
      var response = await Dio().post(
        '$_host/api/users',
        data: {
          'email': email,
          'password': password,
        },
      );
      print(response.data);
      result = response.data['TOKEN'];
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString(_key_access_token, result);
    } on DioError catch (e) {
      if(e.message.substring(e.message.length - 4, e.message.length - 1) == '400'){
        print('error 400');
        return '400';
      }
    } catch (e, s) {
      print('error is $e s is $s');
    }
    return result;
  }




  Future<List<Record>> getPost() async {
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/14c6185c-a7b7-4778-b483-e04c167c28b9'));

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
