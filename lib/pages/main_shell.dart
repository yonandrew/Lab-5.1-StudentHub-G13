import 'package:flutter/material.dart';

import '../widgets/app_bottom_nav.dart';
import '../widgets/app_drawer.dart';
import 'about_page.dart';
import 'home_page.dart';
import 'programme_page.dart';
import 'student_list_page.dart';
import 'student_records_page.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  // Lab section 5 (Vibe Coding): move this index into a Provider class.
  int _currentIndex = 0;

  static const _titles = [
    'Home',
    'Students',
    'Student Records',
    'Programmes',
    'About',
  ];

  void _select(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_currentIndex])),
      drawer: AppDrawer(selectedIndex: _currentIndex, onSelect: _select),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(onNavigate: _select),
          const StudentListPage(),
          const StudentRecordsPage(),
          const ProgrammePage(),
          const AboutPage(),
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        selectedIndex: _currentIndex,
        onSelect: _select,
      ),
    );
  }
}
