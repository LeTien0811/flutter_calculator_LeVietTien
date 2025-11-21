import 'package:flutter/material.dart';
import 'package:flutter_calculator_leviettien/config/color/app_color.dart';
import 'package:flutter_calculator_leviettien/feature/services/global_service.dart';
import 'package:provider/provider.dart';

class CustomCalculatorButton extends StatelessWidget {
  final String ValueButton;
  final Color ButtonColor;

  // nút bấm được custom màu sắc radius vvv, cùng với sự kiện được click gọi đến hàm được cấu trúc sẵn trong bộ não services.

  const CustomCalculatorButton({
    super.key,
    required this.ValueButton,
    required this.ButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    final calc = context.watch<CalculatorService>();
    return ElevatedButton(
      onPressed: () {
        calc.input(ValueButton);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero,
        fixedSize: Size(
            MediaQuery.of(context).size.width / 4 - 20, // Tự động tính chiều rộng
            MediaQuery.of(context).size.width / 4 - 20 // Tự động tính chiều cao (tròn)
        ),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: ButtonColor,
        foregroundColor: AppColor.White,
        padding: EdgeInsets.zero, 
      ),
      child: Text(
        ValueButton,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: 32,
        ),
      ),
    );
  }
}
