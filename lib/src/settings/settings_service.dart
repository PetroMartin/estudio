class SettingsService {
  static const String defaultTheme = 'light';

  Future<String?> getTheme() async {
    // Implementa la lógica para obtener el tema guardado
    // Puedes usar SharedPreferences, una base de datos, etc.
    return null; // Devuelve null si no hay un tema guardado
  }

  Future<void> setTheme(String theme) async {
    // Implementa la lógica para guardar el tema
    // Puedes usar SharedPreferences, una base de datos, etc.
  }

  String getDefaultTheme() {
    return defaultTheme;
  }
}