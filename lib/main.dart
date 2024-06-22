import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'src/splash_screen.dart';
import 'src/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  await dotenv.load();
  final settingsController = SettingsController(SettingsService());
  final String? theme = dotenv.env['THEME'];

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  if (theme != null) {
    await settingsController.setTheme(theme);
  }
  await settingsController.loadSettings();

  // Simula una carga de datos durante 2 segundos
  await Future.delayed(const Duration(seconds: 2));

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MaterialApp(
    home: const SplashScreen(), // Muestra la pantalla de splash
    routes: {
      '/app': (context) => MyApp(settingsController: settingsController),
    },
    theme: AppTheme.getTheme(settingsController.theme),
  ));
}
