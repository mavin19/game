import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget{
  final VoidCallback press;
  final Widget text;

  const GoBackButton(this.press, this.text) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: TextButton(child: text, onPressed: press,),
    );
  }

}