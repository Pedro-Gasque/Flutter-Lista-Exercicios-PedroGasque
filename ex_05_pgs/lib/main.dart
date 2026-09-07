// Pedro Gasque da Silva 202410184

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CalcMedia());
  }
}

class CalcMedia extends StatefulWidget {
  const new({super.key});

  @override
  State<CalcMedia> createState() => _CalcMediaState();
}

class _CalcMediaState extends State<CalcMedia> {
  final TextEditingController nota1Controller = TextEditingController();
  final TextEditingController nota2Controller = TextEditingController();
  final TextEditingController nota3Controller = TextEditingController();
  String resultado = '';
  String situacao = '';

  double convertN1() {
    return double.tryParse(nota1Controller.text) ?? 0;
  }

  double convertN2() {
    return double.tryParse(nota2Controller.text) ?? 0;
  }

  double convertN3() {
    return double.tryParse(nota3Controller.text) ?? 0;
  }

  void calcMedia() {
    double media = ((convertN1() + convertN2() + convertN3()) / 3.0);

    setState(() {
      resultado = 'Média: ${media.toStringAsFixed(1)}';
      if (media >= 6) {
        situacao = 'Situação: Aprovado';
      } else {
        situacao = 'Situação: Reprovado';
      }
    });
  }

  void limpar() {
    nota1Controller.clear();
    nota2Controller.clear();
    nota3Controller.clear();
    setState(() {
      resultado = '';
      situacao = '';
    });
  }

  @override
  void dispose() {
    nota1Controller.dispose();
    nota2Controller.dispose();
    nota3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calcular Média')),
      body: Column(
        children: [
          TextField(
            controller: nota1Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Nota 1:',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: nota2Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Nota 2:',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: nota3Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Nota 3:',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: calcMedia, child: Text('Calcular')),
              SizedBox(width: 10),
              ElevatedButton(onPressed: limpar, child: Text('Limpar')),
            ],
          ),
          SizedBox(height: 20),
          Text(
            resultado,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            situacao,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
