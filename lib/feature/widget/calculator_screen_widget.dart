import 'package:flutter/material.dart';
import 'package:flutter_calculator_leviettien/config/color/app_color.dart';
import 'package:flutter_calculator_leviettien/feature/services/global_service.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreen();
}

class _CalculatorScreen extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    // gọi đến bộ não để hiển thị các phép tính.
    final calc = context.watch<CalculatorService>();
    return Container(
      padding: const EdgeInsets.all(16),
      width: 440,
      height: 411.5,
      alignment: Alignment.bottomRight,
      child: Text(
        calc.display,
        style: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.w300, 
          color: AppColor.White, 
        ),
        textAlign: TextAlign.right,
        maxLines: 1, 
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
