import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_provider.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/app_drawer.dart';
import 'about_page.dart';
import 'home_page.dart';
import 'programme_page.dart';
import 'student_list_page.dart';
import 'student_records_page.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  static const List<String> _titles = [
    'Home',
    'Students',
    'Student Records',
    'Programmes',
    'About',
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavigationProvider>(
      create: (_) => NavigationProvider(),
      child: Scaffold(
        appBar: AppBar(title: const _ShellTitle()),
        drawer: const _ShellDrawer(),
        body: const _ShellBody(),
        bottomNavigationBar: const _ShellBottomNav(),
      ),
    );
  }
}

class _ShellTitle extends StatelessWidget {
  const _ShellTitle();

  @override
  Widget build(BuildContext context) {
    final title = context.select<NavigationProvider, String>(
      (nav) => MainShell._titles[nav.currentIndex],
    );
    return Text(title);
  }
}

class _ShellBody extends StatelessWidget {
  const _ShellBody();

  @override
  Widget build(BuildContext context) {
    final index = context.select<NavigationProvider, int>(
      (nav) => nav.currentIndex,
    );

    return IndexedStack(
      index: index,
      children: [
        HomePage(
          onNavigate: (i) => context.read<NavigationProvider>().select(i),
        ),
        const StudentListPage(),
        const StudentRecordsPage(),
        const ProgrammePage(),
        const AboutPage(),
      ],
    );
  }
}

class _ShellDrawer extends StatelessWidget {
  const _ShellDrawer();

  @override
  Widget build(BuildContext context) {
    final index = context.select<NavigationProvider, int>(
      (nav) => nav.currentIndex,
    );

    return AppDrawer(
      selectedIndex: index,
      onSelect: (i) => context.read<NavigationProvider>().select(i),
    );
  }
}

class _ShellBottomNav extends StatelessWidget {
  const _ShellBottomNav();

  @override
  Widget build(BuildContext context) {
    final index = context.select<NavigationProvider, int>(
      (nav) => nav.currentIndex,
    );

    return AppBottomNav(
      selectedIndex: index,
      onSelect: (i) => context.read<NavigationProvider>().select(i),
    );
  }
}
