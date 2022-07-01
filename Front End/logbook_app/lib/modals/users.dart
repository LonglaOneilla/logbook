
class User{

  late String email;
  late int id;
  late String password;
  late String privilege;

  User.name();

  User({required this.email, required this.password, required this.privilege, required int id});

  factory User.fromJson(Map<String, dynamic> json) {

    return User(
        id: json['id'] as int,
        email: json['email'] as String,
        password: json['password'] as String,
        
        privilege:json['privilege'] as String,);
  }

  @override
  String toString() {
    return 'Users{email: $email}';
  }
  
}