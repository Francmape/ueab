import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../helpers/controller.dart';
import '../helpers/constants.dart';
import '../../models/custom_exception.dart';

class AuthProvider with ChangeNotifier {
  String? _userName;
  String? _userEmail;
  String? _msisdn;
  String? _userId;
  String? _location;
  String? _token;
  bool _isUserNew = true;

  bool get isAuth {
    print('CHECKING AUTH >>> \n isAuth:${[
      _token != null ? true : false
    ]} \n token: $_token');
    return _token != null;
  }

  String? get getToken {
    print('FETCHING TOKEN >> \n isAuth:${[
      _token != null ? true : false
    ]} \n token: $_token');

    if (_token != null) {
      return _token;
    }
    return null;
  }

  String? get getUserId => _userId;
  String? get getUserName => _userName;
  String? get getUserEmail => _userEmail;
  bool get getisUserNew => _isUserNew;
  String? get getLocation => _location;
  String? get getPhone => _msisdn;

  void _saveState(Map<String, dynamic> data) async {
    print('=== Saving State Provider');
    print(data);
    _userName = '${data['surname']} ${data['fullNames']}';
    _userEmail = data['emailAddress'];
    _msisdn = data['MSISDN'];
    _userId = data['IDNumber'];
    _token = data['token'];

    notifyListeners();
    _saveToSharedPref();
  }

   void _saveToSharedPref() async {
    //Saving User preferences
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      'userId': _userId,
      'userEmail': _userEmail,
      'userName': _userName,
      'token': _token,
      'isNewUser': false,
      'isLoggedIn': true,
      'phone': _msisdn,
    });
    prefs.setString(appSharedPreferenceName, userData);
  }

  Future<void> _checkInternetConnection() async {
    if (await Controller.checkInternetConnection() == false) {
      throw (CustomException('No Internet Connection'));
    }
  }

  Future<void> signup(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phone}) async {
    Uri url = Uri.parse('$apiBaseURL/worker/signup');
    await _checkInternetConnection();
    print('>>> SIGN UP');
    print(url);

    try {
      final response = await http.post(
        url,
        headers: Controller.requestHeaders(_token!),
        body: json.encode(
          {
            "country_code": "KE",
            "first_name": firstName,
            "last_name": lastName,
            "phone_num": phone,
          },
        ),
      );

      print('HTTP CODE ${response.statusCode}');
      print('>>> RESPONSE: \n ${response.body}');
      final responseData = json.decode(response.body);

      if (response.statusCode != 200) throw responseData['error'];

      _userId = responseData['worker_id'];
      _userName = "${responseData['first_name']} ${responseData['last_name']} ";
      _msisdn = responseData['phone_num'];

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'userId': _userId,
        'userName': _userName,
        'isNewUser': false,
        'phone': _msisdn,
        'location': _location,
      });
      prefs.setString(appSharedPreferenceName, userData);

      notifyListeners();
    } catch (error) {
      print('>> SYSTEM_ERROR : $error');
      throw error;
    }
  }

  Future<void> validateOTP(String code) async {
    Uri url = Uri.parse('$apiBaseURL/worker/activate');
    await _checkInternetConnection();
    print('>>> VALIDATE OTP');
    print(url);

    try {
      final response = await http.post(
        url,
        headers: Controller.requestHeaders(_token!),
        body: json.encode(
          {
            "otp": code,
          },
        ),
      );
      print('>>> RESPONSE: \n ${response.body}');
      final responseData = json.decode(response.body);

      if (response.statusCode != 200) throw responseData['error'];
      _token = responseData['token'];
      final prefs = await SharedPreferences.getInstance();

      final userData = json.encode({
        'userId': _userId,
        'userName': _userName,
        'isNewUser': false,
        'phone': _msisdn,
        'location': _location,
        'token': _token,
      });
      prefs.setString(appSharedPreferenceName, userData);
    } catch (error) {
      print('>> SYSTEM_ERROR : $error');
      throw error;
    }
  }

  Future<void> forgotPassword(String email) async {
    Uri url = Uri.parse('$apiBaseURL/api/authentication/request_code');

    print('AUTH PROVIDER REQUEST CODE: \n $url');
    print(email);

    try {
      final response = await http.post(
        url,
        headers: Controller.requestHeaders(_token!),
        body: json.encode(
          {
            'email': email,
          },
        ),
      );
      print('>>> RESPONSE: \n ${response.body}');
      final responseData = json.decode(response.body);

      if (responseData['status'] == 'failed') {
        throw CustomException(responseData['message']);
      }
    } catch (error) {
      print('>> SYSTEM_ERROR : $error');
      throw error;
    }
  }

  Future<void> resetPassword(String code, String email, String password) async {
    Uri url = Uri.parse('$apiBaseURL/api/account/reset_password');
    await _checkInternetConnection();

    try {
      final response = await http.put(
        url,
        headers: Controller.requestHeaders(_token!),
        body: json.encode(
          {
            'code': code,
            'email': email,
            'password': password,
          },
        ),
      );
      print('>>> RESPONSE: \n ${response.body}');
      final responseData = json.decode(response.body);

      if (response.statusCode != 200) throw responseData['data']['error'];
    } catch (error) {
      print('>> SYSTEM_ERROR : $error');
      throw error;
    }
  }

  Future<void> changePassword(String old_password, String new_password) async {
    Uri url = Uri.parse('$apiBaseURL/api/account/change_password');
    await _checkInternetConnection();

    try {
      final response = await http.post(
        url,
        headers: Controller.requestHeaders(_token!),
        body: json.encode(
          {
            'old_password': old_password,
            'new_password': new_password,
          },
        ),
      );
      print('>>> RESPONSE: \n ${response.body}');
      final responseData = json.decode(response.body);

      if (response.statusCode != 200) throw responseData['data']['error'];
    } catch (error) {
      print('>> SYSTEM_ERROR : $error');
      throw error;
    }
  }

  Future<int> login({
    required String username,
    required String password,
  }) async {
    Uri url = Uri.parse('$apiBaseURL/login');
    await _checkInternetConnection();
    print('>>> LOGIN');
    print(url);

    try {
      final response = await http.post(
        url,
        headers: Controller.requestHeaders(_token ?? ''),
        body: json.encode(
          {
            "username": username,
            "password": password,
          },
        ),
      );
      print('>>> RESPONSE: \n ${response.body}');

      final responseData = json.decode(response.body);
      print(response.statusCode);

      //signup needed
      if (response.statusCode != 200) return response.statusCode;

      _token = responseData['token'];

      //Saving User preferences
      _saveToSharedPref();
      notifyListeners();
      return response.statusCode;
    } catch (error) {
      print('>> SYSTEM_ERROR : $error');
      throw error;
    }
  }

  Future<void> logout() async {
    _userId = null;
    _userEmail = null;
    _userName = null;
    _token = null;

    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(appSharedPreferenceName); //Just removes this key
    // prefs.clear(); // wipes out
  }

  Future<bool> checkNewUser() async {
    print('>>> CHECK IF NEW USER');
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey(appSharedPreferenceName)) {
      print('Preference not found');
      return true;
    }
    var string = prefs.getString(appSharedPreferenceName);
    final extractedUserData = json.decode(string!) as Map<String, dynamic>;
    print(extractedUserData);

    if (extractedUserData == null) {
      print('Preference is null');
      return true;
    }

    _saveState(extractedUserData);
    return false;
  }

  Future<bool> isUserLoggedIn() async {
    print('>>> CHECK IF NEW USER');
    final prefs = await SharedPreferences.getInstance();

    var string = prefs.getString(appSharedPreferenceName);
    final extractedUserData = json.decode(string!) as Map<String, dynamic>;
    print(extractedUserData);
    if (extractedUserData['isLoggedIn'] == true) {
      print('User is Logged in');
      _saveState(extractedUserData);
      return true;
    }

    print('User is Logged out');
    return false;
  }
}
