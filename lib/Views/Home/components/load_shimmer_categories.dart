import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmerCategories extends StatelessWidget {
  const LoadingShimmerCategories({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) 
  {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor:const Color(0xFFF7F7F7),
      child: Container(
        color: Colors.white,
      ),
    );
  }

}
// hiệu ứng cho loading category 