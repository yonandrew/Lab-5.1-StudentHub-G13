import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      children: [
        SizedBox(
          height: 220,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [scheme.primary, scheme.tertiary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Positioned(
                top: -30,
                right: -30,
                child: Icon(
                  Icons.circle,
                  size: 140,
                  color: Colors.white.withValues(alpha: 0.12),
                ),
              ),
              Positioned(
                bottom: -40,
                left: -20,
                child: Icon(
                  Icons.circle,
                  size: 120,
                  color: Colors.white.withValues(alpha: 0.12),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 44,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.school, size: 48, color: scheme.primary),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'StudentHub',
                    style: textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Version 1.0.0',
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('About the app'),
          subtitle: Text(
            'A student management app: student list, details, records and programmes.',
          ),
        ),
        const ListTile(
          leading: Icon(Icons.menu_book),
          title: Text('Course'),
          subtitle: Text('TMA3084 Software Engineering Laboratory'),
        ),
        const ListTile(
          leading: Icon(Icons.assignment),
          title: Text('Lab Exercise'),
          subtitle: Text('Lab 5.1: Building a Student Management App'),
        ),
        const ListTile(
          leading: Icon(Icons.groups),
          title: Text('Developed by'),
          subtitle: Text('Group G13, UNIMAS'),
        ),
        const ListTile(
          leading: Icon(Icons.code),
          title: Text('Built with'),
          subtitle: Text('Flutter, Material 3 and Provider'),
        ),
      ],
    );
  }
}
