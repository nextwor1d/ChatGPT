import 'package:hive_flutter/hive_flutter.dart';

class ThemeRepository {
  Box themeBox = Hive.box("themeBox");
  var isDarkMode = true;

  loadTheme() {
    isDarkMode = themeBox.get('theme', defaultValue: true);
    return isDarkMode;
  }

  changeTheme() {
    isDarkMode = !isDarkMode;
    themeBox.put('theme', isDarkMode);
  }
}
