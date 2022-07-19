// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logbook_app/views/student/fill_logbook.dart';
import 'package:logbook_app/modals/course.dart';
import 'package:logbook_app/routes/route.dart' as route;
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/api.dart';
import '../../services/courseapi.dart';
import '../index.dart';

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Logbook",
        theme: new ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        home: const Courses());
  }
}

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  //get title => null;

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
// This widget is the root
// of your application.

  String email = '';
  List<Course> _course = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _getStudent();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if (user != null) {
      setState(() {
        email = user['email'];
      });
    }
  }

//print email
  _getStudent() {
    CourseService.getStudent(email).then((course) {
      if (mounted) {
        setState(() {
          _course = course;
        });
      }
    });
    print(_course);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xff151515),
      appBar: AppBar(
        title: const Text("Courses"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.power_settings_new),
            onPressed: () {
              logout();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Row(
                children: [
                  const Text(
                    'Hello, ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Students Data",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              courses(),
            ],
          ),
        ),
      ),
    );
  }

  Table courses() {
    return Table(
      border: const TableBorder(
        horizontalInside: BorderSide(
          width: 1,
          color: Colors.grey,
        ),
      ),
      children: [
        const TableRow(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "COURSE NAME",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ]),
        for (Course course in _course)
          TableRow(children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Text(
                  "${course.title}",
                ),
                
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogBookForm()));
              },
            ),
          ]),
      ],
    );
  }

  void logout() async {
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}

/*List<String> litems = [
  "DATA MINING",
  "COMPILER DESIGN",
  "MOBILE APPLICATION DEVELOPMENT",
  "DATABASE"
];

class ViewCourses extends StatelessWidget {
  const ViewCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
          itemCount: litems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(
                  Icons.view_array_rounded,
                  color: Colors.red,
                  size: 26,
                ),
                onTap: () {
                  Navigator.pushNamed(context, route.view_logbook);
                },
                hoverColor: Colors.blueGrey,
                title: Text(litems[index]));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}*/
