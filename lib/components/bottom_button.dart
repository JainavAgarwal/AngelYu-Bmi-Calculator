import 'package:flutter/material.dart';
import 'package:i_am_poor/components/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.Ontap,@required this.buttonTitle}){

  }
  final Function Ontap;
  final String buttonTitle;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Ontap,
      child: Container(
        padding: EdgeInsets.only(bottom: 20),

        child:Center(
            child: Text(buttonTitle,style: CalculateButtonStyle,)
        ),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}
