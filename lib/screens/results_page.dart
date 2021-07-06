import 'package:flutter/material.dart';
import 'package:i_am_poor/components/constants.dart';
import 'package:i_am_poor/components/reusable_card.dart';
import 'package:i_am_poor/components/bottom_button.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult,@required this.resultText,@required this.interpretation}){

  }
final String bmiResult;
final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI CALCULATOR"),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 30,left: 50),

              child: Text('Your Result',style: TitleTextStyle,),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: activecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText,style: resultTextStyle),
                    Text(bmiResult,style: bmiTextStyle,),
                    Text(interpretation,
                    style: bodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    BottomButton(Ontap:(){
                      Navigator.pop(context);
                    }, buttonTitle: "Re-Calculate")


                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
