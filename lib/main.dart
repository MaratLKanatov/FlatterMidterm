import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());


Color textcolor = Colors.white;
Color btncolor = Colors.grey[700]!;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCalculator(),
    );
  }

  

}


class MyCalculator extends StatefulWidget {
  MyCalculator({Key? key}) : super(key: key);

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
Widget calculatorItem(String btntxt,Color btncolor,Color txtcolor){
    return  Container(
      child: RaisedButton(
        onPressed: (){
          btnWork(btntxt);
        }, 
        child: Text('$btntxt',
          style: TextStyle(
            fontSize: 76,
            color: txtcolor,
          ),
        ),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ),
      width: 120,
    );
  }

  Widget calculatorItem2(String btntxt,Color btncolor,Color txtcolor){
    return  Container(
      child: RaisedButton(
        onPressed: (){
          btnWork(btntxt);
        }, 
        child: Text('$btntxt',
          style: TextStyle(
            fontSize: 76,
            color: txtcolor,
          ),
        ),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ),
      width: 242,
    );
  }

  dynamic text ='0';
  double num1 = 0;
  double num2 = 0;
  dynamic lastOperation = '';

  void btnWork(String btntext) {
    switch (btntext) {
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '0':
      if (text.toString().endsWith('.0')) {
        text = text.toString().substring(0, text.toString().length-1) + btntext;
        setText(text);
      } else if (text == '0') {
        setText(btntext);
      } else {
        setText(text + btntext);
      }
      break;
      case 'C':
      setText('0');
      num1 = 0;
      num2 = 0;
      break;
      case 'x':
      case '/':
      case '-':
      case '+':
      if (text != '0') {
        if (num1 == 0) {
          num1 = double.parse(text);
          lastOperation = btntext;
          setText('0');
        }
      }
      break;
      case '=':
      if (text != '0') {
        if (num2 == 0) {
          num2 = double.parse(text);
          double res = 0;
          switch (lastOperation) {
            case 'x':
            res = num1 * num2;
            break;
            case '/':
            res = num1 / num2;
            break;
            case '-':
            res = num1 - num2;
            break;
            case '+':
            res = num1 + num2;
            break;
          }
          setText(res.toStringAsFixed(2));
          num1 = 0;
          num2 = 0;
        }
      }
      break;
      case '.':
      if (!text.toString().contains('.')) {
        text += '.';
        setText(text);
      }
      break;
    }
  }

  void setText(String textt) {
    setState(() {
          text = textt;
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator App'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('$text',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                    ),
                  ),
                  )
                ],
            ),
            Row(children: [
              calculatorItem('C', btncolor, textcolor),
              calculatorItem('+/-', btncolor, textcolor),
              calculatorItem('%', btncolor, textcolor),
              calculatorItem('/', Colors.orange, textcolor),
            ], mainAxisAlignment: MainAxisAlignment.spaceAround,),
            Row(children: [
              calculatorItem('7', btncolor, textcolor),
              calculatorItem('8', btncolor, textcolor),
              calculatorItem('9', btncolor, textcolor),
              calculatorItem('x', Colors.orange, textcolor),
            ], mainAxisAlignment: MainAxisAlignment.spaceAround,),
            Row(children: [
              calculatorItem('4', btncolor, textcolor),
              calculatorItem('5', btncolor, textcolor),
              calculatorItem('6', btncolor, textcolor),
              calculatorItem('-', Colors.orange, textcolor),
            ], mainAxisAlignment: MainAxisAlignment.spaceAround,),
            Row(children: [
              calculatorItem('1', btncolor, textcolor),
              calculatorItem('2', btncolor, textcolor),
              calculatorItem('3', btncolor, textcolor),
              calculatorItem('+', Colors.orange, textcolor),
            ], mainAxisAlignment: MainAxisAlignment.spaceAround,),
            Row(children: [
              calculatorItem2('0', btncolor, textcolor),
              calculatorItem('.', btncolor, textcolor),
              calculatorItem('=', Colors.orange, textcolor),
            ], mainAxisAlignment: MainAxisAlignment.spaceAround,),
          ],
        ),),
        backgroundColor: Colors.grey[850],
      ), 
    );
  }
}