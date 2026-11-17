import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/student_provider.dart';
import 'student_details_page.dart';

class StudentListPage extends StatelessWidget {
  const StudentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final students = context.watch<StudentProvider>().filteredStudents;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            onChanged: context.read<StudentProvider>().setQuery,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search student...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
        Expanded(
          child: students.isEmpty
              ? const Center(child: Text('No students found.'))
              : ListView.separated(
                  itemCount: students.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final s = students[index];
                    return ListTile(
                      leading: CircleAvatar(child: Text(s.initials)),
                      title: Text(s.name),
                      subtitle: Text('${s.matric} • ${s.programme}'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => StudentDetailsPage(student: s),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
