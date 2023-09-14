import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de moeda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  TextEditingController _controleReal = TextEditingController();
  TextEditingController _controleDolar = TextEditingController();
  double realValue = 0.0;
  double converteValor1 = 0;
  String _textoResultado = "";
  double resultadoD = 0;
  
  double valorDolar = 4.80; 

  void convertCurrency() {
  }

  void changeImage() {  
  }
  
  void calculo(){
    double? realValue = double.tryParse(_controleReal.text);
    double? valorDolar = double.tryParse(_controleDolar.text);
    
    if (realValue == null || valorDolar == null) {
        setState(() {
          _textoResultado = "Número inválido, digite números maiores ou igual a 0";
        });
  }else{
    resultadoD = realValue*4.81;
   

        if(realValue <0 || realValue.isNaN){
      setState(() {
         _textoResultado = "Digite um número maior ou igual a 0!";
      });
    }else{
      double result = realValue / valorDolar;
      setState(() {
         _textoResultado = 'Valor convertido: $result';
      });
      
    }
  }
}
  

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de moedas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: changeImage,
              child: Image.asset('../images/logo.png'),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Valor em Real',
              ),
              onChanged: (value) {
                setState(() {
                  realValue = double.parse(value);
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Valor Convertido: ($resultadoD)'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Converter'),
            ),
           

          ],
        ),
      ),
    );
  }
}
