// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logbook_app/routes/route.dart' as route;


//void main() => runApp(MyApp());

class signlogbook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOGBOOK CONTENT',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SignLogbook(),
      debugShowCheckedModeBanner: false,
    );
  }
}

String courseName = 'DATA MINING';
String teacherName = 'MR FOMAZOU TCHINDA';
String semester = '1';

class Logbook {
  Logbook({
    required this.courseId,
    required this.content,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.hours,
  });

  int courseId;
  String content;
  String date;
  String startTime;
  String endTime;
  String hours;
}

class SignLogbook extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignLogbookState();
  }
}

class SignLogbookState extends State<SignLogbook> {
  List<Logbook> _items = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _items = _generateItems();
    });
  }

  List<Logbook> _generateItems() {
    return List.generate(1, (int index) {
      return Logbook(
        courseId: index,
        content: 'Details of what was taught during the day',
        date: 'date',
        startTime: 'start time',
        endTime: 'end time',
        hours: '4',
      );
    });
  }

  TableRow _buildTableRow(Logbook item) {
    return TableRow(
        key: ValueKey(item.courseId),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.bottom,
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text('${item.date} \n${item.startTime} - ${item.endTime}'),
                )),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(item.content),
            ),
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                item.hours,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Logbook'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 24.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'COURSE: $courseName',
                      //textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'SEMESTER: $semester ',
                      //textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'LECTURER: $teacherName',
                      //textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Table(
              // border: TableBorder(
              //     bottom: BorderSide(color: Colors.red, width: 2),
              //     horizontalInside: BorderSide(color: Colors.red, width: 2),
              // ),
              // border: TableBorder.all(color: Colors.red, width: 2),
              border: TableBorder.symmetric(
                inside: const BorderSide(color: Colors.black, width: 0.8),
                outside: const BorderSide(color: Colors.black, width: 0.8),
              ),

              defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
              defaultColumnWidth: const IntrinsicColumnWidth(),
              columnWidths: const <int, TableColumnWidth>{
                0: const FlexColumnWidth(3),
                1: MaxColumnWidth(
                    FlexColumnWidth(15), FractionColumnWidth(0.5)),
                2: const FlexColumnWidth(2),
              },

              // textDirection: TextDirection.rtl,
              textBaseline: TextBaseline
                  .alphabetic, // Pass this argument when using [TableCellVerticalAlignment.fill]
              children: [
                const TableRow(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              'DATE/TIME',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'ACTIVITIES(CLASSES, EVALUATIONS, PRACTICALS,... )',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'HOURS',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ]),
                ...(_items.map((item) => _buildTableRow(item)).toList())
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 120, 10, 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        minWidth: 80,
                        elevation: 5.0,
                        // borderRadius: BorderRadius.circular(20.0),
                        color: Colors.green,
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg: "The content will be sent back for editing",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              //backgroundColor: Colors.red,
                              textColor: Colors.red,
                              fontSize: 16.0);

                          Navigator.pop(context);
                        },
                        child: const Text(
                          'REJECT',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        elevation: 5.0,
                        // borderRadius: BorderRadius.circular(20.0),
                        color: Colors.green,
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg: "successfully signed logbook",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              //backgroundColor: Colors.red,
                              //textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.pushNamed(context, route.view_logbook);
                          // Navigator.pop(context);
                        },
                        child: const Text(
                          'SIGN LOGBOOK',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
