import 'package:flutter/material.dart';

class Button_Widget extends StatelessWidget {
  final String text;
  Function onTap;

  Button_Widget({required this.text, this.onTap = _defaulOnTap });

  static void _defaulOnTap(){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 150,
      height: 50,
      child: ElevatedButton(
          onPressed: onTap as void Function(),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black
            ),
          ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
      ),
    );
  }
}
