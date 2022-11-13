import 'package:bmi/constant/constant.dart';
import 'package:flutter/material.dart';
import 'view/bmi_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
      ),
      home: const bmi(),
    );
  }
}
