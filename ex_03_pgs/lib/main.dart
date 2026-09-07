// Pedro Gasque da Silva 202410184

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AntSucc());
  }
}

class AntSucc extends StatefulWidget {
  const new({super.key});

  @override
  State<AntSucc> createState() => _AntSuccState();
}

class _AntSuccState extends State<AntSucc> {
  final TextEditingController numeroController = TextEditingController();
  String numero = '';
  String sucessor = '';
  String antecessor = '';

  int converteNumero() {
    return int.tryParse(numeroController.text) ?? 0;
  }

  void antecessorSucessor() {
    String num = numeroController.text;
    int ant = converteNumero() - 1;
    int suc = converteNumero() + 1;

    setState(() {
      numero = 'Número: $num';
      antecessor = 'Antecessor: $ant';
      sucessor = 'Sucessor: $suc';
    });
  }

  void limpar() {
    numeroController.clear();
    setState(() {
      numero = '';
      sucessor = '';
      antecessor = '';
    });
  }

  @override
  void dispose() {
    numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Antecessor e Sucessor'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite um numero:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: antecessorSucessor,
                  child: Text('Mostrar'),
                ),
                SizedBox(width: 20),
                ElevatedButton(onPressed: limpar, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 30),
            Text(
              numero,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              antecessor,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              sucessor,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
