import 'package:flutter/foundation.dart';

import '../data/student_data.dart';
import '../models/student.dart';

class StudentProvider extends ChangeNotifier {
  final List<Student> _students = List.unmodifiable(sampleStudents);
  String _query = '';

  List<Student> get allStudents => _students;

  String get query => _query;

  List<Student> get filteredStudents {
    if (_query.isEmpty) return _students;
    final q = _query.toLowerCase();
    return _students
        .where(
          (s) =>
              s.name.toLowerCase().contains(q) ||
              s.matric.toLowerCase().contains(q),
        )
        .toList();
  }

  List<String> get programmes =>
      _students.map((s) => s.programme).toSet().toList();

  List<Student> byProgramme(String programme) =>
      _students.where((s) => s.programme == programme).toList();

  double get averageCgpa =>
      _students.fold<double>(0, (sum, s) => sum + s.cgpa) / _students.length;

  void setQuery(String value) {
    _query = value;
    notifyListeners();
  }
}
