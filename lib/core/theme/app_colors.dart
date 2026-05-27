import 'package:flutter/material.dart';

/// Centralized color palette for the app — single source of truth for all colors.
class AppColors {
  AppColors._();

  // Background
  static const Color background = Color(0xFF1A1B0D);
  static const Color backgroundDots = Color(0xFF222314);

  // Surface / card
  static const Color cardBackground = Color(0xFF272818);
  static const Color iconBackground = Color(0xFF111108);

  // Brand green
  static const Color brandGreenDark = Color(0xFF178F20);

  // Wallet illustration
  static const Color walletGold = Color(0xFFD4A500);
  static const Color walletGoldDark = Color.fromARGB(255, 146, 110, 3);

  // Gift card accent
  static const Color giftCardOrange = Color(0xFFD4731A);
  static const Color giftCardOrangeLight = Color(0xFFE8962A);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFAAAAAA);
  static const Color textWatermark = Color(0xFF3A3C20);

  // Divider
  static const Color divider = Color(0xFF333420);

  // Icon foreground (white used on dark icon backgrounds)
  static const Color iconForeground = Color(0xFFFFFFFF);
  static const Color iconAccentYellow = Color(0xFFD4A500);
}
