
class Course{
  String? code;
  String? title; //course title
  int? id; 
  int? hours; //number of hours assigned to the course

  Course.name();

  Course({required this.code, required this.title, required this.hours});

  factory Course.fromJson(Map<String, dynamic> json){
    return Course(
      //date: json['date'],
      title: json['title'],
      code: json['code'],
      hours: json['hours'],
    );
  }
}