// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController entradaController = TextEditingController();

  late String resultado = "";

  void calculate() {
    int soma = 0; int i;

    //Recebe o valor do controller como inteiro
    dynamic entrada = int.parse(entradaController.text);

    //Percorre todo os números do valor inserido e SE for divisivel fará a soma
    for (i = 0; i < entrada; i++) {
      if ((i % 3) == 0 || (i % 5) == 0) {
        soma += i;
      }
    }

    //Atualiza a tela ao inserir um novo valor
    setState(() {
      resultado = "O valor do somatório de todos os valores inferiores a $entrada, divisiveis por 3 e 5 é $soma";
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Minhas Contas"), backgroundColor: Colors.purple),
      body: Center(
        child: Column(
          children: [
            //Input de entrada dos valores
            Container(
              margin: EdgeInsets.only(top: 50),
              width: 250,
              height: 100,
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Insira um número",
                        labelStyle: TextStyle(color: Colors.green)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 20.0),
                    controller: entradaController,
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          calculate();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text('Somar',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 15.0)),
                        )),
                  )
                ],
              ),
            ),

            //output para saida dos valores
            Container(
              margin: EdgeInsets.only(top: 40),
              width: 190,
              height: 100,
              child: Text(resultado, style: TextStyle(color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}
