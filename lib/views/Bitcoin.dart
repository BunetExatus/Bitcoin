import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Bitcoin extends StatefulWidget {
  const Bitcoin({super.key});

  @override
  State<Bitcoin> createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {

  String _preco ="0";
  void _recuperarPreco() async{

  var url =Uri.parse("https://blockchain.info/ticker");
  http.Response response = await http.get(url);
  Map<String, dynamic> retorno = json.decode(response.body);
  setState ((){
    _preco = retorno["BRL"]["buy"].toString();
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        title: Text("Bitcoin"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset("imagens/bitcoin.png"),
            SizedBox(height: 45,),
            Text("R\$ $_preco", style: TextStyle(fontSize: 35),),
            SizedBox(height: 35,),
            TextButton(onPressed: (){_recuperarPreco();},
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
            child: const Text("Atualizar", style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
            SizedBox(height: 45,),
            Text("Calculando o preço do Bitcoin", style: TextStyle(fontSize: 35, color: const Color.fromARGB(255, 143, 114, 27)),),
            SizedBox(height: 45,),
            Image.asset("imagens/Bitcoin.jpg"),
          ]
          ),
          
        )
       ),
    );
  }
}