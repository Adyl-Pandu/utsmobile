import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 132, 132, 132),
          title: const Center(
            child: Text(
              'App Mahasiswa',
              style: TextStyle(
                color: Color.fromARGB(255, 24, 155, 255),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: const LoginPage(),
      ),
    );
  }
}