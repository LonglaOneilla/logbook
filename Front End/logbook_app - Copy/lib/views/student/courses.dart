import 'package:flutter/material.dart';
import 'package:intl/intl.dart';// ignore_for_file: unnecessary_new
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
        home: const Courses());
  }
}

List<String> litems = [
  "DATA MINING",
  "COMPILER DESIGN",
  "MOBILE APPLICATION DEVELOPMENT",
  "DATABASE"
];

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);

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
                
                onTap: (){Navigator.pushNamed(context, route.fill_logbook);},
                hoverColor: Colors.blueGrey,
                title: Text(litems[index]));
          }),
      floatingActionButton:  FloatingActionButton(onPressed: () {  },
        child: const Icon(Icons.add),),
    );
  }
}
