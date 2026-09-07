//Pedro Gasque da Silva 202410184

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Calculator());
  }
}

class Calculator extends StatefulWidget {
  const new({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();
  String resultado = '';

  double lerNumero1() {
    return double.tryParse(numero1Controller.text) ?? 0;
  }

  double lerNumero2() {
    return double.tryParse(numero2Controller.text) ?? 0;
  }

  void soma() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();
    setState(() {
      resultado = 'Resultado: ${n1 + n2}';
    });
  }

  void subitrair() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();
    setState(() {
      resultado = 'Resultado: ${n1 - n2}';
    });
  }

  void Multiplicar() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();
    setState(() {
      resultado = 'Resultado: ${n1 * n2}';
    });
  }

  void didivir() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();
    setState(() {
      if (n2 != 0) {
        resultado = 'Resultado: ${(n1 / n2).toStringAsFixed(2)}';
      } else if (n2 == 0) {
        resultado = 'Nao e possivel dividir por 0';
      } else {
        resultado = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora')),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: numero1Controller,
              decoration: InputDecoration(
                labelText: 'Primeiro numero',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              controller: numero2Controller,
              decoration: InputDecoration(
                labelText: 'Segundo numero',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: soma, child: Text('+')),
                ElevatedButton(onPressed: subitrair, child: Text('-')),
                ElevatedButton(onPressed: Multiplicar, child: Text('*')),
                ElevatedButton(onPressed: didivir, child: Text('/')),
              ],
            ),
            Text(
              resultado,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
