import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // ignore_for_file: unnecessary_new
import 'package:logbook_app/routes/route.dart' as route;
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    theme:
    new ThemeData(primarySwatch: Colors.green);
    debugShowCheckedModeBanner:
    false;
    GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: SfSignaturePad(
              key: _signaturePadKey,
              backgroundColor: Colors.grey[200],
            ),
            height: 200,
            width: 300,
          ),
         
        ],
      ),
    );
  }
}
