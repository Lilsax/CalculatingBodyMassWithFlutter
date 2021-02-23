import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants.dart';
import 'Result.dart';
import 'CalculatingBrain.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleColor = inActiveColor;
  // Color femaleColor = inActiveColor;
  //
  Gender selectedGender;
  int Height = 180;
  int weight = 60;
  int age = 18;
  //
  // void updateColor(Gender gender) {
  //   if (gender == Gender.Male) {
  //     if (maleColor == inActiveColor) {
  //       maleColor = activeCardColor;
  //       femaleColor = inActiveColor;
  //     } else {
  //       maleColor = inActiveColor;
  //     }
  //   } else {
  //     if (femaleColor == inActiveColor) {
  //       femaleColor = activeCardColor;
  //       maleColor = inActiveColor;
  //     } else
  //       femaleColor = activeCardColor;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: NewWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    color: selectedGender == Gender.Male
                        ? kActiveCardColor
                        : kInActiveColor,
                    wiidget: DataInisdeFirstCard(
                      iicon: FontAwesomeIcons.mars,
                      textt: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                    child: NewWidget(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  wiidget: DataInisdeFirstCard(
                    iicon: FontAwesomeIcons.venus,
                    textt: 'FEMALE',
                  ),
                  color: selectedGender == Gender.Female
                      ? kActiveCardColor
                      : kInActiveColor,
                )),
              ],
            ),
          ),
          Expanded(
              child: NewWidget(
            color: Color(0xFF1D1E33),
            wiidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "HEIGHT",
                  style: kStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      Height.toString(),
                      style: kNumberStyle,
                    ),
                    Text(
                      "cm",
                      style: kStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    overlayColor: Color(0x29EB1555),
                  ),
                  child: Slider(
                    value: Height.toDouble(),
                    min: 120,
                    max: 220,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        Height = newValue.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: NewWidget(
                  color: Color(0xFF1D1E33),
                  wiidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        weight.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Buttonss(
                            child: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Buttonss(
                            child: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: NewWidget(
                  color: Color(0xFF1D1E33),
                  wiidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        age.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Buttonss(
                            child: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Buttonss(
                            child: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain cb =
                  new CalculatorBrain(height: Height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result(
                            bmiResult: cb.calculateBMI(),
                            resultText: cb.getResult(),
                            interpretation: cb.getInterpretation(),
                          )));
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Center(
                child: Text(
                  'CALCULATE',
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

class DataInisdeFirstCard extends StatelessWidget {
  DataInisdeFirstCard({@required this.iicon, @required this.textt});
  final IconData iicon;
  final String textt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iicon,
          size: 80.0,
        ),
        Text(textt, style: kStyle),
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  NewWidget({@required this.color, this.wiidget, this.onPress});
  final Color color;
  final Widget wiidget;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: wiidget,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class Buttonss extends StatelessWidget {
  Buttonss({@required this.child, @required this.onPressed});
  final IconData child;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(child),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
    );
  }
}
