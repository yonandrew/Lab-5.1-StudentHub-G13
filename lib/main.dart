import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/main_shell.dart';
import 'providers/student_provider.dart';
import 'providers/theme_provider.dart';

void main() => runApp(const StudentHubApp());

class StudentHubApp extends StatelessWidget {
  const StudentHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    final mode = context.watch<ThemeProvider>().themeMode;
    return MaterialApp(
      title: 'StudentHub',
      debugShowCheckedModeBanner: false,
      themeMode: mode,
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const MainShell(),
    );
  }
}
