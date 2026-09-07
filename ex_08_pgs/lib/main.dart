//Pedro Gasque da Silva 202410184

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FuelConsume());
  }
}

class FuelConsume extends StatefulWidget {
  const new({super.key});

  @override
  State<FuelConsume> createState() => _FuelConsumeState();
}

class _FuelConsumeState extends State<FuelConsume> {
  final TextEditingController distController = TextEditingController();
  final TextEditingController consuController = TextEditingController();
  String consumo = '';
  String classifica = '';

  double converteDist() {
    return double.tryParse(distController.text) ?? 0;
  }

  double converteConsu() {
    return double.tryParse(consuController.text) ?? 0;
  }

  void distanciaLitro() {
    double distLitro = converteDist() / converteConsu();
    setState(() {
      consumo = 'Consumo médio: ${distLitro.toStringAsFixed(2)} Km/L';
      if (distLitro >= 12) {
        classifica = 'Classificação: Econômico';
      } else {
        classifica = 'Classificação: Consumo Elevado';
      }
    });
  }

  void limpar() {
    distController.clear();
    consuController.clear();
    setState(() {
      consumo = '';
      classifica = '';
    });
  }

  @override
  void dispose() {
    distController.dispose();
    consuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consumo de Combustivel'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: distController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite a distancia em Km:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: consuController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite quantro litros foram consumidos:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: distanciaLitro,
                  child: Text('Calcular'),
                ),
                SizedBox(width: 20),
                ElevatedButton(onPressed: limpar, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 30),
            Text(
              consumo,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              classifica,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
