import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'claculate_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = kInActiveCardColor;
  Color femaleCardColor = kInActiveCardColor;
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour: selectedGender == Gender.male ? kActiveCardColor : kInActiveCardColor,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.mars,
                  label: 'Male',
                ),
              )),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female ? kActiveCardColor : kInActiveCardColor,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.venus,
                  label: 'Female',
                ),
              )),
            ],
          )),
          Expanded(child: ReusableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height',
                  style: kLabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
          Expanded(child: Row(
            children: [
              Expanded(child:
              ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kLabelStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: Icons.remove, onClick: () {
                          setState(() {
                            weight--;
                          });
                        },),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(icon: Icons.add, onClick: () {
                          setState(() {
                            weight++;
                          });
                        },),
                      ],
                    )
                  ],
                ),
              )
              ),
              Expanded(child:
              ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLabelStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: Icons.remove, onClick: () {
                          setState(() {
                            age--;
                          });
                        },),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(icon: Icons.add, onClick: () {
                          setState(() {
                            age++;
                          });
                        },),
                      ],
                    )
                  ],
                ),
              )
              ),
            ],
          )),
          BottomButton(buttonTitle: 'CALCULATE', onTap: () {
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            ),));
          },)
        ],
      )
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({this.icon, this.onClick});
  final IconData? icon;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: Color(0xFF4C4F5E),
          ),
        child: Icon(icon, color: Colors.white,),
      ),
    );
  }
}
