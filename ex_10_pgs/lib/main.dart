//Pedro Gasque da Silva 202410184

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Estoque());
  }
}

class Estoque extends StatefulWidget {
  const new({super.key});

  @override
  State<Estoque> createState() => _EstoqueState();
}

class _EstoqueState extends State<Estoque> {
  final TextEditingController qtdeController = TextEditingController();

  int estoque = 0;
  String mensagem = '';

  int converteQtde() {
    return int.tryParse(qtdeController.text) ?? 0;
  }

  void entrada() {
    setState(() {
      estoque = estoque + converteQtde();
      mensagem = 'Entrada de Estoque realizada com sucesso!';
    });
  }

  void saida() {
    setState(() {
      if (estoque - converteQtde() >= 0) {
        estoque = estoque - converteQtde();
        mensagem = 'Saída de Estoque realizada com sucesso!';
      } else {
        mensagem = 'Estoque insufuciente, operaçao não realizada!';
      }
    });
  }

  void limpar() {
    qtdeController.clear();
    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    qtdeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Estoque'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: qtdeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText:
                    'Insira a quantidade de Entrada ou Saida do estoque: ',
                border: OutlineInputBorder(),
              ),
            ),
            Text(
              'Quantidade Atual: $estoque',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: entrada, child: Text('Entrada')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: saida, child: Text('Saída')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: limpar, child: Text('Limpar')),
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
