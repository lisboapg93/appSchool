import 'package:flutter/material.dart';
import 'package:seduc_app/pages/login_page.dart';

void main() {
  runApp(const SeducApp());
}

class SeducApp extends StatelessWidget {
  const SeducApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIAEP app',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(58, 141, 192, 1),
      ),
      home: const LoginPage(),
    );
  }
}
