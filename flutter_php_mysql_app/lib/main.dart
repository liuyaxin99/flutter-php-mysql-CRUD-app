import 'package:flutter/material.dart';
import 'package:flutter_php_mysql_app/screens/students_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StudentsPage(),
    );
  }
}
