import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/daftar_menu.dart';

void main() {
  runApp(const AplikasiKantin());
}

class AplikasiKantin extends StatelessWidget {
  const AplikasiKantin({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Kantin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const DaftarMenu(),
    );
  }
}
