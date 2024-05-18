import 'package:flutter/material.dart';

import 'package:json_theme/json_theme.dart';

import 'package:flutter/services.dart'; // For rootBundle
import 'dart:convert'; // For jsonDecode

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStrLight =
      await rootBundle.loadString('assets/appainter_theme_light.json');
  final themeJsonLight = jsonDecode(themeStrLight);
  final themeLight = ThemeDecoder.decodeThemeData(themeJsonLight)!;

  final themeStrDark =
      await rootBundle.loadString('assets/appainter_theme_dark.json');
  final themeJsonDark = jsonDecode(themeStrDark);
  final themeDark = ThemeDecoder.decodeThemeData(themeJsonDark)!;

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(
      settingsController: settingsController,
      themeLight: themeLight,
      themeDark: themeDark));
}
