import 'package:flutter/material.dart';

import '../models/student.dart';

class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({super.key, required this.student});

  final Student student;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Details')),
      body: Center(child: Text('${student.name} - placeholder')),
    );
  }
}
