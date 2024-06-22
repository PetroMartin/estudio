import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData getTheme(String theme) {
    switch (theme) {
      case 'light':
        return ThemeData(
          scaffoldBackgroundColor: AppColors.primaryColor,
          dialogBackgroundColor: AppColors.primaryColor,
          primaryColor: AppColors.primaryColor,
          appBarTheme: AppBarTheme(
            color: AppColors.primaryColor, // Fondo de la AppBar
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.black,
            shape: CircularNotchedRectangle(),
          ),
          //accentColor: AppColors.accentColor,
          // Configura otros estilos para el tema claro
        );
      case 'dark':
        return ThemeData(
          primaryColor: Colors.grey[900],

          //accentColor: Colors.teal,
          // Configura otros estilos para el tema oscuro
        );
      default:
        return ThemeData.light().copyWith(
          scaffoldBackgroundColor: AppColors.primaryColor,
          dialogBackgroundColor: AppColors.primaryColor,
          primaryColor: AppColors.primaryColor,
          //accentColor: AppColors.accentColor,
          // Configura otros estilos para el tema claro
        );
    }
  }
}
