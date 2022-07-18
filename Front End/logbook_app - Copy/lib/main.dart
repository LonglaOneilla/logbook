import 'package:flutter/material.dart';
//import 'package:logbook_app/views/index.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:logbook_app/routes/route.dart' as route;
//import 'package:logbook_app/views/teachers/landing_page.dart';
//import 'package:logbook_app/views/student/landing_page.dart';

void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 /* @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: CheckAuth(),
      darkTheme: ThemeData(
          brightness: Brightness.dark, accentColor: Colors.blueAccent),
      themeMode: ThemeMode.dark,
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  bool isAdmin = true;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');

    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  void _isLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isAdmin', true);

    var res = prefs.getBool('isAdmin');

    if (isAdmin != null) {
      setState(() {
        isAdmin = res;
      });
    }
  }

  /* Future isLogged(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setBool('isAdmin', true);
  
  String isAdmin = prefs.getBool('isAdmin') as String;
  var route;
    if (isAdmin==true) {
      /// If the user is an admin
      Navigator.pushReplacementNamed(context, route.stdLanding);
    } else {
      /// If the user is not an admin
      route = Navigator.pushReplacementNamed(context, route.tLanding);
    }

    return route;
}*/

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (isAuth) {
      if (isAdmin) {
        child = T_Landing();
      } else {
        child = LandingPage();
      }
    } else {
      child = LoginForm();
    }

    return Scaffold(
      body: child,
    );
  }
}

// This widget is the root of your application.
*/
///*
@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primarySwatch: Colors.green,
    ),
    onGenerateRoute: route.controller,
    initialRoute: route.index,
    debugShowCheckedModeBanner: false,
  );
}}//*/
