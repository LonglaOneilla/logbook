class Logbook {
  String _startTime = "";
  String _endTime = "";
  String _hour = "";
  String _detail = "";
  String _date = "";

  //Logbook(this.startTime, this.endTime, this.hour, this.detail, this.date);

  Logbook.name();

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get detail => _detail;

  set detail(String value) {
    _detail = value;
  }

  String get hour => _hour;

  set hour(String value) {
    _hour = value;
  }

  String get endTime => _endTime;

  set endTime(String value) {
    _endTime = value;
  }

  String get startTime => _startTime;

  set startTime(String value) {
    _startTime = value;
  }
}



