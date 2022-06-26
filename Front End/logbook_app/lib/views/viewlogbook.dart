// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:logbook_app/modals/Logbook.dart';

//void main() => runApp(MyApp());

class viewLogbook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOGBOOK',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ViewLogbook(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Logbook {
  Logbook({
    required this.courseId,
    required this.content,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.hours,
  });

  //Logbook();

  int courseId;
  String content;
  String date;
  String startTime;
  String endTime;
  String hours;
}

String courseName = 'DATA MINING';
String teacherName = 'MR FOMAZOU TCHINDA';
String semester = '1';


class ViewLogbook extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViewLogbookState();
  }
}

class ViewLogbookState extends State<ViewLogbook> {
  List<Logbook> _items = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _items = _generateItems();
    });
  }
  //Logbook logbook = Logbook.name();


  List<Logbook> _generateItems() {
    return List.generate(5, (int index) {
      return Logbook(
        courseId: index,
        content: "logbook content here",
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
        title: const Text('Logbook Content'),
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
          ]),
        ),
      ),
    );
  }
}
