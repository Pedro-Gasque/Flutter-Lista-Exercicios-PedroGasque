// Pedro Gasque da Silva 202410184

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AgeVerify());
  }
}

class AgeVerify extends StatefulWidget {
  const new({super.key});

  @override
  State<AgeVerify> createState() => _AgeVerifyState();
}

class _AgeVerifyState extends State<AgeVerify> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  String resultado = '';

  int converteIdade() {
    return int.tryParse(idadeController.text) ?? 0;
  }

  void verificaIdade() {
    String nome = nomeController.text;
    setState(() {
      if (converteIdade() >= 18) {
        resultado = '$nome é maior de idade';
      } else {
        resultado = '$nome é menor de idade';
      }
    });
  }

  void limpar() {
    nomeController.clear();
    idadeController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    idadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verificador de Idade'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Digite Seu Nome:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: idadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite Sua Idade:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: verificaIdade,
                  child: Text('Mostrar'),
                ),
                SizedBox(width: 20),
                ElevatedButton(onPressed: limpar, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 30),
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
