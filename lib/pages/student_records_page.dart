import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/student.dart';
import '../providers/student_provider.dart';

class StudentRecordsPage extends StatefulWidget {
  const StudentRecordsPage({super.key});

  @override
  State<StudentRecordsPage> createState() => _StudentRecordsPageState();
}

class _StudentRecordsPageState extends State<StudentRecordsPage> {
  int _sortColumnIndex = 0;
  bool _ascending = true;

  List<Student> _sorted(List<Student> source) {
    final data = [...source];
    data.sort((a, b) {
      final int result = switch (_sortColumnIndex) {
        0 => a.name.compareTo(b.name),
        1 => a.matric.compareTo(b.matric),
        3 => a.cgpa.compareTo(b.cgpa),
        4 => a.year.compareTo(b.year),
        _ => 0,
      };
      return _ascending ? result : -result;
    });
    return data;
  }

  void _sort(int column, bool ascending) {
    setState(() {
      _sortColumnIndex = column;
      _ascending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    final students = _sorted(context.watch<StudentProvider>().allStudents);

    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _ascending,
          columns: [
            DataColumn(label: const Text('Name'), onSort: _sort),
            DataColumn(label: const Text('Matric'), onSort: _sort),
            const DataColumn(label: Text('Programme')),
            DataColumn(label: const Text('CGPA'), numeric: true, onSort: _sort),
            DataColumn(label: const Text('Year'), numeric: true, onSort: _sort),
          ],
          rows: [
            for (final s in students)
              DataRow(
                cells: [
                  DataCell(Text(s.name)),
                  DataCell(Text(s.matric)),
                  DataCell(Text(s.programme)),
                  DataCell(Text(s.cgpa.toStringAsFixed(2))),
                  DataCell(Text('${s.year}')),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
