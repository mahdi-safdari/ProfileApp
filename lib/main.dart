import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/core/theme.dart';
import 'package:profile/home_screen/home_screen.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;
  IconData iconDataTheme = CupertinoIcons.sun_max_fill;
  Locale _locale = const Locale('en');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: themeMode == ThemeMode.dark ? MyAppThemeConfig.dark().getThemeData(_locale.languageCode) : MyAppThemeConfig.light().getThemeData(_locale.languageCode),
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: HomeScreen(
        selectedLanguageChanged: (Language newSelectLanguage) {
          setState(() {
            _locale = newSelectLanguage == Language.en ? const Locale('en') : const Locale('fa');
          });
        },
        iconDataTheme: iconDataTheme,
        toggleTheme: () {
          setState(() {
            if (themeMode == ThemeMode.dark) {
              iconDataTheme = CupertinoIcons.moon_fill;
              themeMode = ThemeMode.light;
            } else {
              iconDataTheme = CupertinoIcons.sun_max_fill;
              themeMode = ThemeMode.dark;
            }
          });
        },
      ),
    );
  }
}
