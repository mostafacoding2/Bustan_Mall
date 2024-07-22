import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.price});
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:  GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
            textAlign: TextAlign.center,
          ),
          Text(price, style:  GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              )), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
