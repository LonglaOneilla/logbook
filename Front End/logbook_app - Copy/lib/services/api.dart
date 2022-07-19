import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network{

  var baseUrl = "http://192.168.8.100:8000";

  var token;

  _getToken() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'));//['token'];
    //print(token);

    return token;
  }

  auth(data, apiURL) async{
    var fullUrl = baseUrl + apiURL;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders()
    );
  }

  getData(apiURL) async{
    var fullUrl = baseUrl + apiURL;
    await _getToken();
    return await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
}