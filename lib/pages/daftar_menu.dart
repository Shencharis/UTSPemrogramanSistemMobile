import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/menu.dart';
import '../widgets/teks_custom.dart';
import 'detail_menu.dart';
import 'tambah_menu.dart';

class DaftarMenu extends StatefulWidget {
  const DaftarMenu({super.key});

  @override
  State<DaftarMenu> createState() => _DaftarMenuState();
}

class _DaftarMenuState extends State<DaftarMenu> {
  final List<Menu> daftarMenu = [
    Menu(nama: 'Nasi Goreng', harga: 15000),
    Menu(nama: 'Mi Ayam', harga: 12000),
    Menu(nama: 'Bakso', harga: 13000),
    Menu(nama: 'Es Teh', harga: 5000),
    Menu(nama: 'Jus Jeruk', harga: 8000),
  ];

  Future<void> bukaHalamanTambah() async {
    final hasil = await Get.to<Menu>(
      () => const TambahMenu(),
    );

    if (hasil != null) {
      setState(() {
        daftarMenu.add(hasil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const TeksCustom(
          teks: 'Menu Kantin',
          ukuran: 26,
          ketebalan: FontWeight.bold,
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: const TeksCustom(
              teks: 'Daftar Menu',
              ukuran: 24,
              ketebalan: FontWeight.bold,
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              itemCount: daftarMenu.length,
              itemBuilder: (context, index) {
                final menu = daftarMenu[index];

                return Card(
                  color: Colors.white,
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: const BorderSide(
                      color: Color(0xFFEEEEEE),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),

                  leading: Icon(
                    ikonMenu(menu.nama),
                    color: const Color(0xFF8A6425),
                    size: 26,
                  ),

                    title: TeksCustom(
                      teks: menu.nama,
                      ukuran: 20,
                      ketebalan: FontWeight.bold,
                    ),

                    subtitle: TeksCustom(
                      teks: 'Rp${menu.harga}',
                      ukuran: 16,
                      warna: const Color(0xFF777777),
                    ),

                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Color(0xFF777777),
                    ),

                    onTap: () {
                      Get.to(
                        () => DetailMenu(menu: menu),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: bukaHalamanTambah,
        backgroundColor: const Color(0xFFFFD43B),
        foregroundColor: Colors.black,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Icon(Icons.add),
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
