import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

class Controller {
  static Map<String, String> requestHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };
  }

  // Checking the internet connection
  static Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('Internet connected');
        return true;
      }
    } on SocketException catch (_) {
      print('Internet not connected');
      return false;
    }

    return false;
  }

  // Ecncoding String
  static String encodeString(String string) {
    return base64.encode(utf8.encode(string));
  }

  static String decodeString(String encodedString) {
    return utf8.decode(base64.decode(encodedString));
  }
}
