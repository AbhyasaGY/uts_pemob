import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',  // Set font utama menjadi Poppins
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
          bodyLarge: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
