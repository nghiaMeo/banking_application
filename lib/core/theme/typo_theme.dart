import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypoTheme {
  static Widget titleSemiBold_24(
    BuildContext context,
    Color color, {
    required String text,
  }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget titleSemiBold_20(
    BuildContext context,
    Color color, {
    required String text,
  }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget titleSemiBold_16(
    BuildContext context,
    Color color, {
    required String text,
  }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget bodyMedium_16(
    BuildContext context,
    Color color, {
    required String text,
  }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static Widget bodyRegular_16(
    BuildContext context,
    Color color, {
    required String text,
  }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static Widget bodyMedium_14(
    BuildContext context,
    Color color, {
    required String text,
  }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static Widget captionSemibold_14(
      BuildContext context,
      Color color, {
        required String text,
      }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static Widget captionMedium_14(
      BuildContext context,
      Color color, {
        required String text,
      }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
