import 'package:flutter/material.dart';
import 'login/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // 🔥 GLOBAL FONT
      theme: ThemeData(
        fontFamily: 'DMSans',
         textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'DMSans'),
          bodyMedium: TextStyle(fontFamily: 'DMSans'),
          titleLarge: TextStyle(fontFamily: 'DMSans'),
          titleMedium: TextStyle(fontFamily: 'DMSans'),
          titleSmall: TextStyle(fontFamily: 'DMSans'),
        ),
      ),

      home: const SplashScreen(),
    );
  }
}