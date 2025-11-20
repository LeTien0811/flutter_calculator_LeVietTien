import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // 💡 SỬ DỤNG THƯ VIỆN ĐỂ TÍNH TOÁN PHỨC TẠP HƠN (giả định đã thêm)

class CalculatorService extends ChangeNotifier {
  String _display = "0";
  bool _isResult = false; // Theo dõi xem màn hình đang hiển thị kết quả hay không

  String get display => _display;

  void input(String value) {
    if (value == 'C') {
      // CLEAR
      clear();
    } else if (value == '=') {
      // CALCULATE
      calculate();
    } else if (value == '+/-') {
      // NEGATE
      negate();
    } else if (value == '%') {
      // PERCENT
      percent();
    } else if (value == '()') {
      // PARENTHESES - Tùy thuộc vào logic phức tạp, ở đây chỉ thêm dấu mở ngoặc
      _handleParentheses(value); 
    } else {
      // Số hoặc phép toán
      if (_isResult) {
        // Nếu đang hiển thị kết quả, reset nếu nhập số hoặc dấu mở ngoặc
        if (RegExp(r'[0-9\(]').hasMatch(value)) {
          _display = value;
        } else {
          // Nếu nhập phép toán (+, -, /, x), tiếp tục tính toán trên kết quả cũ
          _display += value;
        }
        _isResult = false;
      } else {
        // Xử lý nhập số 0 đầu tiên
        if (_display == "0" && RegExp(r'[0-9]').hasMatch(value)) {
          _display = value;
        } else {
          _display += value;
        }
      }
    }
    notifyListeners();
  }
  
  void _handleParentheses(String value) {
    // Logic đơn giản: Đóng/mở dựa trên số lượng ngoặc đã có
    int openCount = _display.split('(').length - 1;
    int closeCount = _display.split(')').length - 1;

    if (openCount > closeCount) {
      _display += ')';
    } else {
      _display += '(';
    }
  }

  void clear() {
    _display = "0";
    _isResult = false;
  }

  void delete() {
    if (_isResult) return;
    if (_display.length > 1) {
      _display = _display.substring(0, _display.length - 1);
    } else {
      _display = "0";
    }
  }

  void negate() {
    if (_display != '0' && !_isResult) {
      if (_display.startsWith('-')) {
        _display = _display.substring(1);
      } else {
        _display = '-$_display';
      }
    }
  }
  
  void percent() {
    if (_display != '0' && !_isResult) {
      try {
        // Chỉ tính phần trăm nếu đó là một số đơn giản
        double val = double.parse(_display);
        _display = (val / 100).toString();
        _isResult = true;
      } catch (_) {
        // Bỏ qua nếu không thể parse
      }
    }
  }

  void calculate() {
    String finaluserinput = _display.replaceAll('x', '*');

    try {
      // 💡 Sử dụng thư viện Math Expressions để xử lý ngoặc và ưu tiên phép toán
      Parser p = Parser();
      Expression exp = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.values[0], cm);

      _display = eval.toString();
      _isResult = true;
    } catch (e) {
      _display = "Error";
      _isResult = true;
    }
  }
}