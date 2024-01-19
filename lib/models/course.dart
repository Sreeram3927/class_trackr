
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
}