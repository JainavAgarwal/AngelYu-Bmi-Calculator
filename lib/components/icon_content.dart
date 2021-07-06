import 'package:flutter/material.dart';
import 'package:i_am_poor/components/constants.dart';

class IconMF extends StatelessWidget {
  @override
  IconMF({@required this.icon,@required this.label}){

  }
  final IconData icon;
  final String label;
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: labelTextStyle,
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.pressed}){

  }
  final IconData icon;
  final Function pressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: pressed,
      child:Icon(icon),
      elevation:6,
      constraints:BoxConstraints.tightFor(
        width:56,
        height: 56,
      ),

      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      );
  }
}
