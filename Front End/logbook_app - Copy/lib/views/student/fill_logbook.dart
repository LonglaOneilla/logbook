import 'package:date_time_picker/date_time_picker.dart';
import 'package:logbook_app/routes/route.dart' as route;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logbook_app/modals/Logbook.dart';

//void main() => runApp(LogbookForm());

class LogbookForm extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Logbook Form',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LogBookForm(),
    );
  }
}

class LogBookForm extends StatefulWidget {
  //const LogBookForm({super.key});

  @override
  LogBookFormState createState() {
    return LogBookFormState();
  }
}

//state class holds data related to the form
class LogBookFormState extends State<LogBookForm> {
  //the key below is a global key uniquely identifying the
  // form widget
  //final _formKey = GlobalKey<FormState>();
  final courseDateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final hoursController = TextEditingController();
  final detailsController = TextEditingController();

  String _valueChanged4 = '';
  String _valueToValidate4 = '';
  String _valueSaved4 = '';

  @override
  Widget build(BuildContext context) {
    //the form widget will be built using the form key created above
    final courseDate = TextField(
      controller: courseDateController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          //hintText: "Email Here",
          labelText: "Select Date",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1990),
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          print(pickedDate);
          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          print(formattedDate);

          setState(() {
            courseDateController.text = formattedDate;
          });
        } else {
          print(DateTime.now());
        }
      },
    );

//start time input label

    final startTime = DateTimePicker(
      type: DateTimePickerType.time,
      //timePickerEntryModeInput: true,
      //controller: _controller4,
      initialValue: '', //_initialValue,
      //icon: Icon(Icons.access_time),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          //hintText: "Email Here",
          labelText: "Select Start Time",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),

      timeLabelText: "Time",
      use24HourFormat: true,
      locale: const Locale('pt', 'BR'),
      onChanged: (val) => setState(() {
        _valueChanged4 = val;
        startTimeController.text = val;
      }),
      validator: (val) {
        setState(() {
          _valueToValidate4 = val ?? '';
          startTimeController.text = val!;
        });
        return null;
      },
      onSaved: (val) => setState(() {
        _valueSaved4 = val ?? '';
        startTimeController.text = val!;
      }),
    );

    final endTime =  DateTimePicker(
      type: DateTimePickerType.time,
      //timePickerEntryModeInput: true,
      //controller: _controller4,
      initialValue: '', //_initialValue,
      //icon: Icon(Icons.access_time),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          //hintText: "Email Here",
          labelText: "Select Start Time",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),

      timeLabelText: "Time",
      use24HourFormat: true,
      locale: const Locale('pt', 'BR'),
      onChanged: (val) => setState(() {
        _valueChanged4 = val;
        endTimeController.text = val;
      }),
      validator: (val) {
        setState(() {
          _valueToValidate4 = val ?? '';
          endTimeController.text = val!;
        });
        return null;
      },
      onSaved: (val) => setState(() {
        _valueSaved4 = val ?? '';
        endTimeController.text = val!;
      }),
    );

    final hours = TextField(
      obscureText: false,
      controller: hoursController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter Number of Hours",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),

      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );

    final details = TextField(
      obscureText: false,
      controller: detailsController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Content",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      minLines: 5,
      maxLines: 30,
    );

    final submitBtn = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
        onPressed: () {
          Logbook logbook = Logbook.name();
          logbook.date = courseDateController.text;
          logbook.startTime = startTimeController.text;
          logbook.endTime = endTimeController.text;
          logbook.detail = detailsController.text;
          //call method that saves data in database.
          //showAlertDialog(context,logbook);
          Fluttertoast.showToast(
              msg: "content has been sent for signature",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.grey,
              //textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pushNamed(context, route.stdLanding);
        },
        child: Text(
          "Submit",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Fill Logbook"),
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
              padding: const EdgeInsets.fromLTRB(36.0,20.0,36.0,36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Logbook form", style: TextStyle(color: Colors.green)),
                  SizedBox(height: 30.0),
                  courseDate,
                  SizedBox(height: 25.0),
                  startTime,
                  SizedBox(height: 25.0),
                  endTime,
                  SizedBox(height: 25.0),
                  hours,
                  SizedBox(height: 25.0),
                  details,
                  SizedBox(
                    height: 65.0,
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

