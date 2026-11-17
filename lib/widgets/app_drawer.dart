import 'package:flutter/material.dart';

import '../pages/settings_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelect;

  static const _items = <(IconData, String)>[
    (Icons.home, 'Home'),
    (Icons.people, 'Student Information'),
    (Icons.table_chart, 'Student Records'),
    (Icons.school, 'Programmes'),
    (Icons.info, 'About'),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        final navigator = Navigator.of(context);
        navigator.pop();
        if (index == _items.length) {
          navigator.push(
            MaterialPageRoute<void>(builder: (_) => const SettingsPage()),
          );
        } else {
          onSelect(index);
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 20, 16, 12),
          child: Text(
            'StudentHub',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        for (final item in _items)
          NavigationDrawerDestination(
            icon: Icon(item.$1),
            label: Text(item.$2),
          ),
        const Divider(indent: 28, endIndent: 28),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Settings'),
        ),
      ],
    );
  }
}
