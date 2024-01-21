
class Course {
  
  final String name;
  final String code;
  final String faculty;
  String timing;

  Course({
    required this.name,
    this.code = '',
    this.faculty = '',
    this.timing = '',
  });

  factory Course.time(Course course, String timing) {
    return Course(
      name: course.name,
      code: course.code,
      faculty: course.faculty,
      timing: timing,
    );
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      name: json['name'] as String,
      code: json['code'] as String,
      faculty: json['faculty'] as String,
      timing: json['timing'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'faculty': faculty,
      'timing': timing,
    };
  }

}