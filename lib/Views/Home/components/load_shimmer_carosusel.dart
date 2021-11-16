import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmerCarosusel extends StatelessWidget {
  const LoadingShimmerCarosusel({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) 
  {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor:const  Color(0xFFF7F7F7),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0)
        ),
      ),
    );
  }
}
// tạo hiệu ứng loading slide