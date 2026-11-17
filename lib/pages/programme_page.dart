import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/student.dart';
import '../providers/student_provider.dart';
import 'student_details_page.dart';

class ProgrammePage extends StatelessWidget {
  const ProgrammePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StudentProvider>();
    final programmes = provider.programmes;

    return DefaultTabController(
      length: programmes.length,
      child: Column(
        children: [
          Material(
            color: Theme.of(context).colorScheme.surface,
            child: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: [for (final p in programmes) Tab(text: p)],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                for (final p in programmes)
                  _ProgrammeTab(students: provider.byProgramme(p)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgrammeTab extends StatelessWidget {
  const _ProgrammeTab({required this.students});

  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final s = students[index];
        return ListTile(
          leading: CircleAvatar(child: Text(s.initials)),
          title: Text(s.name),
          subtitle: Text('${s.matric} • CGPA ${s.cgpa.toStringAsFixed(2)}'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => StudentDetailsPage(student: s),
            ),
          ),
        );
      },
    );
  }
}
