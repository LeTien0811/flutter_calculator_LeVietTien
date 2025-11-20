import 'package:flutter/material.dart';
import 'package:flutter_calculator_leviettien/config/color/app_color.dart';
import 'package:flutter_calculator_leviettien/feature/services/global_service.dart';
import 'package:flutter_calculator_leviettien/feature/widget/custom_calculator_button.dart';
import 'package:provider/provider.dart';

class CalculatorGridButton extends StatefulWidget {
  const CalculatorGridButton({super.key});

  @override
  State<CalculatorGridButton> createState() => _CalculatorGridButtonState();
}

class _CalculatorGridButtonState extends State<CalculatorGridButton> {
  @override
  Widget build(BuildContext context) {
    final calc = context.watch<CalculatorService>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomCalculatorButton(
                ValueButton: 'C',
                ButtonColor: AppColor.Red,
              ),
              CustomCalculatorButton(
                ValueButton: '( )',
                ButtonColor: AppColor.DarK_Secondary,
              ),
              CustomCalculatorButton(
                ValueButton: '%',
                ButtonColor: AppColor.DarK_Secondary,
              ),
              CustomCalculatorButton(
                ValueButton: '/',
                ButtonColor: AppColor.Green_Primary,
              ),
            ],
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomCalculatorButton(
                ValueButton: '7',
                ButtonColor: AppColor.DarK_Secondary,
              ),
              CustomCalculatorButton(
                ValueButton: '8',
                ButtonColor: AppColor.DarK_Secondary,
              ),
              CustomCalculatorButton(
                ValueButton: '9',
                ButtonColor: AppColor.DarK_Secondary,
              ),
              CustomCalculatorButton(
                ValueButton: 'x',
                ButtonColor: AppColor.Green_Primary,
              ),
            ],
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomCalculatorButton(
                ValueButton: '4',
                ButtonColor: AppColor.DarK_Secondary,
              ),
              CustomCalculatorButton(
                ValueButton: '5',
                ButtonColor: AppColor.DarK_Secondary,
              ),
              CustomCalculatorButton(
                ValueButton: '6',
                ButtonColor: AppColor.DarK_Secondary,
              ),
              CustomCalculatorButton(
                ValueButton: '-',
                ButtonColor: AppColor.Green_Primary,
              ),
            ],
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomCalculatorButton(
                ValueButton: '1',
                ButtonColor: AppColor.DarK_Secondary,
              ),
              CustomCalculatorButton(
                ValueButton: '2',
                ButtonColor: AppColor.DarK_Secondary,
              ),
              CustomCalculatorButton(
                ValueButton: '3',
                ButtonColor: AppColor.DarK_Secondary,
              ),
              CustomCalculatorButton(
                ValueButton: '+',
                ButtonColor: AppColor.Green_Primary,
              ),
            ],
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsetsGeometry.all(0),
                child: ElevatedButton(
                  onPressed: () {
                    calc.input("+/-");
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(94.5, 94.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    backgroundColor: AppColor.DarK_Secondary,
                    foregroundColor: AppColor.White,
                  ),
                  child: Text(
                    '+/-',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),

              CustomCalculatorButton(
                ValueButton: '0',
                ButtonColor: AppColor.DarK_Secondary,
              ),
              CustomCalculatorButton(
                ValueButton: '.',
                ButtonColor: AppColor.DarK_Secondary,
              ),
              CustomCalculatorButton(
                ValueButton: '=',
                ButtonColor: AppColor.Green_Secondary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
