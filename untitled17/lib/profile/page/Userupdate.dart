import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String baseUrl = "http://localhost:3000/update/Username1";


Future<Userprofile> update(String email ,String about) async {
final http.Response response = await http.post(
	Uri.parse(baseUrl),

	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, String>{
	'email': email,
  'about':about,

	}),
);
// parsing JSOn or throwing an exception
if (response.statusCode == 200) {
	return Userprofile.fromJson(json.decode(response.body));
} else {
	throw Exception('Failed to update album.');
}
}


class Userprofile {
final String email;
final String about;
Userprofile ({required this.email , required this.about});

factory Userprofile .fromJson(Map<String, dynamic> json) {
	return Userprofile (
	email: json['email'],
  about: json['about'],
	);
}

}
