import 'package:flutter/material.dart';

class ImageProduct extends StatelessWidget {
  final String? imageProduct;
  final String? uidProduct;

  const ImageProduct({Key? key,this.uidProduct, this.imageProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '$uidProduct',
      child: SizedBox(
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Image.network('http://127.0.0.1/' + imageProduct!),
      ),
    );
  }
}
