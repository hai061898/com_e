import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';

void modalSuccess( BuildContext context, String title )
{
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
        content: SizedBox(
          height: 275,
          child: Column(
            children: [
              TextFrave(text: title, fontSize: 20, fontWeight: FontWeight.bold),
              const SizedBox(height: 20),
              const Icon(Icons.check_circle_outline_outlined, size: 180, color: Colors.green),
              TextButton(
                child: const TextFrave(text: 'Done', fontSize: 20,),
                onPressed: () => Navigator.of(context).pushReplacementNamed('signInPage')
              )
            ],
          ),
        ),
      );
    },
  );

}