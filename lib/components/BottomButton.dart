import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.button_tile, required this.onTap});
  final VoidCallback onTap;
  final String button_tile;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
              button_tile,
              style: kbutton_text_style
          ),
        ),
        padding: EdgeInsets.only(bottom: 20.0),
        color: kbottom_container_colour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottom_container_height,
      ),
    );
  }
}