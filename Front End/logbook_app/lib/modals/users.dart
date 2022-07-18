
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

class User{

  String email;
  int id;
  String password;
  String privilege;

  User({required this.email, required this.password, required this.privilege, required int this.id});
  static User sessionUser=User(email: '', id: 4,password: '',privilege: '');

  factory User.fromJson(Map<String, dynamic> json)=>User(

    
        id: json['id'],
        email: json['email'],
        password: json['password'],
        
        privilege:json['type'],
  );

  Map<String,dynamic> toMap()=>{
    'id':id,
    'email': email,
    'password':password,
    'type':privilege
  };

  static saveUser(User user) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = json.encode(user.toMap());
    pref.setString("user", data);
    pref.commit();
  }

  static getUser() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = pref.getString("user");
    var decode = json.decode(data);
    var user = await User.fromJson(decode);
    sessionUser=user;
    print(sessionUser);
  }

  
  
}