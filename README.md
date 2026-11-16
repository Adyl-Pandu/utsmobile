# UTS Pemrograman Mobile Lanjutan

| | |
|---|---|
| **Nama** | Adyl Pandu Setiawan |
| **NIM** | 1124160136 |
| **Kelas** | Se2 |
| **Program Studi** | Teknik Informatika |
| **Dosen** | I Ketut Gunawan |

## Struktur Repository

- `LiveCoding/` : Soal 1, live coding halaman profil (StatelessWidget)
- `soal2-profil-app/` : Soal 2, aplikasi Android Profil Mahasiswa
- `screenshots/` : tangkapan layar aplikasi Soal 2

---

## Soal 2: Aplikasi Profil Mahasiswa

- **Video presentasi YouTube:** (tempel link video di sini)
- **APK:** [GitHub Releases v1.0.0](tempel-link-releases-di-sini)

### Screenshot

| Login | Profil | Edit Profil |
|---|---|---|
| ![Login](Screenshot%202026-11-16%20194228.png) | ![Profil](Screenshot%202026-11-16%20194042.png) | ![Edit Profil](Screenshot%202026-11-16%20194059.png) |

### Fitur

- **Login** dengan validasi dan pesan error (SnackBar), lalu pindah halaman dengan `pushReplacementNamed`.
- **Halaman Profil**: foto dari `assets/images/` (`CircleAvatar`), nama, NIM, program studi, kelas, bio, dan kontak (email, nomor HP, GitHub) memakai `Card` + `ListTile` dengan ikon.
- **Tentang Saya** (digabung di halaman profil, memakai `ListView`): daftar keahlian/hobi dan riwayat pendidikan.
- **Edit Profil**: form terisi data saat ini (`TextEditingController`), validasi nama wajib diisi, email valid, dan nomor HP angka 10-13 digit. Tombol Simpan mengirim data kembali dengan `Navigator.pop`, lalu halaman profil langsung berubah lewat `setState()`.
- **Scaffold lengkap**: `AppBar`, `Drawer` (Profil, Edit Profil, Logout, switch mode gelap), dan body.
- **Tema terang dan gelap** dengan warna sendiri (`theme` dan `darkTheme`). Mode gelap bisa diganti langsung lewat ikon di AppBar atau switch di Drawer.
- **Nama aplikasi Android**: Profil Pandu (`android:label` di `AndroidManifest.xml`).

### Akun Demo

| Email | Password |
|---|---|
| `admin@gmail.com` | `12345` |

### Struktur Kode

```
lib/
├── main.dart            # MaterialApp, tema terang/gelap, routes
├── theme_controller.dart # themeNotifier untuk ganti mode gelap
└── screens/
    ├── login_page.dart
    ├── profile_page.dart
    └── edit_profile_page.dart
```

Data profil disimpan di memori (tanpa server atau database).

### Cara Menjalankan

```bash
git clone https://github.com/Adyl-Pandu/<nama-repo>.git
cd <nama-repo>/soal2-profil-app
flutter pub get
flutter run
```

Tidak ada paket tambahan selain `flutter` dan `cupertino_icons`.

### Membuat APK

```bash
flutter build apk --release
```

File hasilnya ada di `build/app/outputs/flutter-apk/app-release.apk` dan diunggah ke halaman Releases (tag `v1.0.0`).
