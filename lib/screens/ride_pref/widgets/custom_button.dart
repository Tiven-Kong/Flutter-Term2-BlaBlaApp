import 'package:flutter/material.dart';
import 'package:flutterterm2/theme/theme.dart';


class CustomButton extends StatelessWidget {
  CustomButton({super.key , required this.bColor , required this.text , required this.onPressed });
  final VoidCallback? onPressed;
  final Color bColor;
  final String text ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ElevatedButton(onPressed:onPressed, child:Text(text) ,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(bColor),
        ), ),
    );
  }
}
