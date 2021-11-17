import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RaitingProduct extends StatelessWidget {
  const RaitingProduct({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50,
            width: 160,
            child: RatingBarIndicator(
              rating: 4,
              itemCount: 5,
              itemSize: 30.0,
              physics:const  BouncingScrollPhysics(),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
          ),
          const TextFrave(text: '124 Reviews', fontSize: 17, color: Colors.grey)
        ],
      ),
    );
  }
}