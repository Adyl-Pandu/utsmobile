import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'theme_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String nama = 'Adyl Pandu Setiawan';
  String nim = '1124160136';
  String prodi = 'Teknik Informatika';
  String kelas = 'Se2';
  String bio = 'Mahasiswa yang sedang belajar Flutter.';
  String email = 'adylpandu@gmail.com';
  String hp = '081234567890';
  String github = 'https://github.com/Adyl-Pandu';

  Future<void> _editProfil() async {
    final hasil = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (_) => EditProfilePage(
          nama: nama,
          nim: nim,
          prodi: prodi,
          kelas: kelas,
          bio: bio,
          email: email,
          hp: hp,
          github: github,
        ),
      ),
    );

    if (hasil != null) {
      setState(() {
        nama = hasil['nama']!;
        nim = hasil['nim']!;
        prodi = hasil['prodi']!;
        kelas = hasil['kelas']!;
        bio = hasil['bio']!;
        email = hasil['email']!;
        hp = hasil['hp']!;
        github = hasil['github']!;
      });
    }
  }

  void _toggleTheme() {
  themeNotifier.value = themeNotifier.value == ThemeMode.dark
      ? ThemeMode.light
      : ThemeMode.dark;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Profil Adyl Pandu'),
          actions: [
            IconButton(
              tooltip: 'Ganti tema',
              icon: Icon(
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: _toggleTheme,
            ),
          ],
        ),
            drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                nama,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Mode Gelap'),
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (_) => _toggleTheme(),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profil'),
              onTap: () {
                Navigator.pop(context); // tutup drawer dulu
                _editProfil();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false),
            ),
          ],
        ),
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
              const SizedBox(height: 16),
              Text(
                nama,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              Text(
                'NIM $nim',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              Text(
                '$prodi - $kelas',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              Text(bio, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('Email'),
                      subtitle: Text(email),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('Nomor HP'),
                      subtitle: Text(hp),
                    ),
                    ListTile(
                      leading: const Icon(Icons.code),
                      title: const Text('GitHub'),
                      subtitle: Text(github),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 72),
            ],
          ),
        ),
      ),
    );
  }
}