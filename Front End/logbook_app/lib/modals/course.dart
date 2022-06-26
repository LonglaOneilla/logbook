class Course{
  late String _courseID;
  late String _title; //course title
  late DateTime _date ; // date course was created in the system
  late int _hours; //number of hours assigned to the course

  Course();

  Course.name(this._courseID, this._title, this._date,
      this._hours);

  int get hours => _hours;

  set hours(int value) {
    _hours = value;
  }

  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get courseID => _courseID;

  set courseID(String value) {
    _courseID = value;
  }
}