import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmerProducts extends StatelessWidget {
  const LoadingShimmerProducts({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) 
  {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor:const Color(0xFFF7F7F7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 250,
            width: 190,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0)
            ),
          ),
          Container(
            height: 250,
            width: 190,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0)
            ),
          ),
        ],
      )
    );
  }
}