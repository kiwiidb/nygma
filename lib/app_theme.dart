import 'package:nygma/constants/colors.dart';
import 'package:nygma/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTheme {
  ThemeData get theme {
    return ThemeData.dark().copyWith(
      backgroundColor: Colors.white,
      canvasColor: Colors.white,
      primaryColor: Colors.grey,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: kAccentColor,
        secondary: kAccentColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
        titleTextStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme:
          ThemeData.dark().textTheme.apply(fontFamily: AppFonts.primaryFont),
      primaryTextTheme:
          ThemeData.dark().textTheme.apply(fontFamily: AppFonts.primaryFont),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: kOffGreyColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 29.0, vertical: 14.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 2.0,
            color: kAccentColor,
          ),
        ),
        hintStyle: TextStyle(
          fontSize: 15.0,
          color: Colors.white38,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.secondaryFont,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(minimumSize: Size(56, 56)),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.white,
        ),
      ),
    );
  }
}
