import 'package:flutter/material.dart';
import 'package:appSchool/pages/login_page.dart';

void main() {
  runApp(const SchoolApp());
}

class SchoolApp extends StatelessWidget {
  const SchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Escola app',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(58, 141, 192, 1),
      ),
      home: const LoginPage(),
    );
  }
}
