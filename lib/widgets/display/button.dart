import 'package:flutter/material.dart';
import 'package:flutterterm2/screens/ride_pref/widgets/custom_button.dart';
import 'package:flutterterm2/theme/theme.dart';

class Buttondisplay extends StatelessWidget {
  const Buttondisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 400,
      child: Column(
        children: [

          CustomButton(bColor: BlaColors.backgroundAccent, text: "Contact Volodia", onPressed:(){

      }),
      CustomButton(bColor: BlaColors.primary, text: "Request to book", onPressed:(){

      }),
        ],
      ),
    );

  }
}
