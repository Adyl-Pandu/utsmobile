
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String nama = 'Adyl Pandu Setiawan';
  final String nim = '1124160136';
  final String prodi = 'Teknik Informatika';
  final String kelas = 'Se2';
  final String bio = 'Mahasiswa yang sedang belajar Flutter.';
  final String email = 'adylpandu@gmail.com';
  final String hp = '081234567890';
  final String github = 'https://github.com/Adyl-Pandu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Adyl Pandu'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/foto.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
