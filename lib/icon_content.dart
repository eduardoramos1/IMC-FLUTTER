import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);

const sizedBox = SizedBox(
  height: 15,
);

class IconContent extends StatelessWidget {
  IconContent({this.text, @required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80),
        sizedBox,
        Text(
          text,
          style: textStyle,
        )
      ],
    );
  }
}
