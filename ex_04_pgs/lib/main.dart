// Pedro Gasque da Silva 202410184

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  const new({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController tempController = TextEditingController();
  String resultado = '';

  double lerTemp() {
    return double.tryParse(tempController.text) ?? 0;
  }

  void convert() {
    double fTemp = (lerTemp() * 9 / 5) + 32;
    setState(() {
      resultado = 'Temperatura em fahrenheit: $fTemp °F';
    });
  }

  void limpar() {
    tempController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    tempController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversor Celsius Fahrenheit')),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: tempController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Temperatura em Celsius:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: convert, child: Text('Converter')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: limpar, child: Text('Limpar')),
              ],
            ),
            Text(
              resultado,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
