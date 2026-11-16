import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nama,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Nama wajib diisi' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nim,
                  decoration: const InputDecoration(
                    labelText: 'NIM',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _prodi,
                  decoration: const InputDecoration(
                    labelText: 'Program Studi',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _kelas,
                  decoration: const InputDecoration(
                    labelText: 'Kelas',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _bio,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Bio Singkat',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Email wajib diisi';
                  }
                  if (!v.contains('@') || !v.contains('.')) {
                    return 'Format email tidak valid';
                  }
                  return null;
                  },   
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _hp,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: 'Nomor HP',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Nomor HP wajib diisi';
                    }
                    if (!RegExp(r'^\d{10,13}$').hasMatch(v.trim())) {
                      return 'Nomor HP harus angka 10-13 digit';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _github,
                  decoration: const InputDecoration(
                    labelText: 'Akun GitHub',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),

                // ===== BAGIAN 3: tombol simpan =====
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _simpan,
                    child: const Text('SIMPAN'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}