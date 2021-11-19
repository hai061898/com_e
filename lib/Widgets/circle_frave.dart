import 'package:flutter/material.dart';


class CircleFrave extends StatelessWidget {

  final double radius;
  final Color color;
  final Widget child;

  const CircleFrave({ 
    Key? key,
    this.radius = 60.0, 
    this.color = const Color(0xff006cf2), 
    required this.child 
  }):super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
      child: child
    );
  }
}