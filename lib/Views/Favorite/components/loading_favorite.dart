import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingFavoriteProduct extends StatelessWidget {
  const LoadingFavoriteProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: const Color(0xFFF5F5F5),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 90),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 25,
            mainAxisSpacing: 20,
            mainAxisExtent: 210),
        itemCount: 6,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}
