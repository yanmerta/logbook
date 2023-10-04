import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyAuth with ChangeNotifier {
  String _idToken = '';
  String userId = '';
  DateTime _expiryDate = DateTime.now();

  String _tempidToken = '';
  String tempuserId = '';
  DateTime _tempexpiryDate = DateTime.now();

  void tempData() {
    _idToken = _tempidToken;
    userId = tempuserId;
    _expiryDate = _tempexpiryDate;
    notifyListeners();
  }

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_idToken != '' && _expiryDate.isAfter(DateTime.now())) {
      return _idToken;
    } else {
      return null;
    }
  }

  Future<void> signup(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDdF9Jxf5nPDkQdt7gv50X6EaGB240faWE");

    try {
      var response = await http.post(
        url,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );

      var responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw Exception(responseData['error']["message"]);
      }

      _tempidToken = responseData["idToken"];
      tempuserId = responseData["localId"];
      _tempexpiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData["expiresIn"]),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> login(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDdF9Jxf5nPDkQdt7gv50X6EaGB240faWE");

    try {
      var response = await http.post(
        url,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );

      var responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw Exception(responseData['error']["message"]);
      }
      _tempidToken = responseData["idToken"];
      tempuserId = responseData["localId"];
      _tempexpiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData["expiresIn"]),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
