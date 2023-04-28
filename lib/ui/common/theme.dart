import 'package:flutter/material.dart';
import 'package:hamason/ui/common/app_colors.dart';

final appTheme = ThemeData.light().copyWith(
  primaryColor: kcBackgroundColor,
  focusColor: kcPrimaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: kcPrimaryAppBarBackground,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kcSubmit,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: const TextStyle(
        fontSize: 18,
      ),
    ),
  ),
);
