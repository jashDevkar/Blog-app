import 'package:blog_app/core/pallete.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Function() onPressCallBack;
  final String buttonText;
  const SubmitButton({super.key, required this.onPressCallBack,required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
            colors: [Pallete.gradient1, Pallete.gradient2],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight),
      ),
      child: TextButton.icon(
        onPressed: onPressCallBack,
        label: Text(buttonText),
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Pallete.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(10.0)),
      ),
    );
  }
}
