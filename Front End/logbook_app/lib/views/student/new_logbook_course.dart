//import 'package:date_time_picker/date_time_picker.dart';
import 'package:logbook_app/routes/route.dart' as route;
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:logbook_app/modals/Logbook.dart';

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

enum Role { Student, Teacher }

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() {
    return LoginState();
  }
}

//state class holds data related to the form
class LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Role? _user = Role.Student;

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
          leading: Radio<Role>(
            value: Role.Student,
            groupValue: _user,
            onChanged: (Role? value) {
              setState(() {
                _user = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Teacher'),
          leading: Radio<Role>(
            value: Role.Teacher,
            groupValue: _user,
            onChanged: (Role? value) {
              setState(() {
                _user = value;
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
          SignIn signIn = SignIn();
          signIn.email = emailController.text;
          signIn.password = passwordController.text;
          //call method that saves data in database.
          //showAlertDialog(context,logbook);
          
          if (_user == Role.Student) {
            Navigator.pushNamed(context, route.courses);
            Fluttertoast.showToast(
              msg: "login successful",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              //backgroundColor: Colors.red,
              //textColor: Colors.white,
              fontSize: 16.0);
          }
          else if (_user == Role.Teacher) {
            Navigator.pushNamed(context, route.sign_logbook);
            Fluttertoast.showToast(
              msg: "login successful",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              //backgroundColor: Colors.red,
              //textColor: Colors.white,
              fontSize: 16.0);
          } else {
            Fluttertoast.showToast(
              msg: "chose a role",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              //backgroundColor: Colors.red,
              //textColor: Colors.white,
              fontSize: 16.0);
          }
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
}

//modal class

class SignIn {
  late String email;
  late String password;

  late String privilege;

  SignIn();
}
