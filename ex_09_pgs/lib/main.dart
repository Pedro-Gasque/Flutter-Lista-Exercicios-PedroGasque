//Pedro Gasque da Silva 202410184

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SimpleSale());
  }
}

class SimpleSale extends StatefulWidget {
  const new({super.key});

  @override
  State<SimpleSale> createState() => _SimpleSaleState();
}

class _SimpleSaleState extends State<SimpleSale> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController qtdeController = TextEditingController();
  String produto = '';
  String unitPreco = '';
  String quantidade = '';
  String subtotal = '';
  String desconto = '';
  String total = '';

  double convertePreco() {
    return double.tryParse(precoController.text) ?? 0;
  }

  int converteQtde() {
    return int.tryParse(qtdeController.text) ?? 0;
  }

  void calcularPreco() {
    String nome = nomeController.text;
    int qtde = converteQtde();
    double preco = convertePreco();
    double subtt = preco * qtde;
    double desc;
    double tt;
    setState(() {
      produto = 'Produto: $nome';
      unitPreco = 'Preço unitario: R\$$preco';
      quantidade = 'Quantidade: $qtde';
      if (subtt >= 500) {
        desc = subtt * 0.1;
        tt = subtt - desc;

        subtotal = 'SubTotal: R\$${subtt.toStringAsFixed(2)}';
        desconto = 'Desconto: R\$${desc.toStringAsFixed(2)}';
        total = 'Total: R\$${tt.toStringAsFixed(2)}';
      } else {
        subtotal = 'SubTotal: R\$${subtt.toStringAsFixed(2)}';
        desconto = 'Desconto: R\$ 0.00';
        total = 'Total: R\$${subtt.toStringAsFixed(2)}';
      }
    });
  }

  void limpar() {
    nomeController.clear();
    precoController.clear();
    qtdeController.clear();
    setState(() {
      produto = '';
      unitPreco = '';
      quantidade = '';
      subtotal = '';
      desconto = '';
      total = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    precoController.dispose();
    qtdeController.dispose();
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
              controller: nomeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite o nome do produto:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite preço do produto:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: qtdeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite quantidade desejada do produto:',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: calcularPreco,
                  child: Text('Calcular'),
                ),
                SizedBox(width: 20),
                ElevatedButton(onPressed: limpar, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 30),
            Text(
              produto,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              unitPreco,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              quantidade,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              subtotal,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              desconto,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              total,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
