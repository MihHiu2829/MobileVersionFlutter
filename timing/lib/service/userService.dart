import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UseService {
  User? _user;

  final url = 'http://localhost:8080/api/user/loginUser';
  final url1 = 'http://localhost:8080/user/signUp';
  final url2 = 'http://localhost:8080/user/forgotPassword';

  Future<int> loginUser(
      {required String username, required String password}) async {
    http.Client httpClient = http.Client();
    final response = await httpClient.post(Uri.parse(url),
        headers: {"Content-type": "application/json"},
        body: jsonEncode({'account': username, 'password': password}));

    // var daataa = jsonDecode(response.body) as Map;
    // var dataBOO = daataa['data'];
    // User userData = dataBOO;
    print(response) ;  
    return response.statusCode;
  }

  Future<User?> getDataUser(
      // su dung de lay data tu BE
      {required String username,
      required String password}) async {
    return Future.delayed(Duration(microseconds: 300), () {
      var data = loginUser(username: username, password: password);
    });
  }

  Future<dynamic> signUpAccount(
      {required String username,
      required String password,
      required String number,
      required String dateSignUp,
      required String name}) async {
    http.Client httpClient = http.Client();
    final response = await httpClient.post(Uri.parse(url1),
        headers: {"Content-type": "application/json"},
        body: jsonEncode({
          'account': username,
          'password': password,
          'number': number,
          'dateSignUp': dateSignUp,
          'name': name,
        }));
      // response.sta 
    return response;
  }

  Future<dynamic> forgotPassword(
      {required String username, required String number}) async {
    http.Client httpClient = http.Client();
    final response = await httpClient.post(Uri.parse(url2),
        headers: {"Content-type": "application/json"},
        body: jsonEncode({'username': username, 'number': number}));

    return;   
  }
}
