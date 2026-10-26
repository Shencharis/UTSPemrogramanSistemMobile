import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Font Patrick Hand dipilih untuk memberikan kesan tulisan tangan 
// sehingga terasa lebih personal dan santai.
// selain itu diantara font tulisan tangan lainnya, font Patrick Hand lebih mudah dibaca.

class TeksCustom extends StatelessWidget {
  final String teks;
  final double ukuran;
  final Color warna;
  final FontWeight ketebalan;

  const TeksCustom({
    super.key,
    required this.teks,
    this.ukuran = 18,
    this.warna = Colors.black,
    this.ketebalan = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      teks,
      style: GoogleFonts.patrickHand(
        fontSize: ukuran,
        color: warna,
        fontWeight: ketebalan,
      ),
    );
  }
}
