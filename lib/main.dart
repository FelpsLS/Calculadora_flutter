import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numb = '0';
  double firstNumb = 0.0;
  String operacao = '';

  void calcular(String tecla) {
    switch (tecla) {
      case '0':
        setState(() {
          numb += tecla;

          if (numb.contains(',')) {
            double numbD = double.parse(numb);
            numb = numbD.toString();
          } else {
            int numbI = int.parse(numb);
            numb = numbI.toString();
          }
        });
        break;
      case '1':
        setState(() {
          numb += tecla;
        });
        break;
      case '2':
        setState(() {
          numb += tecla;
        });
        break;
      case '3':
        setState(() {
          numb += tecla;
        });
        break;
      case '4':
        setState(() {
          numb += tecla;
        });
        break;
      case '5':
        setState(() {
          numb += tecla;
        });
        break;
      case '6':
        setState(() {
          numb += tecla;
        });
        break;
      case '7':
        setState(() {
          numb += tecla;
        });
        break;
      case '8':
        setState(() {
          numb += tecla;
        });
        break;
      case '9':
        setState(() {
          numb += tecla;
        });
        break;
      case 'AC':
        setState(() {
          numb = '0';
        });
        break;
      case '%':
        break;
      case '/':
        break;
      case 'x':
        break;
      case '-':
        break;
      case '+':
        operacao = '+';
        numb = numb.replaceAll(',', '.');
        firstNumb = double.parse(numb);
        numb = numb.replaceAll('.', ',');
        numb = '0';
        break;
      case ',':
        setState(() {
          numb += tecla;
          numb = numb.replaceAll(',', '.');

          try {
            if (numb.contains('.')) {
              // double numbD = double.parse(numb);
              // numb = numbD.toString();
            } else {
              int numbI = int.parse(numb);
              numb = numbI.toString();
            }
          } catch (e) {
            print("Erro ao converter o numero: $e");
          }
          numb = numb.replaceAll('.', ',');
        });
        break;
      case '=':
        double result = 0.0;
        try {
          if (operacao == '+') {
            result = firstNumb + double.parse(numb);
          }

          String resultString = result.toString();
          //3 . 0
          //parte1 = 3, parte2 = 0

          List<String> resultParts = resultString.split('.');
          //print(resultParts);

          if (int.parse(resultParts[1]) * 1 == 0) {
            //print("parte fracionaria zero");
            setState(() {
              numb = int.parse(resultParts[0]).toString();
            });

          } else {
            setState(() {
              numb = result.toString();
            });

          }
        } catch (e) {
          print("Erro ao realizar a operacao: $e");
        }
        break;

      default:
        numb += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("Calculadora"),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  numb,
                  style: TextStyle(fontSize: 70),
                ),
              ]),
              //Text("Coluna 1"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => calcular('AC'),
                    child: Text(
                      "AC",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('<x'),
                    child: Text(
                      "<x",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('%'),
                    child: Text(
                      "%",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('/'),
                    child: Text(
                      "/",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                ],
              ),
              //Text("Coluna 2"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      //print("Clicou 7");
                      calcular('7');
                    },
                    child: Text(
                      "7",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('8'),
                    child: Text(
                      "8",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('9'),
                    child: Text(
                      "9",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('x'),
                    child: Text(
                      "x",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                ],
              ),
              //Text("Coluna 3"),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                GestureDetector(
                  onTap: () => calcular('4'),
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('5'),
                  child: Text(
                    "5",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('6'),
                  child: Text(
                    "6",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                Text(
                  "-",
                  style: TextStyle(fontSize: 48),
                ),
              ]),
              //Text("Coluna 4"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => calcular('1'),
                    child: Text(
                      "1",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('2'),
                    child: Text(
                      "2",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('3'),
                    child: Text(
                      "3",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('+'),
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                ],
              ),
              //Text("Coluna 5"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => calcular('0'),
                    child: Text(
                      "0",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular(','),
                    child: Text(
                      ",",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => calcular('='),
                    child: Text(
                      "=",
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                ],
              ),
              Text("Coluna 6"),
            ],
          )),
    );
  }
}
