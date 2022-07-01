class Course{
  late String courseID;
  late String title; //course title
  //late DateTime date ; // date course was created in the system
  late int hours; //number of hours assigned to the course

  Course();

  Course.name({required this.courseID, required this.title, required this.hours});

  factory Course.fromJson(Map<String, dynamic> json){
    return Course.name(
      //date: json['date'],
      title: json['title'],
      courseID: json['courseID'],
      hours: json['hours'],
    );
  }
}