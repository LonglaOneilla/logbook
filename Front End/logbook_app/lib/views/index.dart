//import 'package:date_time_picker/date_time_picker.dart';
import 'dart:convert';

import 'package:logbook_app/routes/route.dart' as route;
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:intl/intl.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:logbook_app/modals/users.dart';

//void main() => runApp(LogbookForm());

class LoginForm extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Logbook Form',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginForm(),
    );
  }
}

class Login extends StatefulWidget {
  //const Login({super.key});

  @override
  LoginState createState() {
    return LoginState();
  }
}

//state class holds data related to the form
class LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String msg = '';
  var session = FlutterSession();

  String _user = "Student";

  var baseUrl = Uri.parse("http://192.168.8.100:8000/login/api");
  void login(String email, String pwd, String priv) async {
    final response = await http.post(baseUrl,
        headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'},
        body: jsonEncode(<String, String>{
          'email': email,
          'password': pwd,
          'type': priv,
        }));

    var data = jsonDecode(response.body);
    print(data);

    print(data['status']);

    if (data['status'] == true) {
      User.saveUser(User.fromJson(data));
      if (priv == 'Student') {
        Navigator.pushReplacementNamed(context, route.stdLanding);
        Fluttertoast.showToast(
            msg: "login successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
      }

      if (priv == 'Teacher') {
        Navigator.pushReplacementNamed(context, route.tLanding);
        Fluttertoast.showToast(
            msg: "login successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
      }
      /*print("data");
     */

  bool isLogin = false;
  String text = "";
  _getSession() async {
    isLogin = await FlutterSession().get("isLogin");
    setState(() {
      text = isLogin.toString();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSession();
    print("session == " + isLogin.toString());
  }

    } else {
      this.msg = "Email or password incorrect";
    }

  }


  @override
  Widget build(BuildContext context) {
    //the form widget will be built using the form key created above

    final email = TextField(
      obscureText: false,
      controller: emailController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter your email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
      keyboardType: TextInputType.emailAddress,
    );

    final password = TextField(
      obscureText: false,
      controller: passwordController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter your password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
      keyboardType: TextInputType.visiblePassword,
    );

    final role = Column(
      children: [
        ListTile(
          title: const Text('Student'),
          leading: Radio<String>(
            value: 'Student',
            groupValue: _user,
            onChanged: (String? value) {
              setState(() {
                _user = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Teacher'),
          leading: Radio<String>(
            value: "Teacher",
            groupValue: _user,
            onChanged: (String? value) {
              setState(() {
                _user = value!;
              });
            },
          ),
        ),
      ],
    );

    final submitBtn = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
        onPressed: () {
          SignIn signIn = SignIn.name();
          signIn.email = emailController.text;
          signIn.password = passwordController.text;
          //signIn.privilege = _user as String;

          login(signIn.email, signIn.password, _user);
          //call method that saves data in database.
          //showAlertDialog(context,logbook);
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("MyClassroom"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(36.0, 10.0, 36.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login", style: TextStyle(color: Colors.green)),
                  
                  SizedBox(height: 25.0),
                  email,
                  SizedBox(height: 25.0),
                  password,
                  SizedBox(height: 25.0),
                  role,
                  SizedBox(height: 25.0),
                  Text(
                    this.msg,
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    height: 55.0,
                  ),
                  submitBtn,
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  _setSession() async {
    await session.set("isLogin", true);
    
  }
}

Future<http.Response> user(String email, String password, String privilege) {
  return http.post(
    Uri.parse("http://192.168.8.103:8000/login/api"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
      'type': privilege
    }),
  );
}

//modal class

class SignIn {
  late String email;
  late String password;

  late String privilege;

  SignIn(
      {required this.email, required this.password, required this.privilege});

  factory SignIn.fromJson(Map<String, dynamic> json) {
    return SignIn(
      email: json['email'],
      password: json['password'],
      privilege: json['privilege'],
    );
  }
  SignIn.name();
}
