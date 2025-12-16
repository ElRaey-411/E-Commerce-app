import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      foregroundColor: ColorsManager.white,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: ColorsManager.white,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: ColorsManager.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        color: ColorsManager.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w300,
      )
    ),
    inputDecorationTheme: InputDecorationThemeData(
      suffixIconColor: ColorsManager.grey,
      hintStyle: GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeight.w300,
        color: ColorsManager.grey,
      ),
      filled: true,
      fillColor: ColorsManager.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: ColorsManager.white,
        minimumSize: Size(double.infinity, 64.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
        ),
        foregroundColor: ColorsManager.blue,
      ),
    ),
  );
}
