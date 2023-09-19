import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A utility class that holds constants for useful and commonly
/// used values throughout the entire app.
/// This class has no constructor and all variables are `static`.
@immutable
class Constants {
  const Constants._();
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text, Color color) {
    if (text == null) return;
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: color,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static const SizedBox sizeH50 = SizedBox(
    height: 50,
  );
  static const SizedBox sizeH30 = SizedBox(
    height: 30,
  );
  static const SizedBox sizeH20 = SizedBox(
    height: 20,
  );
  static const SizedBox sizeH10 = SizedBox(
    height: 10,
  );
  static const SizedBox sizeW10 = SizedBox(
    width: 10,
  );

  /// The color value for dark grey buttons in the app.
  static const Color buttonGreyColor = const Color.fromARGB(115, 255, 153, 0);

  /// The color value for dark grey scaffold in the app.
  static const Color scaffoldColor = Color(0xFF141414);

  /// The color value for white text in the app.
  static const Color textWhite80Color = Color(0xFFf2f2f2);

  /// The TextStyle for Poppins font in the app.
  static TextStyle poppinsFont = GoogleFonts.poppins().copyWith(
    color: textWhite80Color,
  );
}
