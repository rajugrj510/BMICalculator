import 'dart:math';
class Calculation {
  Calculation({required this.height, required this.weight}){}

  final int height;
  final int weight;
  double _bmi = 0.0;

  String calulateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String get_result(){
    if(_bmi >= 25){
      return 'Overweight';
    }else if(_bmi > 18.5){
      return 'Normal';
    }else {
      return 'Underweight';
    }
  }

  String get_interpretation(){
    if(_bmi >= 25){
      return 'You have high fat';
    }else if(_bmi > 18.5){
      return 'Great Job, You have normal body weight.';
    }else {
      return 'You have lower body weight, eat more!';
    }
  }
}