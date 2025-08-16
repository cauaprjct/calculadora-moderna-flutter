import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Moderna',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.openSansTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFE0E0E0),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.openSansTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      themeMode: ThemeMode.system,
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';
  String _currentInput = '0';
  bool _isResultDisplayed = false;
  String? _operation;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isDarkMode = Theme.of(context).brightness == Brightness.dark;
      });
    });
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _onButtonPressed(String buttonText) {
    setState(() {
      // Handle clear button
      if (buttonText == 'C') {
        _output = '0';
        _currentInput = '0';
        _isResultDisplayed = false;
        _operation = null;
        return;
      }

      // Handle backspace
      if (buttonText == '⌫') {
        if (_currentInput.length > 1) {
          _currentInput = _currentInput.substring(0, _currentInput.length - 1);
        } else {
          _currentInput = '0';
        }
        _output = _currentInput;
        _isResultDisplayed = false;
        return;
      }

      // Handle numbers and decimal point
      if (RegExp(r'^[0-9.]$').hasMatch(buttonText)) {
        if (_isResultDisplayed) {
          _currentInput = buttonText == '.' ? '0.' : buttonText;
          _isResultDisplayed = false;
        } else {
          if (buttonText == '.') {
            if (!_currentInput.contains('.')) {
              _currentInput += '.';
            }
          } else {
            if (_currentInput == '0') {
              _currentInput = buttonText;
            } else {
              _currentInput += buttonText;
            }
          }
        }
        _output = _currentInput;
        return;
      }

      // Handle operations
      if (['+', '-', '×', '÷'].contains(buttonText)) {
        if (_operation != null && !_isResultDisplayed) {
          _calculateResult();
        }
        _operation = buttonText;
        _isResultDisplayed = true;
        return;
      }

      // Handle equals
      if (buttonText == '=') {
        _calculateResult();
        _operation = null;
        _isResultDisplayed = true;
        return;
      }

      // Handle percentage
      if (buttonText == '%') {
        double value = double.parse(_currentInput);
        _output = (value / 100).toString();
        _currentInput = _output;
        _isResultDisplayed = true;
        return;
      }

      // Handle sign change
      if (buttonText == '+/-') {
        if (_currentInput != '0') {
          if (_currentInput.startsWith('-')) {
            _currentInput = _currentInput.substring(1);
          } else {
            _currentInput = '-$_currentInput';
          }
          _output = _currentInput;
        }
        return;
      }
    });
  }

  void _calculateResult() {
    if (_operation == null) return;

    double firstNumber = double.parse(_output);
    double secondNumber = double.parse(_currentInput);
    double result = 0;

    switch (_operation) {
      case '+':
        result = firstNumber + secondNumber;
        break;
      case '-':
        result = firstNumber - secondNumber;
        break;
      case '×':
        result = firstNumber * secondNumber;
        break;
      case '÷':
        if (secondNumber != 0) {
          result = firstNumber / secondNumber;
        } else {
          _output = 'Erro';
          _currentInput = '0';
          return;
        }
        break;
    }

    // Format result to remove unnecessary decimal places
    if (result == result.toInt()) {
      _output = result.toInt().toString();
    } else {
      _output = result.toString();
    }

    _currentInput = _output;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = _isDarkMode; // Use the state variable
    final theme = isDark ? ThemeData.dark() : ThemeData.light();
    
    return Theme(
      data: isDark 
        ? ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
            ),
            textTheme: GoogleFonts.openSansTextTheme().apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
            scaffoldBackgroundColor: const Color(0xFF121212),
          )
        : ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.light,
            ),
            textTheme: GoogleFonts.openSansTextTheme(),
            scaffoldBackgroundColor: const Color(0xFFE0E0E0),
          ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculadora Moderna',
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                size: 28,
              ),
              onPressed: _toggleTheme,
              tooltip: isDark ? 'Modo Claro' : 'Modo Escuro',
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: Column(
          children: [
            // Display area
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(24),
                alignment: Alignment.bottomRight,
                child: Text(
                  _output,
                  style: GoogleFonts.openSans(
                    fontSize: 48,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Buttons grid
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFFEEEEEE),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    // First row: Clear, +/-, %, ÷
                    _buildButtonRow([
                      _buildButton('C', isSpecial: true),
                      _buildButton('+/-', isSpecial: true),
                      _buildButton('%', isSpecial: true),
                      _buildButton('÷', isOperation: true),
                    ]),
                    // Second row: 7, 8, 9, ×
                    _buildButtonRow([
                      _buildButton('7'),
                      _buildButton('8'),
                      _buildButton('9'),
                      _buildButton('×', isOperation: true),
                    ]),
                    // Third row: 4, 5, 6, -
                    _buildButtonRow([
                      _buildButton('4'),
                      _buildButton('5'),
                      _buildButton('6'),
                      _buildButton('-', isOperation: true),
                    ]),
                    // Fourth row: 1, 2, 3, +
                    _buildButtonRow([
                      _buildButton('1'),
                      _buildButton('2'),
                      _buildButton('3'),
                      _buildButton('+', isOperation: true),
                    ]),
                    // Fifth row: 0, ., =
                    _buildButtonRow([
                      _buildButton('0', isZero: true),
                      _buildButton('.', isSpecial: true),
                      _buildButton('=', isOperation: true),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<Widget> buttons) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons,
      ),
    );
  }

  Widget _buildButton(
    String text, {
    bool isOperation = false,
    bool isSpecial = false,
    bool isZero = false,
  }) {
    final isDark = _isDarkMode;
    
    Color buttonColor;
    Color textColor = isDark ? Colors.white : Colors.black;
    double buttonSize = isZero ? 160 : 80;

    if (isOperation) {
      buttonColor = isDark ? const Color(0xFFBB86FC) : const Color(0xFF6200EE);
    } else if (isSpecial) {
      buttonColor = isDark ? const Color(0xFF333333) : const Color(0xFFB0B0B0);
    } else {
      buttonColor = isDark ? const Color(0xFF2D2D2D) : const Color(0xFFD4D4D4);
    }

    return GestureDetector(
      onTap: () => _onButtonPressed(text),
      child: Container(
        width: buttonSize,
        height: 80,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: isDark 
                ? Colors.black.withOpacity(0.3) 
                : Colors.grey.withOpacity(0.3),
              offset: const Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.openSans(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}