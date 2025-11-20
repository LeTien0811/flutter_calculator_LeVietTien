import 'package:flutter/material.dart';
import 'package:flutter_calculator_leviettien/config/color/app_color.dart';
import 'package:flutter_calculator_leviettien/feature/screen/calculator_app.dart';
import 'package:flutter_calculator_leviettien/feature/services/global_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CalculatorService(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppColor.Dark_Primary,
      ),
      debugShowCheckedModeBanner: false,
      color: AppColor.Dark_Primary,
      home: const CalculatorApp(),
    );
  }
}
