import 'package:boilerplate/utils/styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialRoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final String logo;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  const SocialRoundedButtonWidget({
    Key? key,
    required this.buttonText,
    required this.logo,
    required this.buttonColor,
    this.textColor = Colors.white,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.white,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
            side: BorderSide(color: blue)
          )),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/$logo.svg"),
          SizedBox(width: 10,),
          Text(
            buttonText,
            style: TextStyle(fontSize: 18,color: blue),
          ),
        ],
      ),
    );
  }
}
