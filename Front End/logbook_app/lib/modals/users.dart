class User{
  late String _email;
  late int _id;
  late String _password;

  User();

  User.name(this._email, this._password);

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }
}