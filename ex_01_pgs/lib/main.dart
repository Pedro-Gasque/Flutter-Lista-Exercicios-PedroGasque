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
      home: UserIdentifier(),
    );
  }
}

class UserIdentifier extends StatefulWidget {
  const new({super.key});

  @override
  State<UserIdentifier> createState() => _UserIdentifierState();
}

class _UserIdentifierState extends State<UserIdentifier> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  String mensagem = '';

  void IdentificarUsuario() {
    String nome = nomeController.text;
    String cidade = cidadeController.text;
    setState(() {
      mensagem = 'Olá, $nome! Você mora na cidade: $cidade';
    });
  }

  void Limpar() {
    nomeController.clear();
    cidadeController.clear();

    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    cidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Identificador de usuário'),
        centerTitle: true,
      ),
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
              controller: cidadeController,
              decoration: InputDecoration(
                labelText: 'Digite Sua Cidade:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: IdentificarUsuario,
                  child: Text('Mostrar'),
                ),
                SizedBox(width: 20),
                ElevatedButton(onPressed: Limpar, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 20),
            Text(
              mensagem,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
