import 'package:flutter/material.dart';
import 'package:bmicalculators/Components/ReusableCard.dart';
import '../Components/ColumnGender.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculators/constants.dart';
import '../Screens/result_page.dart';
import '../Components/bottom_button.dart';
import '../Components/round_icon_button.dart';
import 'package:bmicalculators/calculator_brain.dart';

//These are the gender Enums
enum Gender {
  male,
  female,
}

int height = 180;
int weight = 60;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('BMI CALCULATOR'),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Widget for Male
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          genderSelected = Gender.male;
                        });
                      },
                      cardChild: ColumnGender(
                        gender: 'MALE',
                        iconic: FontAwesomeIcons.mars,
                      ),
                      colour: genderSelected == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                    ),
                  ),
                  //Widget for Female
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          genderSelected = Gender.female;
                        });
                      },
                      cardChild: ColumnGender(
                          gender: 'FEMALE', iconic: FontAwesomeIcons.venus),
                      colour: genderSelected == Gender.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                    ),
                  ),
                ],
              ),
            ),
            //This is the Centre Slider height widget.
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kIntTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          overlayColor: Color(0x29EB1555),
                          thumbColor: Color(0xFFEB1555)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 200.0,
                        onChanged: (double newValue) {
                          setState(
                            () {
                              height = newValue.round();
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
                colour: kActiveCardColour,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kIntTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kActiveCardColour,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kIntTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ],
                      ),
                      colour: kActiveCardColour,
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonText: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ));
  }
}
