import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // ignore_for_file: unnecessary_new
import 'package:logbook_app/routes/route.dart' as route;
import 'package:flutter/material.dart';

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Logbook",
        theme: new ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        home: const T_Landing());
  }
}


class T_Landing extends StatelessWidget {
  const T_Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Courses"),
          
        ),
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
                              title: const Text('SIGN LOGBOOK',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, route.sign_logbook);
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
