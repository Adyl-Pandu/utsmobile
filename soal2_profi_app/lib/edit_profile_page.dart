import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
  super.key,
  required this.nama,
  required this.nim,
  required this.prodi,
  required this.kelas,
  required this.bio,
  required this.email,
  required this.hp,
  required this.github,
});

final String nama, nim, prodi, kelas, bio, email, hp, github;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
      ),
    );
  }
}