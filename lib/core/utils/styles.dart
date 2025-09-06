import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static TextStyle montserratSemiBold18 = GoogleFonts.montserrat(
    color: const Color(0xFFFFFFFF),
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static TextStyle montserratSemiBold14 = GoogleFonts.montserrat(
    color: const Color(0xFFFFFFFF),
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static TextStyle montserratMedium14 = GoogleFonts.montserrat(
    color: const Color(0xFFFFFFFF).withValues(alpha: 0.7),
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle montserratMedium18 = GoogleFonts.montserrat(
    color: const Color(0xFFFFFFFF).withValues(alpha: 0.7),
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle montserratMedium16 = GoogleFonts.montserrat(
    color: const Color(0xFFFFFFFF),
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle montserratRegular14 = GoogleFonts.montserrat(
    color: const Color(0xFFFFFFFF).withValues(alpha: 0.5),
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle montserratBold16 = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static TextStyle montserratBold20 = GoogleFonts.montserrat(
    color: const Color(0xFFFFFFFF),
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle gilroyBold16 = TextStyle(
    color: const Color(0xFFFFFFFF),
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Gilroy',
  );
  static const TextStyle gTsectraFineRegular20 = TextStyle(
    fontFamily: 'GTSectraFine',
    color: Color(0xFFFFFFFF),
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle gTsectraFineRegular30 = TextStyle(
    fontFamily: 'GTSectraFine',
    color: Color(0xFFFFFFFF),
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );
}
