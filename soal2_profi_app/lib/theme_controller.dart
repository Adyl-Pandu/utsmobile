import 'package:flutter/material.dart';

// Menyimpan mode tema aktif. Diubah dari tombol, didengarkan oleh main.dart
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);