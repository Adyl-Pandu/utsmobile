import 'package:flutter/material.dart';
import 'login.dart';
import 'profile_page.dart';
// import 'about_page.dart';
import 'theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ValueListenableBuilder membangun ulang MaterialApp saat themeNotifier berubah
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'Profil Mahasiswa',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
          ),
          themeMode: mode,
          initialRoute: '/login',
          routes: {
            '/login': (_) => const LoginPage(),
            '/profile': (_) => const ProfilePage(),
            // '/about': (_) => const AboutPage(),
          },
        );
      },
    );
  }
}