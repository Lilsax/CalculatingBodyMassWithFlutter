import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Input_page.dart';
import 'package:bmi/Constants.dart';

class Result extends StatelessWidget {
  Result(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCOUTER'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: NewWidget(
              color: Color(0xFF1D1E33),
              wiidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(fontSize: 22, color: Colors.lightGreen),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Center(
                    child: Text(
                      interpretation,
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Center(
                child: Text(
                  'RECALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              margin: EdgeInsets.only(top: 10),
              color: Color(0xFFEB1555),
              width: double.infinity,
              height: kHeeight,
            ),
          ),
        ],
      ),
    );
  }
}
