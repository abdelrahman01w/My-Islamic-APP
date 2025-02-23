import 'package:flutter/material.dart';

import 'app_colors.dart';

/// MyThemeData : mode(light-dark) colors
/// const : when we know value befor runtime
/// final : when we know value with runtime

class MyThemeData{
  static final ThemeData lightMode = ThemeData(
      scaffoldBackgroundColor: Colors.transparent/// transparent : لون شفاف
      , primaryColor: AppColors.primaryColor

      ,bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: AppColors.blackColor,
    unselectedItemColor: AppColors.whiteColor,
    showUnselectedLabels: true ,
  )

      ,appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
        color: AppColors.blackColor
    ),
    backgroundColor: Colors.transparent
    ,elevation: 0, /// for delete the curves from appbar
    centerTitle: true,
  )

      ,textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      )
      ,   bodyMedium: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor
  )
      ,titleLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor
  )
  )
  );
  static final ThemeData darkMode = ThemeData(
      scaffoldBackgroundColor: Colors.transparent/// transparent : لون شفاف
      , primaryColor: AppColors.primaryColorDark

      ,bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: AppColors.yellowColor,
    unselectedItemColor: AppColors.whiteColor,
    showUnselectedLabels: true ,
  )

      ,appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
        color: AppColors.whiteColor
    ),
    backgroundColor: Colors.transparent
    ,elevation: 0, /// for delete the curves from appbar
    centerTitle: true,
  )

      ,textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      )
      ,   bodyMedium: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor
  )
      ,titleLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor
  )
  )
  );
}