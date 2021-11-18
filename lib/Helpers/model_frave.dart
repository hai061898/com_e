import 'package:e_com/Widgets/btn_frave.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';

void modalFrave( BuildContext context, String message )
{
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white,
    builder: (context) {
      return AlertDialog(
        elevation: 0,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(Icons.check_circle_rounded, size: 100, color: Colors.green),
            const SizedBox(height: 10),
            TextFrave(text: message, fontSize: 19,),
            const SizedBox(height: 20),
            BtnFrave(
              text: 'Continue',
              fontSize: 19,
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      );
    },
  );

}