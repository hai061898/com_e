import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';

void modalLoading( BuildContext context, String message ){

  showDialog(
    context: context,
    barrierDismissible: false,//true là loại bằng chạm vào screen
    barrierColor: Colors.white60,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: SizedBox(
          height: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextFrave(text: 'Frave Shop', fontSize: 22, color: Color(0xff006cF2), fontWeight: FontWeight.w500),
              const SizedBox(height: 20),
              Row(
                children: [
                  const CircularProgressIndicator(backgroundColor: Color(0xff006cF2)),
                  const SizedBox(width: 10.0),
                  TextFrave(text: message, fontSize: 18),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );

}