import 'package:flutter/material.dart';
import 'settings_service.dart';
class SettingsController with ChangeNotifier {
  final SettingsService _settingsService;
  String _theme = '';

  SettingsController(this._settingsService) {
    _theme = _settingsService.getDefaultTheme(); // Línea 11
  }

  String get theme => _theme;

  Future<void> setTheme(String theme) async {
    _theme = theme;
    await _settingsService.setTheme(theme);
    notifyListeners();
  }

  Future<void> loadSettings() async {
    final theme = await _settingsService.getTheme();
    if (theme != null) {
      _theme = theme;
    }
    notifyListeners();
  }

  // ...
}


















