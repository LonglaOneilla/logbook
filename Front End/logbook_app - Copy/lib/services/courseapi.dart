import 'api.dart';
import 'package:logbook_app/modals/course.dart';
import 'dart:convert';

class CourseService{
  static String url = '/student';

static Future<List<Course>> getStudent(var email) async {
    var res = await Network().auth(email, url);
    var body = json.decode(res.body);
    final response = await Network().getData(url);
    List<Course> list = parseUser(response.body);
    return list;
  }
  
  static List<Course> parseUser(String responseBody) => [Course.fromJson(json.decode(responseBody))];

  //static List<Course> parseResponse(String responseBody) {
    //final parsed = json.decode(responseBody).cast<Map< String, dynamic>>();
    //return parsed.map<Course>((json) => Course.fromJson(json)).toList();
  //}

}
//var baseUrl = Uri.parse("192.168.8.100:8000/login/api");