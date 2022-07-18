import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // ignore_for_file: unnecessary_new
import 'package:logbook_app/routes/route.dart' as route;
import 'package:flutter/material.dart';
import 'package:logbook_app/modals/users.dart';
import 'package:logbook_app/views/index.dart';

//void main() => runApp(MyApp());

class LandingPage extends StatelessWidget {
// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Logbook",
        theme: new ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        home: LandingPage());
  }
}


class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);
  
  @override
  LandingState createState() {
    return LandingState();
  }
}

class LandingState extends State<Landing>{
bool visible = true, login=false;
isconnected()async{
  await User.getUser();
  if(User.sessionUser==null){
    setState(() {
      login=true;
    });
  }else{
    setState((){
      login=false;
    });
  }
  toggle(){
    setState(() {
      visible=visible;
    });
  }
  islogin(){
    setState(() {
      login:login;
    });
  }
}

@override
void initState(){
  super.initState();
  isconnected();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(46.0, 0.0, 36.0, 0.0),
                child: Column(
                  children: [
                    Center(
                      child: Card(
                        elevation: 5,
                        child: Padding(
                            padding: EdgeInsets.all(25),
                            child: ListTile(
                              title: const Text('FILL LOGBOOK',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, route.courses);
                                    
                              },
                              hoverColor: Colors.blueGrey,
                            )),
                      ),
                    ),
                    SizedBox(
                      //Use of SizedBox
                      height: 30,
                    ),
                    Center(
                      child: Card(
                         //Colors.greenAccent,
                        elevation: 5,
                        child: Padding(
                            padding: EdgeInsets.all(25),
                            
                            child: ListTile(
                              
                              title: const Text('VIEW LOGBOOK', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, route.view_courses);
                              },
                              hoverColor: Colors.blueGrey,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
