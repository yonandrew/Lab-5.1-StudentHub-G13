import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/student_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onNavigate});

  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StudentProvider>();
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [scheme.primaryContainer, scheme.secondaryContainer],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Icon(Icons.school, size: 72, color: scheme.primary),
              const SizedBox(height: 8),
              Text(
                'StudentHub',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: scheme.onPrimaryContainer,
                ),
              ),
              Text('Your Student Portal', style: textTheme.titleMedium),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Avatar(Icons.face),
                  _Avatar(Icons.face_3),
                  _Avatar(Icons.face_6),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Welcome to StudentHub!',
          style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text(
          'Check student details, view records and explore programmes, '
          'just like a real university student portal.',
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _SummaryCard(
              icon: Icons.groups,
              value: '${provider.allStudents.length}',
              label: 'Students',
            ),
            _SummaryCard(
              icon: Icons.menu_book,
              value: '${provider.programmes.length}',
              label: 'Programmes',
            ),
            _SummaryCard(
              icon: Icons.grade,
              value: provider.averageCgpa.toStringAsFixed(2),
              label: 'Avg CGPA',
            ),
          ],
        ),
        const SizedBox(height: 16),
        FilledButton.tonalIcon(
          onPressed: () => onNavigate(1),
          icon: const Icon(Icons.people),
          label: const Text('View Students'),
        ),
        const SizedBox(height: 8),
        FilledButton.tonalIcon(
          onPressed: () => onNavigate(2),
          icon: const Icon(Icons.table_chart),
          label: const Text('Student Records'),
        ),
        const SizedBox(height: 8),
        FilledButton.tonalIcon(
          onPressed: () => onNavigate(4),
          icon: const Icon(Icons.info),
          label: const Text('About'),
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar(this.icon);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: CircleAvatar(radius: 28, child: Icon(icon, size: 32)),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 4),
              Text(
                value,
                style: Theme.of(context).textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(label, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
