class Teacher{
  late String _T_id;
  late String _firstname;
  late String _lastname;
  late String _email;

  Teacher();

  Teacher.name(this._T_id, this._firstname, this._lastname, this._email);

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get lastname => _lastname;

  set lastname(String value) {
    _lastname = value;
  }

  String get firstname => _firstname;

  set firstname(String value) {
    _firstname = value;
  }

  String get T_id => _T_id;

  set T_id(String value) {
    _T_id = value;
  }
}