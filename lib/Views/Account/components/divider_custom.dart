import 'package:flutter/material.dart';

class DividerC extends StatelessWidget {
  final Size size;

  const DividerC({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 65.0, right: 25.0),
      child: Container(
        height: 1,
        width: size.width,
        color: Colors.grey[300],
      ),
    );
  }
}
