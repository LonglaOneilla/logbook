class Logbook {
  late String startTime;
  late String endTime;
  late String hour;
  late String detail;
  late String date;
  late String status = "pending";

  Logbook({required this.date, required this.endTime, required this.hour, required this.startTime, required this.detail, required this.status});

  Logbook.name();

  String calc_hour(){

    int value;
    value = (int.parse(this.endTime) - int.parse(this.startTime));
    int val = (value/100) as int;
    this.hour=(val) as String;

    return this.hour;
  }

  factory Logbook.fromJson(Map<String, dynamic> json){
    return Logbook(
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      hour: json['hour'],
      detail: json['detail'],
      status: json['status'],
    );
  }
}



