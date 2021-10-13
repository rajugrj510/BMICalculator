import 'package:bmicalclulator/screens/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'package:bmicalclulator/components/reusable_card.dart';
import 'package:bmicalclulator/components/BottomButton.dart';
import 'package:bmicalclulator/components/RoundIconButton.dart';
import 'package:bmicalclulator/calculation.dart';

//enum
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selected_gender = null;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //top row of tow male and female container
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPressed: () {
                    setState(() {
                      selected_gender = Gender.male;
                    });
                  },
                  colour: selected_gender == Gender.male
                      ? kactive_box_colour
                      : kinactive_card_color,
                  cardChild:
                      IconContent(icon: FontAwesomeIcons.mars, label: 'Male'),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPressed: () {
                    setState(() {
                      selected_gender = Gender.female;
                    });
                  },
                  colour: selected_gender == Gender.female
                      ? kactive_box_colour
                      : kinactive_card_color,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'Female',
                  ),
                ),
              ),
            ],
          )),
          //middle container of slider
          Expanded(
            child: ReusableCard(
              onPressed: () {},
              colour: kactive_box_colour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: ktext_label,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: ktext_style,
                      ),
                      Text(
                        'cm',
                        style: ktext_label,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double new_value) {
                          setState(() {
                            height = new_value.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          //Bottom container of input bottom
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: () {},
                    colour: kactive_box_colour,
                    cardChild: Column(
                      children: [
                        Text(
                          'Weight',
                          style: ktext_label,
                        ),
                        Text(
                          weight.toString(),
                          style: ktext_style,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
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
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {},
                    colour: kactive_box_colour,
                    cardChild: Column(
                      children: [
                        Text(
                          'Age',
                          style: ktext_label,
                        ),
                        Text(
                          age.toString(),
                          style: ktext_style,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
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
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            button_tile: 'CALCULATE',
            onTap: () {
              Calculation cal = Calculation(height: height, weight: weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    bmi_result: cal.calulateBMI(),
                    result_text: cal.get_result(),
                    interpretation: cal.get_interpretation(),
                  )));
            },
          ),
          //Bottom container of calulate botton
        ],
      ),
    );
  }
}

