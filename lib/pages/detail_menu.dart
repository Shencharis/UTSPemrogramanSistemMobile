import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/menu.dart';
import '../widgets/teks_custom.dart';

class DetailMenu extends StatelessWidget {
  final Menu menu;

  const DetailMenu({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const TeksCustom(
          teks: 'Detail Menu',
          ukuran: 26,
          ketebalan: FontWeight.bold,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),

            // Kartu utama detail menu.
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFFEEEEEE),
                ),
              ),

              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0C2),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(
                      ikonMenu(menu.nama),
                      size: 65,
                      color: const Color(0xFF8A6425),
                    ),
                  ),

                  const SizedBox(height: 24),

                  TeksCustom(
                    teks: menu.nama,
                    ukuran: 32,
                    ketebalan: FontWeight.bold,
                  ),

                  const SizedBox(height: 12),

                  const TeksCustom(
                    teks: 'Harga Menu',
                    ukuran: 18,
                    warna: Color(0xFF777777),
                  ),

                  const SizedBox(height: 4),

                  TeksCustom(
                    teks: 'Rp${menu.harga}',
                    ukuran: 28,
                    warna: const Color(0xFF8A6425),
                    ketebalan: FontWeight.bold,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Tombol kembali ke daftar menu.
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD43B),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const TeksCustom(
                teks: 'Kembali ke Daftar',
                ukuran: 20,
                ketebalan: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData ikonMenu(String nama) {
    final namaMenu = nama.toLowerCase();

    if (namaMenu.contains('nasi')) {
      return Icons.rice_bowl;
    } else if (namaMenu.contains('mi')) {
      return Icons.ramen_dining;
    } else if (namaMenu.contains('bakso')) {
      return Icons.soup_kitchen;
    } else if (namaMenu.contains('teh')) {
      return Icons.local_cafe;
    } else if (namaMenu.contains('jus')) {
      return Icons.local_drink;
    } else {
      return Icons.restaurant;
    }
  }
}
