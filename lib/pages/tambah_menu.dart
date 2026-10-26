import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/menu.dart';
import '../widgets/teks_custom.dart';

class TambahMenu extends StatefulWidget {
  const TambahMenu({super.key});

  @override
  State<TambahMenu> createState() => _TambahMenuState();
}

class _TambahMenuState extends State<TambahMenu> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController =
      TextEditingController();

  final TextEditingController hargaController =
      TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    hargaController.dispose();
    super.dispose();
  }

  void simpanMenu() {
    if (_formKey.currentState!.validate()) {
      final nama = namaController.text.trim();
      final harga = int.tryParse(hargaController.text.trim());

      if (harga != null) {
        Get.back(
          result: Menu(
            nama: nama,
            harga: harga,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TeksCustom(
          teks: 'Tambah Menu',
          ukuran: 26,
          ketebalan: FontWeight.bold,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: Column(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Menu',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama menu tidak boleh kosong';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: hargaController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(),
                  prefixText: 'Rp ',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Harga tidak boleh kosong';
                  }

                  if (int.tryParse(value.trim()) == null) {
                    return 'Harga harus berupa angka';
                  }

                  if (int.parse(value.trim()) <= 0) {
                    return 'Harga harus lebih dari 0';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: simpanMenu,
                child: const TeksCustom(
                  teks: 'Tambah Menu',
                  ukuran: 20,
                  ketebalan: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
