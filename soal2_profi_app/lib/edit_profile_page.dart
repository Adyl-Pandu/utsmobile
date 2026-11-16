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
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nama;
  late final TextEditingController _nim;
  late final TextEditingController _prodi;
  late final TextEditingController _kelas;
  late final TextEditingController _bio;
  late final TextEditingController _email;
  late final TextEditingController _hp;
  late final TextEditingController _github;

  @override
  void initState() {
    super.initState();

    _nama = TextEditingController(text: widget.nama);
    _nim = TextEditingController(text: widget.nim);
    _prodi = TextEditingController(text: widget.prodi);
    _kelas = TextEditingController(text: widget.kelas);
    _bio = TextEditingController(text: widget.bio);
    _email = TextEditingController(text: widget.email);
    _hp = TextEditingController(text: widget.hp);
    _github = TextEditingController(text: widget.github);
  }

  void _simpan() {
  if (!_formKey.currentState!.validate()) return;

  Navigator.pop(context, {
    'nama': _nama.text.trim(),
    'nim': _nim.text.trim(),
    'prodi': _prodi.text.trim(),
    'kelas': _kelas.text.trim(),
    'bio': _bio.text.trim(),
    'email': _email.text.trim(),
    'hp': _hp.text.trim(),
    'github': _github.text.trim(),
  });
  }

  @override
  void dispose() {
  _nama.dispose();
  _nim.dispose();
  _prodi.dispose();
  _kelas.dispose();
  _bio.dispose();
  _email.dispose();
  _hp.dispose();
  _github.dispose();

  super.dispose();
}
}