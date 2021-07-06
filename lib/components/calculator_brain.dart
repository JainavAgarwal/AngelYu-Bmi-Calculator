import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({this.height,this.weight}){

  }
  double bmi;
  final int weight,height;
  String calculateBmi(){
    bmi = weight/pow(height/100,2);
    return bmi.toStringAsFixed(1);
  }
  String getResults(){
    if(bmi>=25){
      return("Overweight");
    }
    else if(bmi>18.5){
      return("Normal");
    }
    else{
      return("Underweight");
    }
  }
  String getInterpretation(){
    if(bmi>=25){
      return("You have a higher than normal body weight. Try to exercise more");
    }
    else if(bmi>18.5){
      return("You have a normal body weight. Keep up the good spirit");
    }
    else{
      return("You have a lower than normal body weight. You should eat a bit more");
    }
  }
}
