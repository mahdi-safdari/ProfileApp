import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/core/theme.dart';
import 'package:profile/home_screen/home_screen.dart';

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
  @override
  Widget build(BuildContext context) {
    const Color surfaceColor = Color(0x0dffffff);
    return MaterialApp(
      title: 'Profile',
      theme: themeMode == ThemeMode.dark ? MyAppThemeConfig.dark().getThemeData() : MyAppThemeConfig.light().getThemeData(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
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
