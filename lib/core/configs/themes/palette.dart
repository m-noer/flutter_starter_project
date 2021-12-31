import 'package:flutter/material.dart';

class Palette {
  // Material UI Color Scheme
  static const primaryColor = Color(0xFF7e16a7);
  static const primaryColorLight = Color(0xFFb14dd9);
  static const primaryColorDark = Color(0xFF4c0077);
  static const primaryVariant = Color(0xFF4B0C93);
  static const secondaryColor = Color(0xFFaf42c0);
  static const secondaryColorLight = Color(0xFFe374f3);
  static const secondaryColorDark = Color(0xFF7c008f);
  static const secondaryVariant = Color(0xFFBD65CB);
  static const surface = Colors.white;
  static const surfaceDark = Color(0xFF424242);
  static const background = Color(0xFFF6F6F6);
  static const backgroundDark = Color(0xFF1F1F1F);
  static const error = Color(0xFFDC3545);
  static const onPrimary = Colors.white;
  static const onSecondary = Colors.white;
  static const onSurface = Color(0xFF1F1F1F);
  static const onSurfaceDark = Colors.white;
  static const onBackground = Color(0xFF1F1F1F);
  static const onBackgroundDark = Colors.white;
  static const onError = Colors.white;
  static const alert = Color(0xFFFFC107);
  static const orange = Color(0xFFEE8043);
  static const green = Color(0xFF5BB16F);

  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFF4E5F6),
      100: Color(0xFFE2BDE8),
      200: Color(0xFFD092DA),
      300: Color(0xFFBD65CB),
      400: Color(0xFFAF42C0),
      500: Color(0xFFA01DB4),
      600: Color(0xFF911BAF),
      700: Color(_primaryValue),
      800: Color(0xFF6C12A0),
      900: Color(0xFF4B0C93),
    },
  );
  static const int _primaryValue = 0xFF7E16A7;
  // Black
  static const MaterialColor black = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      25: Color(0xFFFAFAFA),
      50: Color(0xFFF5F5F5),
      100: Color(0xFFF0F0F0),
      150: Color(0xFFEBEBEB),
      200: Color(0xFFE0E0E0),
      250: Color(0xFFC7C7C7),
      300: Color(0xFFB3B3B3),
      400: Color(0xFF8A8A8A),
      450: Color(0xFF616161),
      500: Color(0xFF424242),
      550: Color(0xFF3D3D3D),
      600: Color(0xFF333333),
      700: Color(0xFF292929),
      800: Color(_blackPrimaryValue),
      900: Color(0xFF0F0F0F),
    },
  );

  static const int _blackPrimaryValue = 0xFFF44336;

  static LinearGradient primaryGradient = LinearGradient(
    colors: [
      Palette.primaryColor,
      Palette.primary[900]!,
    ],
  );

  // App Color
  static const disabledColor = Color(0xFFF3F3F3);
  static const dividerColor = Colors.grey;
  static const successColor = Color(0xFF28A745);
  static const success2 = Color(0xFFD4EDDA);
  static const danger = Color(0xFFDC3545);
  static const danger2 = Color(0xFFF8D7DA);
  static const warning = Color(0xFFFFC107);
  static const waring2 = Color(0xFFFFF3CD);
  static const pdfBackground = Color(0xFFFFE8EA);
  static const pdfColor = Color(0xFFD16570);
  static const taskOrangeBackground = Color(0xFFFFEBD3);
  static const taskOrangeColor = Color(0xFFEE8043);
  static const taskGreenBackground = Color(0xFFE7F6EB);
  static const taskGreenColor = Color(0xFF5BB16F);
}
