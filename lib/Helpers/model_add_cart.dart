import 'package:animate_do/animate_do.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';

void modalAddCartSuccess( BuildContext context, String image ){

  showDialog(
    context: context,
    barrierColor: Colors.white60,
    builder: (context) {
      return BounceInDown(
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          content: SizedBox(
            height: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextFrave(text: 'Shop', fontSize: 22, color: Color(0xff006cF2), fontWeight: FontWeight.w500),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network('http://127.0.0.1/' + image, height: 80.0,),
                    const SizedBox(width: 10.0),
                    BounceInLeft(child: const Icon(Icons.check_circle_outlined, color: Colors.green, size: 80 )),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );

}