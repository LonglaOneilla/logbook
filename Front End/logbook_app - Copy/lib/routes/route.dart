import 'package:flutter/material.dart';

// Define Routes
import 'package:logbook_app/views/student/fill_logbook.dart';
import 'package:logbook_app/views/student/courses.dart';
import 'package:logbook_app/views/student/view_course.dart';
import 'package:logbook_app/views/student/landing_page.dart';
import 'package:logbook_app/views/teachers/landing_page.dart';
import 'package:logbook_app/views/viewlogbook.dart';
import 'package:logbook_app/views/teachers/signlogbook.dart';
import 'package:logbook_app/views/index.dart';

//variable names for routes
const String fill_logbook = 'fill';
const String view_logbook = 'viewBook';
const String sign_logbook = 'sign';
const String courses = 'view courses to fill their logbook contents';
const String view_courses = 'view courses to view their logbook content';
const String new_courses = 'courses';
const String index = 'login';
const String stdLanding = 'student landing page';
const String tLanding = 'teacher\'s landing page';

// Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case fill_logbook:
      return MaterialPageRoute(builder: (context) => LogBookForm());
    case view_logbook:
      return MaterialPageRoute(builder: (context) => ViewLogbook());
    case sign_logbook:
      return MaterialPageRoute(builder: (context) => SignLogbook());
    case courses:
      return MaterialPageRoute(builder: (context) => Courses());
    case view_courses:
      return MaterialPageRoute(builder: (context) => ViewCourses());
    //case new_courses:
    //return MaterialPageRoute(builder: (context) => NewLogbookCourses());
    case index:
      return MaterialPageRoute(builder: (context) => Login());
    case stdLanding:
      return MaterialPageRoute(builder: (context) => Landing());
    case tLanding:
      return MaterialPageRoute(builder: (context) => T_Landing());
    default:
      throw ('This route name does not exist');
  }
}
