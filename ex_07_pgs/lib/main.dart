//Pedro Gasque da SIlva 202410184

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
      home: MoneyAdjustment(),
    );
  }
}

class MoneyAdjustment extends StatefulWidget {
  const new({super.key});

  @override
  State<MoneyAdjustment> createState() => _MoneyAdjustmentState();
}

class _MoneyAdjustmentState extends State<MoneyAdjustment> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController salarioController = TextEditingController();
  final TextEditingController percentualController = TextEditingController();
  String funcionario = '';
  String salario = '';
  String aumento = '';
  String reajuste = '';

  double converteSalario() {
    return double.tryParse(salarioController.text) ?? 0;
  }

  double convertePercentual() {
    return double.tryParse(percentualController.text) ?? 0;
  }

  void reajusteSalarial() {
    String nome = nomeController.text;
    double sal = converteSalario();
    double valor = sal * convertePercentual() / 100;
    double novoSalario = sal + valor;

    setState(() {
      funcionario = 'Funcionário(a): $nome';
      salario = 'Salário atual: $sal';
      aumento = 'Aumento: $valor';
      reajuste = 'Novo Salarário: $novoSalario';
    });
  }

  void Limpar() {
    nomeController.clear();
    salarioController.clear();
    percentualController.clear();
    setState(() {
      funcionario = '';
      salario = '';
      aumento = '';
      reajuste = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    salarioController.dispose();
    percentualController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reajuste Salarial'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Digite seu Nome:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: salarioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite seu salário:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: percentualController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite a porccentagem de aumento:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: reajusteSalarial,
                  child: Text('Calcular'),
                ),
                SizedBox(width: 20),
                ElevatedButton(onPressed: Limpar, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 15),
            Text(
              funcionario,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              salario,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              aumento,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              reajuste,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
