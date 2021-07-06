import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_am_poor/components/reusable_card.dart';
import 'package:i_am_poor/components/icon_content.dart';
import 'package:i_am_poor/components/constants.dart';
import 'package:i_am_poor/screens/results_page.dart';
import 'package:i_am_poor/components/bottom_button.dart';
import 'package:i_am_poor/components/calculator_brain.dart';
var t = 1;
enum gender {male,female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender g;
  int height = 180;
  int weight = 60,age = 17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                    OnPressed :(){
                      setState(() {
                        g = gender.male;
                      });
                    },
                colour: g==gender.male?activecardcolor:inactivecardcolor,
                cardChild: IconMF(icon : FontAwesomeIcons.mars, label:"Male"),
              )),
              Expanded(
                  child: ReusableCard(
                    OnPressed :(){
                      setState(() {
                        g = gender.female;
                      });
                    },
                colour: g==gender.female?activecardcolor:inactivecardcolor,
                cardChild: IconMF(icon : FontAwesomeIcons.venus, label:"Female"),
              ))
            ],
          )),
          Expanded(
              child: ReusableCard(
            colour: Color(0xFF1D1E33),
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Height",style: labelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(), style: HeavyStyle
                    ),
                    Text(" cm",style: labelTextStyle,),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x1fEB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });

                    },
                    value: height.toDouble(),
                    min:120,
                    max: 300,

                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                colour: Color(0xFF1D1E33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("WEIGHT",style: labelTextStyle),
                    Text(weight.toString(),style: HeavyStyle),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          pressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                          icon: FontAwesomeIcons.plus,
                        ),
                        SizedBox(width: 10,),
                        RoundIconButton(
                          pressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                          icon: FontAwesomeIcons.minus,
                        ),
                      ],
                    ),


                  ],
                ),
              )),
              Expanded(
                  child: ReusableCard(
                colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("AGE",style: labelTextStyle),
                        Text(age.toString(),style: HeavyStyle),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              pressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                            SizedBox(width: 10,),
                            RoundIconButton(
                              pressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ],
                        ),


                      ],
                    ),              ))
            ],
          )),
          BottomButton(buttonTitle: 'Calculate',Ontap: (){
            CalculatorBrain calc = CalculatorBrain(height:height,weight:weight);

            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ResultsPage(
                  bmiResult: calc.calculateBmi(),
                    resultText: calc.getResults(),
                  interpretation: calc.getInterpretation(),
                ),
            )
            );
          },)
        ],
      ),
    );
  }
}




