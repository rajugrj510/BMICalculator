import 'package:bmicalclulator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmicalclulator/components/reusable_card.dart';
import 'package:bmicalclulator/components/BottomButton.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmi_result, required this.result_text, required this.interpretation});
  final String bmi_result;
  final String result_text;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',
              style: klarge_text_style,
              ),
            ),),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result_text.toUpperCase(),
                  style: kresult_text_style,
                  ),
                  Text(
                    bmi_result,
                    style: kBMI_text_style,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kbody_text_style,
                  ),
                ],
              ),
              colour: kactive_box_colour,
              onPressed: () {  },),
          ),
          BottomButton(
            button_tile: 'Re-Calculate',
              onTap: (){
              Navigator.pop(context);
              },),
              ],
      ),
    );
  }
}
