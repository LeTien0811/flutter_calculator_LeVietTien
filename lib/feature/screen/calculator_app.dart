import 'package:flutter/material.dart';
import 'package:flutter_calculator_leviettien/feature/widget/calculator_grid_button_widget.dart';
import 'package:flutter_calculator_leviettien/feature/widget/calculator_screen_widget.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorApp();
}

class _CalculatorApp extends State<CalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CalculatorScreen(),
            CalculatorGridButton(),
            ],
        ),
      ),
    );
  }
}
