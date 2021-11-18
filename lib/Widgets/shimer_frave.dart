import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerFrave extends StatelessWidget
{
  const ShimmerFrave({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: const Color(0xFFF7F7F7),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}