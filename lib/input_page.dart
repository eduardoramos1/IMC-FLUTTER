import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'reusable_card.dart';
import 'icon_content.dart';

const activeCardColor = Color(0XFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;

  void updateColour(gender selectedGender) {
    if (selectedGender == gender.male) {
      maleCardColour = maleCardColour == inactiveCardColor ? activeCardColor : inactiveCardColor;
      femaleCardColour = inactiveCardColor;
    } else {
      femaleCardColour = femaleCardColour == inactiveCardColor ? activeCardColor : inactiveCardColor;
      maleCardColour = inactiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(gender.male);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: IconContent(icon: FontAwesomeIcons.mars, text: 'MASCULINO'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: IconContent(icon: FontAwesomeIcons.venus, text: 'FEMININO'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: activeCardColor),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: activeCardColor),
                ),
                Expanded(
                  child: ReusableCard(colour: activeCardColor),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 80,
          ),
        ],
      ),
    );
  }
}
