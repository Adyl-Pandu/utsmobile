import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Adyl Profil",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 85, 76, 255), 
          secondary: const Color(0xFF06B6D4), 
          tertiary: const Color(0xFFEC4899), 
        )
      ),
      themeMode: ThemeMode.system,
      home: const ProfilePage(), 
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit profil',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Edit profil ditekan')),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                CircleAvatar(
                  radius: 56,
                  backgroundColor: colorScheme.primaryContainer,
                  child: Icon(Icons.person,size: 90,)
                ),
                const SizedBox(height: 16),
                Text(
                  'Adyl Pandu Setiawan',
                  style: textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'NIM: 1124160136',
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  'Program Studi Teknik Informatika',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Text('Kontak', style: textTheme.titleMedium),
                      ),
                      const InfoTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: 'Adylpandu@gmail.com',
                      ),
                      const InfoTile(
                        icon: Icons.phone,
                        label: 'Nomor HP',
                        value: '0812-3456-7890',
                      ),
                      const InfoTile(
                        icon: Icons.code,
                        label: 'GitHub',
                        value: 'github.com/adylpandu',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Text('Keahlian & Hobi',
                            style: textTheme.titleMedium),
                      ),
                      const InfoTile(
                        icon: Icons.phone_android,
                        label: 'Keahlian',
                        value: 'Flutter & Dart',
                      ),
                      const InfoTile(
                        icon: Icons.sports_esports,
                        label: 'Hobi',
                        value: 'Bermain game',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 72), 
              ],
            ),
            )
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Terima kasih',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Terima kasih telah melihat profil Adyl'),
            ),
          );
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}


