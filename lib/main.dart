import 'package:flutter/material.dart';
import 'math_operations.dart';  // Importa la clase que creaste

void main() {
  runApp( MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),  // Página principal
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _result = '';

  final MathOperations mathOperations = MathOperations();

  void _calculate(String operation) {
    final double num1 = double.tryParse(_controller1.text) ?? 0;
    final double num2 = double.tryParse(_controller2.text) ?? 0;
    double result;

    try {
      switch (operation) {
        case 'add':
          result = mathOperations.add(num1, num2);
          break;
        case 'subtract':
          result = mathOperations.subtract(num1, num2);
          break;
        case 'multiply':
          result = mathOperations.multiply(num1, num2);
          break;
        case 'divide':
          result = mathOperations.divide(num1, num2);
          break;
        default:
          result = 0;
      }
      setState(() {
        _result = 'Resultado: $result';
      });
    } catch (e) {
      setState(() {
        _result = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número 1',
              ),
            ),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número 2',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _calculate('add'),
                  child: const Text('Suma'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('subtract'),
                  child: const Text('Resta'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('multiply'),
                  child: const Text('Multiplicación'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('divide'),
                  child: const Text('División'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
