import 'package:flutter/material.dart';
import 'package:flutter_calculator_leviettien/config/color/app_color.dart';
import 'package:flutter_calculator_leviettien/feature/screen/calculator_app.dart';
import 'package:flutter_calculator_leviettien/feature/services/global_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( 
    // khởi tại ChangeNotifierProvider mục đích khai báo CalculatorService cho tất cả các widget con trong main app có thể sử dụng nó mà không phải khai báo nhiều lần truyền từ widget này sang widget kia giúp clean code.
    
    // CalculatorService là services bộ não thực hiện hiển thị tính toán nhận các thao tác click từ người dùng.
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
      // Khai báo font và màu nền, gọi calculator app nó chứa cái widget màn hình và nút bấm.
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
