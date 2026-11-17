import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/student.dart';

class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({super.key, required this.student});

  final Student student;

  Future<void> _copyInfo(BuildContext context) async {
    final text =
        '${student.name}\n${student.matric}\n${student.programme}\n${student.email}';
    await Clipboard.setData(ClipboardData(text: text));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Student info copied')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Details')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Center(
            child: CircleAvatar(
              radius: 56,
              child: Text(
                student.initials,
                style: const TextStyle(fontSize: 36),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              student.name,
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                _InfoTile(
                  Icons.badge,
                  'Matric Number',
                  student.matric,
                  selectable: true,
                ),
                _InfoTile(Icons.school, 'Programme', student.programme),
                _InfoTile(
                  Icons.email,
                  'Email',
                  student.email,
                  selectable: true,
                ),
                _InfoTile(Icons.grade, 'CGPA', student.cgpa.toStringAsFixed(2)),
                _InfoTile(
                  Icons.calendar_today,
                  'Year of Study',
                  'Year ${student.year}',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: FilledButton.icon(
              onPressed: () => _copyInfo(context),
              icon: const Icon(Icons.copy),
              label: const Text('Copy Info'),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile(this.icon, this.label, this.value, {this.selectable = false});

  final IconData icon;
  final String label;
  final String value;
  final bool selectable;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label, style: Theme.of(context).textTheme.bodySmall),
      subtitle: selectable ? SelectableText(value) : Text(value),
    );
  }
}
