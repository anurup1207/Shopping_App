import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  late String _token;
  late String _userId;
  late DateTime _expiryDate;

  Future<void> signUp(String? email, String? password) async {
    const url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDB6mqYcIGtSyJRP7_uuEZl3ze5eoufSfI";
    final response = await http.post(Uri.parse(url),
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));

    print(json.decode(response.body));
  }

  Future<void> logIn(String? email, String? password) async {
    const url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDB6mqYcIGtSyJRP7_uuEZl3ze5eoufSfI";
    final response = await http.post(Uri.parse(url),
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    print(json.decode(response.body));
  }
}
