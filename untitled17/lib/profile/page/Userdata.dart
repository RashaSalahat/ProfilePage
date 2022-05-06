import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class User {
  String baseUrl = "http://localhost:3000/getall/Username1";
  Future<List> getAllUsers() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      
      print(response);
      if (response.statusCode == 200) {
        final json = "[" + response.body + "]";
        return jsonDecode(json);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
